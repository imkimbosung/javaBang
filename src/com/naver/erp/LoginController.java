package com.naver.erp;

import java.util.*;
import javax.servlet.http.*;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller

@ControllerAdvice // 메소드 실행 이전에 즉, 해당 클라스 내부에서 발생하는 모든 에러를 잡아준다. ( 405, 400 에러등 )
				  // 에러 발생시 @ExceptionHandler의 메소드를 호출한다

public class LoginController {


	@Autowired
	private LoginService loginService;
	@Autowired
	private BuyerService buyerService;
	@Autowired
	private MasterService masterService;


	@RequestMapping(value = "/buyer/loginForm.do")
	public ModelAndView loginForm( HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/loginForm.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		String uri=(String)session.getAttribute("buyer_uri");
		if(uri==null) {uri="/javaBang/buyer/loginForm.do"; session.setAttribute("buyer_uri", uri);}
		
		return mav;
	}


	@RequestMapping(value = "/buyer/loginProc.do" // 접속하는 URL 주소 설정
			, method = RequestMethod.POST // 접속하는 파일전송값 전송 방법 설정
			, produces = "application/json;charset=UTF-8" // 응답 데이터 종류 설정
	)
	@ResponseBody
	public JSONObject loginProc(@RequestParam(value = "b_id") String b_id, @RequestParam(value = "b_pwd") String b_pwd // 없으면 400 에러
			,HttpSession session,@RequestParam(value = "master"  , required = false) String master,  HttpServletResponse response
			, @RequestParam(value="is_login" ,required=false) String is_login

	) {

		JSONObject jsonObject = new JSONObject();

		Map<String, String> map = new HashMap<String, String>();
		map.put("b_id", b_id);
		map.put("b_pwd", b_pwd);


		int buyerCnt = 0;
		
		try {
			
			// buyer로그인
			if(master == null || master.equals("false")) {
				buyerCnt = this.loginService.getBuyerCnt(map);
				
				if (buyerCnt == 1) {
					
					// 로그인 되지 않을 때
					
					// 정지 유무 가져오기 =========================================
					List<Map<String,String>> stopBuyer = this.masterService.getStopCustomer("buyer");
					for(int i = 0; i < stopBuyer.size() ; i++) {
						if(b_id.equals(stopBuyer.get(i).get("reg_id")) ){
							
							// enddate 다음날이 되면 자동으로 삭제
							if(stopBuyer.get(i).get("real_end_date").equals(stopBuyer.get(i).get("today")) ) {

								MasterStopCustomerDTO masterStopCustomerDTO = new MasterStopCustomerDTO();
								String reg_no = String.valueOf(stopBuyer.get(i).get("reg_no"));
								masterStopCustomerDTO.setStopNo(Integer.parseInt(reg_no));
								masterStopCustomerDTO.setTableName(stopBuyer.get(i).get("reg_table"));
								
								this.masterService.deleteStopCustomer(masterStopCustomerDTO);
								break;
							}
							jsonObject.put("stopBuyer", stopBuyer.get(i));
							jsonObject.put("buyerCnt", -3);
							return jsonObject;
						}
						
					}
					//============================================================
					// HttpSession 객체에 아이디를 저장해 놓는다.
					session.setAttribute("b_id", b_id);					
					
					
					if (b_id != null) {
						BuyerDTO buyerDTO =  this.buyerService.getBuyerIdDTO(b_id);
						 session.setAttribute("b_no", buyerDTO.getB_no()); 
					}
					
					// 아이디 암호 기억 기능
					if(is_login!=null) {
						Cookie cookie_sid = new Cookie("b_id", b_id);
						cookie_sid.setMaxAge(60*60*24);
						response.addCookie(cookie_sid);
						
						Cookie cookie_spwd = new Cookie("b_pwd", b_pwd);
						cookie_spwd.setMaxAge(60*60*24);
						response.addCookie(cookie_spwd);
						
					}else {

						Cookie cookie_sid = new Cookie("b_id", null);
						cookie_sid.setMaxAge(0);
						response.addCookie(cookie_sid);
						
						Cookie cookie_spwd = new Cookie("b_pwd", null);
						cookie_spwd.setMaxAge(0);
						response.addCookie(cookie_spwd);
					}
				}
				
			// 관리자 로그인( 로그인화면이 다름 )
			}else if(master.equals("true")) {
				
				buyerCnt = this.loginService.getMasterCnt(map);
				String m_auth = this.loginService.getMasterAuth(map);
				
				if (buyerCnt == 1) {
					// HttpSession 객체에 master id저장
					session.setAttribute("m_id", b_id);	
					session.setAttribute("m_auth", m_auth);
				}
			}
			
			
			

		}catch(Exception e) {
			System.out.println("<접속실패> [접속 URL]-> /loginProc.do [호출 메소드] -> LoginController.loginProc(~)");
			System.out.println(e.getMessage());
			
			buyerCnt = -1;
			
			jsonObject.put("buyerCnt", buyerCnt);
		}

		jsonObject.put("buyerCnt", buyerCnt);
		return jsonObject;
	}
	
	@RequestMapping(value = "/buyer/signupForm.do")
	public ModelAndView signupForm( ) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/signupForm.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		return mav;
	}
	
	@RequestMapping(value = "/buyer/signupProc.do" // 접속하는 URL 주소 설정
			, method = RequestMethod.POST // 접속하는 파일전송값 전송 방법 설정
			, produces = "application/json;charset=UTF-8" // 응답 데이터 종류 설정
	)
	@ResponseBody
	public int signupProc(HttpSession session, BuyerSignupDTO buyerSignupDTO
	) {
		int buyerCnt = 0;		
		try {
			String b_jumin1 = buyerSignupDTO.getB_jumin1();
			String b_jumin2 = buyerSignupDTO.getB_jumin2();
			String b_jumin = b_jumin1 + b_jumin2;
			buyerSignupDTO.setB_jumin(b_jumin);
			buyerCnt = this.loginService.insertBuyerInfo(buyerSignupDTO);
		}catch(Exception e) {
			System.out.println(e.getMessage());			
			buyerCnt = -2;
		}
		return buyerCnt;
	}
	
	// ------------------------------------------------------
	// 판매자 부분
	// ------------------------------------------------------
	
	
	@RequestMapping(value = "/seller/loginForm.do")
	public ModelAndView loginSellerForm( ) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/loginForm.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		return mav;
	}


	@RequestMapping(value = "/seller/loginProc.do" // 접속하는 URL 주소 설정
			, method = RequestMethod.POST // 접속하는 파일전송값 전송 방법 설정
			, produces = "application/json;charset=UTF-8" // 응답 데이터 종류 설정
	)
	@ResponseBody
	public JSONObject loginSellerProc(@RequestParam(value = "s_id") String s_id, @RequestParam(value = "s_pwd") String s_pwd // 없으면 400 에러
			,HttpSession session, HttpServletResponse response , @RequestParam(value="is_login" ,required=false) String is_login
	) {

		JSONObject jsonObject = new JSONObject();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("s_id", s_id);
		map.put("s_pwd", s_pwd);

		// ------------------------------------------------------
		// 로그인 아이디, 암호 존재 개수 저장변수 선언
		// ------------------------------------------------------
		int sellerCnt = 0;
		
		try {

				sellerCnt = this.loginService.getSellerCnt(map);
				
				if (sellerCnt == 1) {
					// HttpSession 객체에 아이디를 저장해 놓는다.
					
					
					// 정지 유무 가져오기 =========================================
					List<Map<String,String>> stopSeller = this.masterService.getStopCustomer("seller");
					for(int i = 0; i < stopSeller.size() ; i++) {
						if(s_id.equals(stopSeller.get(i).get("reg_id")) ){
							
							// enddate 다음날이 되면 자동으로 삭제
							if(stopSeller.get(i).get("real_end_date").equals(stopSeller.get(i).get("today")) ) {

								MasterStopCustomerDTO masterStopCustomerDTO = new MasterStopCustomerDTO();
								String reg_no = String.valueOf(stopSeller.get(i).get("reg_no"));
								masterStopCustomerDTO.setStopNo(Integer.parseInt(reg_no));
								masterStopCustomerDTO.setTableName(stopSeller.get(i).get("reg_table"));
								
								this.masterService.deleteStopCustomer(masterStopCustomerDTO);
								break;
							}
							jsonObject.put("stopSeller", stopSeller.get(i));
							jsonObject.put("sellerCnt", -3);
							return jsonObject;
						}
						
					}
					//============================================================
					
					session.setAttribute("s_id", s_id);
					if(is_login!=null) {
						Cookie cookie_sid = new Cookie("s_id", s_id);
						cookie_sid.setMaxAge(60*60*24);
						response.addCookie(cookie_sid);
						
						Cookie cookie_spwd = new Cookie("s_pwd", s_pwd);
						cookie_spwd.setMaxAge(60*60*24);
						response.addCookie(cookie_spwd);
						
					}else {
						// 웹 서버는 클라이언트의 쿠키값을 삭제하지 못하기 때문에, 새로운 null값으로 덮어 씌운다.
						Cookie cookie_sid = new Cookie("s_id", null);
						cookie_sid.setMaxAge(0);
						response.addCookie(cookie_sid);
						
						Cookie cookie_spwd = new Cookie("s_pwd", null);
						cookie_spwd.setMaxAge(0);
						response.addCookie(cookie_spwd);
					}
				}


		}catch(Exception e) {
			System.out.println("<접속실패> [접속 URL]-> /loginProc.do [호출 메소드] -> LoginController.loginSellerProc(~)");
			System.out.println(e.getMessage());
			
			sellerCnt = -1;
			jsonObject.put("sellerCnt", sellerCnt);
		}
		jsonObject.put("sellerCnt", sellerCnt);
		return jsonObject;
	}
	
	
	@RequestMapping(value = "/seller/signupForm.do")
	public ModelAndView signupSellForm( ) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/signupForm.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		return mav;
	}
	
	@RequestMapping(value = "/seller/signupProc.do" // 접속하는 URL 주소 설정
			, method = RequestMethod.POST // 접속하는 파일전송값 전송 방법 설정
			, produces = "application/json;charset=UTF-8" // 응답 데이터 종류 설정
	)
	@ResponseBody
	public int signupSellProc(HttpSession session, SellerSignupDTO sellerSignupDTO
	) {
		int sellerCnt = 0;		
		try {
			String s_jumin1 = sellerSignupDTO.getS_jumin1();
			String s_jumin2 = sellerSignupDTO.getS_jumin2();
			String s_jumin = s_jumin1 + s_jumin2;
			sellerSignupDTO.setS_jumin(s_jumin);
			
			sellerCnt = this.loginService.insertSellerInfo(sellerSignupDTO);
			
			
		}catch(Exception e) {
			System.out.println(e.getMessage());			
			sellerCnt = -2;
		}
		return sellerCnt;
	}
	
	// ------------------------------------------------------
	// 공인중개사 부분
	// ------------------------------------------------------
		
		
		@RequestMapping(value = "/realtor/loginForm.do")
		public ModelAndView loginRealtorForm( ) {

			ModelAndView mav = new ModelAndView();
			mav.setViewName("/realtor/loginForm.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
			return mav;
		}


		@RequestMapping(value = "/realtor/loginProc.do" // 접속하는 URL 주소 설정
				, method = RequestMethod.POST // 접속하는 파일전송값 전송 방법 설정
				, produces = "application/json;charset=UTF-8" // 응답 데이터 종류 설정
		)
		@ResponseBody
		public JSONObject loginRealtorProc(@RequestParam(value = "r_id") String r_id, @RequestParam(value = "r_pwd") String r_pwd // 없으면 400 에러
				,HttpSession session ,  HttpServletResponse response , @RequestParam(value="is_login" ,required=false) String is_login
		) {

			JSONObject jsonObject = new JSONObject();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("r_id", r_id);
			map.put("r_pwd", r_pwd);

			// ------------------------------------------------------
			// 로그인 아이디, 암호 존재 개수 저장변수 선언
			// ------------------------------------------------------
			int realtorCnt = 0;
			
			try {

					realtorCnt = this.loginService.getRealtorCnt(map);
					
					if (realtorCnt == 1) {
						

						// 정지 유무 가져오기 =========================================
						List<Map<String,String>> stopRealtor = this.masterService.getStopCustomer("realtor");
						for(int i = 0; i < stopRealtor.size() ; i++) {
							if(r_id.equals(stopRealtor.get(i).get("reg_id")) ){
								
								// enddate 다음날이 되면 자동으로 삭제
								if(stopRealtor.get(i).get("real_end_date").equals(stopRealtor.get(i).get("today")) ) {

									MasterStopCustomerDTO masterStopCustomerDTO = new MasterStopCustomerDTO();
									String reg_no = String.valueOf(stopRealtor.get(i).get("reg_no"));
									masterStopCustomerDTO.setStopNo(Integer.parseInt(reg_no));
									masterStopCustomerDTO.setTableName(stopRealtor.get(i).get("reg_table"));
									
									this.masterService.deleteStopCustomer(masterStopCustomerDTO);
									break;
								}
								jsonObject.put("stopRealtor", stopRealtor.get(i));
								jsonObject.put("realtorCnt", -3);
								return jsonObject;
							}
							
						}
						//============================================================
						
						// HttpSession 객체에 아이디를 저장해 놓는다.
						session.setAttribute("r_id", r_id);		
						
						if(is_login!=null) {
							Cookie cookie_rid = new Cookie("r_id", r_id);
							cookie_rid.setMaxAge(60*60*24);
							response.addCookie(cookie_rid);
							
							Cookie cookie_rpwd = new Cookie("r_pwd", r_pwd);
							cookie_rpwd.setMaxAge(60*60*24);
							response.addCookie(cookie_rpwd);
							
						}else {

							Cookie cookie_rid = new Cookie("r_id", null);
							cookie_rid.setMaxAge(0);
							response.addCookie(cookie_rid);
							
							Cookie cookie_rpwd = new Cookie("r_pwd", null);
							cookie_rpwd.setMaxAge(0);
							response.addCookie(cookie_rpwd);
						}
					}


			}catch(Exception e) {
				System.out.println("<접속실패> [접속 URL]-> /loginProc.do [호출 메소드] -> LoginController.loginSellerProc(~)");
				System.out.println(e.getMessage());
				
				realtorCnt = -1;
				jsonObject.put("realtorCnt", realtorCnt);
			}

			jsonObject.put("realtorCnt", realtorCnt);
			return jsonObject;
		}

		
		
	
	
	// ------------------------------------------------------
	// 로그아웃
	// ------------------------------------------------------
	
	
	@RequestMapping(value = "/logout.do")
	public ModelAndView logout( HttpSession session) {

		
		// HttpSession 객체에 저장된 로그인 아이디 삭제하기(없는것을 지워도 에러안남)
		session.removeAttribute("b_id");
		//session.removeAttribute("uri");
	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("logout.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		
		System.out.println("<접속성공> [접속 URI] -> logout.do");
		
		return mav;
	}
	
	@RequestMapping(value = "/seller/logout.do")
	public ModelAndView sellerLogout( HttpSession session) {

		
		// HttpSession 객체에 저장된 로그인 아이디 삭제하기(없는것을 지워도 에러안남)
		session.removeAttribute("s_id");
		session.removeAttribute("uri");
	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sellerLogout.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		
		System.out.println("<접속성공> [접속 URI] -> logout.do");
		
		return mav;
	}
	
	@RequestMapping(value = "/realtor/logout.do")
	public ModelAndView realtorLogout( HttpSession session) {

		
		// HttpSession 객체에 저장된 로그인 아이디 삭제하기(없는것을 지워도 에러안남)
		session.removeAttribute("r_id");
		session.removeAttribute("uri");
	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("realtorLogout.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		
		System.out.println("<접속성공> [접속 URI] -> logout.do");
		
		return mav;
	}
	
	@RequestMapping(value = "/master/logout.do")
	public ModelAndView masterLogout( HttpSession session) {

		
		// HttpSession 객체에 저장된 로그인 아이디 삭제하기(없는것을 지워도 에러안남)
		session.removeAttribute("m_id");
		session.removeAttribute("uri");
	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("masterLogout.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		
//		System.out.println("<접속성공> [접속 URI] -> logout.do");
		
		return mav;
	}
	
	@RequestMapping(value = "/logoutForm.do")
	public ModelAndView logoutForm( HttpSession session, @RequestParam(value = "logout") String logout ) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("logoutForm.jsp"); 
		String b_id = (String)session.getAttribute("b_id");
		String s_id = (String)session.getAttribute("s_id");
		String m_id = (String)session.getAttribute("m_id");
		String r_id = (String)session.getAttribute("r_id");
		String uri = (String)session.getAttribute("uri");

		if(b_id != null && logout.equals("buyer")) {
			mav.addObject("b_id", b_id);
			session.removeAttribute("b_id");
			session.removeAttribute("b_no");

		}else if(s_id != null && logout.equals("seller")) {
			mav.addObject("s_id", s_id);
			session.removeAttribute("s_id");

		}else if(r_id != null && logout.equals("realtor")) {
			mav.addObject("r_id", r_id);
			session.removeAttribute("r_id");

		}else if(m_id != null && logout.equals("master"))  {
			mav.addObject("m_id", m_id);
			session.removeAttribute("m_id");
			session.removeAttribute("m_auth");

		}

			session.removeAttribute("uri");
				
		
		System.out.println("<접속성공> [접속 URI] -> logoutlogoutForm.do");
		
		return mav;
	}
	
//	
//	// @@RequestMapping이 붙은 메소드 호출시 예외 발상하면 호출 되는 메소드
//	@ExceptionHandler(Exception.class)
//	public String handleException( HttpServletRequest request) {
//		return "logout.jsp";
//	}
//	
	
	

}
