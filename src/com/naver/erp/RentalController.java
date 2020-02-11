package com.naver.erp;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.*;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RentalController {
	
	@Autowired
	private RentalService rentalService;
	@Autowired
	private BuyerService buyerService;
	@Autowired
	private MasterService masterService;
	
	
	@RequestMapping(value = "/rental/test.do")
	public ModelAndView test() 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/test.jsp");
		return mav;
	}
	
	
	/*업체측 메소드*/
	/*메인페이지*/
	@RequestMapping(value = "/rental/rentalHomeForm.do")
	public ModelAndView gorentalHomeForm() 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalHomeForm.jsp");
		return mav;
	}
	
	/*로그인 페이지*/
	@RequestMapping(value = "/rental/rentalLogin.do")
	public ModelAndView gorentalLogin(HttpSession session) 
	{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/rental/rentalLogin.jsp");
		
		return mav;
	}
	
	/*로그인 ajax*/
	@RequestMapping
	(
		value="/rental/rentalLoginProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public JSONObject getrentalCompany(RentalCompanyDTO rentalCompanyDTO,HttpSession session, @RequestParam(value="is_login" ,required=false) String is_login,HttpServletResponse response)
	{
		int getIdPwdcnt=0;
		JSONObject jsonObject = new JSONObject();
		
		try
		{
			//System.out.println("getrentalCompany호출");
			getIdPwdcnt=this.rentalService.getrentalCompany(rentalCompanyDTO);
			
			// 정지 유무 가져오기 =========================================
			List<Map<String,String>> stopRental= this.masterService.getStopCustomer("rental");
			for(int i = 0; i < stopRental.size() ; i++) {
				if(rentalCompanyDTO.getRt_id().equals(stopRental.get(i).get("reg_id")) ){
					
					// enddate 다음날이 되면 자동으로 삭제
					if(stopRental.get(i).get("real_end_date").equals(stopRental.get(i).get("today")) ) {

						MasterStopCustomerDTO masterStopCustomerDTO = new MasterStopCustomerDTO();
						String reg_no = String.valueOf(stopRental.get(i).get("reg_no"));
						masterStopCustomerDTO.setStopNo(Integer.parseInt(reg_no));
						masterStopCustomerDTO.setTableName(stopRental.get(i).get("reg_table"));
						
						this.masterService.deleteStopCustomer(masterStopCustomerDTO);
						break;
					}
					jsonObject.put("stopRental", stopRental.get(i));
					jsonObject.put("getIdPwdcnt", -4);
					return jsonObject;
				}
				
			}
			//============================================================
			
			
			
			session.setAttribute("rt_pwd",rentalCompanyDTO.getRt_pwd());
			RentalCompanyDTO rt_reg=this.rentalService.getRt_no(rentalCompanyDTO);
			session.setAttribute("rt_no",rt_reg.getRt_no());
			session.setAttribute("rt_id",rt_reg.getRt_id());
			session.setAttribute("rt_comname",rt_reg.getRt_comname());
			
			if (getIdPwdcnt == 1) {
				
				
				
				if(is_login!=null) {
					
					String rt_id=(String)session.getAttribute("rt_id");
					Cookie cookie_rtid = new Cookie("rt_id",rt_id);
					cookie_rtid.setMaxAge(60*60*24);
					response.addCookie(cookie_rtid);
					
					String rt_pwd=(String)session.getAttribute("rt_pwd");
					Cookie cookie_rtpwd = new Cookie("rt_pwd", rt_pwd);
					cookie_rtpwd.setMaxAge(60*60*24);
					response.addCookie(cookie_rtpwd);
					
				}else {
					// 웹 서버는 클라이언트의 쿠키값을 삭제하지 못하기 때문에, 새로운 null값으로 덮어 씌운다.
					Cookie cookie_rtid = new Cookie("rt_id", null);
					cookie_rtid.setMaxAge(0);
					response.addCookie(cookie_rtid);
					
					Cookie cookie_rtpwd = new Cookie("rt_pwd", null);
					cookie_rtpwd.setMaxAge(0);
					response.addCookie(cookie_rtpwd);
				}
		}}
		catch(Exception e)
		{
			System.out.print("getrentalCompany에러발생");
			System.out.print(e.getMessage());
			getIdPwdcnt=-3;
			jsonObject.put("getIdPwdcnt", getIdPwdcnt);
		}
		jsonObject.put("getIdPwdcnt", getIdPwdcnt);
		return jsonObject;
	}
	
	
	/*아이디비번찾기 페이지*/
	@RequestMapping(value = "/rental/forgetRentalId.do")
	public ModelAndView rentalforgetId() 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/forgetRentalId.jsp");
		return mav;
	}
	
	@RequestMapping(
			value="/rental/forgetRentalIdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	
	@ResponseBody
	public JSONObject forgetRentalIdProc(
			RentalCompanyDTO rentalCompanyDTO
	/* ,@RequestParam(value="upDel") String upDel */
		) {
		JSONObject jsonObject = new JSONObject();
		String rentalIdcnt = null;
		
		try {
			rentalIdcnt = this.rentalService.rentalId(rentalCompanyDTO);
			jsonObject.put("rentalId", rentalIdcnt);

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return jsonObject;

	}
	
	
	/*아이디비번찾기 페이지*/
	@RequestMapping(value = "/rental/forgetRentalPwd.do")
	public ModelAndView rentalforgetPwd() 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/forgetRentalPwd.jsp");
		return mav;
	}
	
	
	@RequestMapping(
			value="/rental/forgetRentalPwdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	
	@ResponseBody
	public JSONObject forgetRentalPwdProc(
			RentalCompanyDTO rentalCompanyDTO
	/* ,@RequestParam(value="upDel") String upDel */
		) {
		JSONObject jsonObject = new JSONObject();
		String rentalPwd = null;
		
		try {
			rentalPwd = this.rentalService.rentalPwd(rentalCompanyDTO);
			jsonObject.put("rental", rentalPwd);

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return jsonObject;

	}
	
	

	/*회원가입 페이지*/
	@RequestMapping(value = "/rental/rentalSignUp.do")
	public ModelAndView gosignUpForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalSignUp.jsp");
		return mav;
	}
	
	/*회원가입ajax*/
	@RequestMapping
	(
		value="/rental/rentalSignUpProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
		
	@ResponseBody
	public int insertrentalCompany(RentalCompanyDTO rentalCompanyDTO)
	{
		int rentalCompanycnt=0;
		try
		{
			//System.out.println("insertrentalCompany호출");
			rentalCompanycnt=this.rentalService.insertrentalCompany(rentalCompanyDTO);
		}
		catch(Exception e)
		{
			System.out.print("insertrentalCompany에러발생");
			System.out.print(e.getMessage());
			rentalCompanycnt=-2;
		}
		return rentalCompanycnt;
	};
		
		
	/*로그인 후 접속되는 페이지*/
	@RequestMapping(value = "/rental/rentalCompanyMain.do")
	public ModelAndView gorentalCompanyMain(HttpSession sesstion) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalCompanyMain.jsp");
		try
		{
			//System.out.println("gorentalCompanyMain호출");
			String rt_no=(String) (sesstion.getAttribute("rt_no"));
			List<Map<String,String>> insertProductList  = this.rentalService.getInsertProductList(rt_no);
			mav.addObject("insertProductList",insertProductList);
		}
		catch(Exception e)
		{
			System.out.print("gorentalCompanyMain에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
	
	/*통계자료페이지*/
	@RequestMapping(value = "/rental/rentalcharts.do")
	public ModelAndView gorentalcharts(
			HttpSession session
			,RentalChartsDTO rentalChartsDTO) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalcharts.jsp");
		
		
		  JSONObject jsonObjectcnt = new JSONObject(); 
		 // productList = null;
		
		try
		{
			
			String rt_no=(String)session.getAttribute("rt_no");
			rentalChartsDTO.setRt_no(rt_no);
			List<Map<String, String>> product=this.rentalService.getProduct();
			rentalChartsDTO.setRental_product(product);
			List<Map<String, String>> air  = this.rentalService.getaircnt(rentalChartsDTO);
			jsonObjectcnt.put("air",air);
			mav.addObject("jsonObjectcnt",jsonObjectcnt);
			
		}
		catch(Exception e)
		{
			System.out.print("goRentalSubForm에러발생");
			System.out.print(e.getMessage());
		}
		JSONObject jsonObject = new JSONObject();
		//List<Map<String, String>> productList = null;
		try
		{
			String rt_no=(String)session.getAttribute("rt_no");
			rentalChartsDTO.setRt_no(rt_no);
			List<Map<String, String>> product=this.rentalService.getProduct();
			mav.addObject("product",product);
			rentalChartsDTO.setRental_product(product);
			List<Map<String, String>> productList = this.rentalService.getproductList(rentalChartsDTO);
			jsonObject.put("productList", productList);
			mav.addObject("jsonObject",jsonObject);
			mav.addObject("rentalChartsDTO",rentalChartsDTO);
			//System.out.println(jsonObject);
		}
		catch(Exception e)
		{
			System.out.print("goRentalSubForm에러발생");
			System.out.print(e.getMessage());
		}
		
	
		return mav;
	}
	/*렌탈통계ajax*/
	@RequestMapping(value = "/rental/rentalChartProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject rentalChartProc(
		 RentalChartsDTO rentalChartsDTO,HttpSession session) {
		
		JSONObject jsonObject = new JSONObject();
		List<Map<String, String>> productList = null;
		

		try {
			String rt_no=(String)session.getAttribute("rt_no");
			rentalChartsDTO.setRt_no(rt_no);
			List<Map<String, String>> product=this.rentalService.getProduct();
			rentalChartsDTO.setRental_product(product);
			productList = this.rentalService.getproductList(rentalChartsDTO);
			 jsonObject.put("productList", productList);
			// System.out.println(jsonObject);

		} catch (Exception e) {
			System.out.println("rentalChartProc 실패");
			System.out.println(e.getMessage());
			productList = null;
		}

		return jsonObject;

	}
	
	/*렌탈통계ajax*/
	@RequestMapping(value = "/rental/rentalPieChartProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject rentalPieChartProc(
		 RentalChartsDTO rentalChartsDTO,HttpSession session) {
		
		JSONObject jsonObjectcnt = new JSONObject();
		try {
			String rt_no=(String)session.getAttribute("rt_no");
			rentalChartsDTO.setRt_no(rt_no);
			List<Map<String, String>> product=this.rentalService.getProduct();
			rentalChartsDTO.setRental_product(product);
			List<Map<String, String>> air  = this.rentalService.getaircnt(rentalChartsDTO);
			
			jsonObjectcnt.put("air",air);
			
			//System.out.println(jsonObjectcnt);

		} catch (Exception e) {
			System.out.println("rentalChartProc 실패");
			System.out.println(e.getMessage());
			
		}

		return jsonObjectcnt;

	}
	
	/*물품등록페이지*/
	@RequestMapping(value = "/rental/rentalProductInsert.do")
	public ModelAndView gorentalProductInsert
	(
		RentalProductDTO rentalProductDTO
		,@RequestParam(value = "rp_no") int rp_no
	) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalProductInsert.jsp");
		try
		{
			List<Map<String,String>> ProductList  = this.rentalService.getProductList();
			mav.addObject("ProductList",ProductList);
			RentalProductDTO upProductList = this.rentalService.upProductList(rp_no);
			mav.addObject("upProductList",upProductList);
		}
		catch(Exception e)
		{
			System.out.print(e.getMessage());
		}
		return mav;
	}
	
	/*물품등록ajax*/
	@RequestMapping
	(
		value="/rental/rentalInsertProductProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int insertrentalProduct
	(
		RentalProductDTO rentalProductDTO
		,HttpSession session
	)
	{
		int insertrentalProductcnt=0;
		MultipartFile imageFile[] = (MultipartFile[])session.getAttribute("imageFile");
	       session.removeAttribute("imageFile");
		try
		{
			//System.out.println("insertrentalProduct호출");
			String rt_no=(String)session.getAttribute("rt_no");
			rentalProductDTO.setRt_no(rt_no);
			insertrentalProductcnt=this.rentalService.insertrentalProduct(rentalProductDTO);
			if(imageFile != null) { 
			       
		          
	        	  String[] saveName = new String[imageFile.length];

		          
		          for( int i = 0; i < saveName.length; i++) {
		        	  saveName[i] = saveFile(imageFile[i]);
		          }
		          rentalProductDTO.setImage_name(saveName);
		          int saveImageCnt = this.rentalService.insertImageName(rentalProductDTO);
		          
	          }else {
	        	  // image 업로드 실패
	        	  insertrentalProductcnt = -2;
	          }
			
			
		}
		catch(Exception e)
		{
			System.out.print("insertrentalProduct에러발생");
			System.out.print(e.getMessage());
			insertrentalProductcnt=-3;
		}
		return insertrentalProductcnt;
	}
		
	/*물품수정등록ajax*/
	@RequestMapping
	(
		value="/rental/rentalUpProductProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int updaterentalProduct(RentalProductDTO rentalProductDTO,HttpSession session)
	{
		int updaterentalProductcnt=0;
		try
		{
			//System.out.println("updaterentalProduct호출");
			String rt_no=(String)session.getAttribute("rt_no");
			rentalProductDTO.setRt_no(rt_no);
			updaterentalProductcnt=this.rentalService.updaterentalProduct(rentalProductDTO);
		}
		catch(Exception e)
		{
			System.out.print("updaterentalProduct에러발생");
			System.out.print(e.getMessage());
			updaterentalProductcnt=-3;
		}
		return updaterentalProductcnt;
	}
	
	/*업체측 렌탈하고있는 고객 목록*/
	@RequestMapping(value = "/rental/rentalSubForm.do")
	public ModelAndView goRentalSubForm
	(
		HttpSession session
		,RentalProductSerachDTO rentalProductSerachDTO
	) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalSubForm.jsp");
		try
		{
			String string=(String)session.getAttribute("rt_no");
			int rt_no=Integer.parseInt(string);
			rentalProductSerachDTO.setRt_no(rt_no);
			List<Map<String,String>> rentalSubList  = this.rentalService.getrentalSubList(rentalProductSerachDTO);
			mav.addObject("rentalSubList",rentalSubList);
			mav.addObject("rentalProductSerachDTO",rentalProductSerachDTO);
		}
		catch(Exception e)
		{
			System.out.print("goRentalSubForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
		
	/*업체측 렌탈 배달완료 ajax*/
	@RequestMapping
	(
		value="/rental/rentalSubCompanyProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
				
	@ResponseBody
	public int updateSubJubsu(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		int subJubsucnt=0;
		try
		{
			System.out.print(rentalSubscriptionDTO.getRental_start_date());
			subJubsucnt=this.rentalService.updateSubJubsu(rentalSubscriptionDTO);
		}
		catch(Exception e)
		{
			System.out.print("updateSubJubsu에러발생");
			System.out.print(e.getMessage());
			subJubsucnt=-2;
		}
		return subJubsucnt;
	};
		
	/*업체측 렌탈한제품 AS목록*/
	@RequestMapping(value = "/rental/rentalASForm.do")
	public ModelAndView gorentalASForm(HttpSession session) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalASForm.jsp");
		try
		{
			String string=(String)session.getAttribute("rt_no");
			int rt_no=Integer.parseInt(string);
			List<Map<String,String>> rentalASList  = this.rentalService.getrentalASList(rt_no);
			mav.addObject("rentalASList",rentalASList);
		}
		catch(Exception e)
		{
			System.out.print("gorentalASForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
	/*AS 상세페이지*/
	@RequestMapping(value = "/rental/rentASConForm.do")
	public ModelAndView gorentASConForm(@RequestParam(value = "ru_no") int ru_no) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentASConForm.jsp");
		try
		{
			RentalASDTO rentalASContent  = this.rentalService.getrentalASContent(ru_no);
			
			mav.addObject("rentalASContent",rentalASContent);
		}
		catch(Exception e)
		{
			System.out.print("gorentalASForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
	
	/*업체측 렌탈한제품 AS완료 ajax*/
	@RequestMapping
	(
		value="/rental/rentalASCompanyProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
				
	@ResponseBody
	public int rentalASCompanyProc(RentalASDTO rentalASDTO)
	{
		int rentalASCompanyCnt=0;
		try
		{
			//System.out.print("rentalASCompanyProc호출");
			rentalASCompanyCnt=this.rentalService.rentalASCompanyProc(rentalASDTO);
		}
		catch(Exception e)
		{
			System.out.print("rentalASCompanyProc에러발생");
			System.out.print(e.getMessage());
			rentalASCompanyCnt=-1;
		}
		return rentalASCompanyCnt;
	};
	/*---------------구매자측 메소드--------------------------*/
	/*구매자측 렌탈한목록페이지*/
	@RequestMapping(value = "/buyer/buyerRentalSubForm.do")
	public ModelAndView gobuyerRentalSubForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/buyerRentalSubForm.jsp");
		try
		{
			String b_id = (String)session.getAttribute("b_id");
			if(b_id!=null) {
			BuyerDTO buyerDTO;
			buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
			mav.addObject("buyerDTO",buyerDTO);}
		}
		catch(Exception e)
		{System.out.println("b_id에러발생"); System.out.println(e.getMessage());}
		try
		{
			//System.out.println("buyerRentalSubForm호출");
			int b_no=(int)(session.getAttribute("b_no"));
			List<Map<String,String>> buyerRentalSubList  = this.rentalService.getBuyerRentalSubList(b_no);
			mav.addObject("buyerRentalSubList",buyerRentalSubList);
		}
		catch(Exception e)
		{
			System.out.print("buyerRentalSubForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
	
	/*구매자측 렌탈AS목록페이지*/
	@RequestMapping(value = "/buyer/buyerRentalASSubForm.do")
	public ModelAndView gobuyerRentalASSubForm(HttpSession sesstion) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/buyerRentalASSubForm.jsp");
		try
		{
			String b_id = (String)sesstion.getAttribute("b_id");
			if(b_id!=null) {
			BuyerDTO buyerDTO;
			buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
			mav.addObject("buyerDTO",buyerDTO);}
		}
		catch(Exception e)
		{System.out.println("b_id에러발생"); System.out.println(e.getMessage());}
		try
		{
			//System.out.println("buyerRentalSubForm호출");
			int b_no=(int)(sesstion.getAttribute("b_no"));
			List<Map<String,String>> buyerrentalASList  = this.rentalService.getBuyerrentalASList(b_no);
			mav.addObject("buyerrentalASList",buyerrentalASList);
		}
		catch(Exception e)
		{
			System.out.print("gobuyerRentalASSubForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
		
	/*구매자측 AS신청페이지*/
	@RequestMapping(value = "/buyer/buyerASForm.do")
	public ModelAndView gobuyerASForm(@RequestParam(value = "ru_no") int ru_no,HttpSession session) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/buyerASForm.jsp");
		try
		{
			String b_id = (String)session.getAttribute("b_id");
			if(b_id!=null) {
			BuyerDTO buyerDTO;
			buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
			mav.addObject("buyerDTO",buyerDTO);}
		}
		catch(Exception e)
		{System.out.println("b_id에러발생"); System.out.println(e.getMessage());}
		return mav;
	}
	
	/*구매자측 별점AJAX*/
	@RequestMapping
	(
		value="/buyer/rentalInsertReviewProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int getBuyerReviewcnt(RentalReviewDTO rentalReviewDTO)
	{
		int getBuyerReviewcnt=0;
		try
		{
			//System.out.println("getBuyerAScnt호출");
			getBuyerReviewcnt=this.rentalService.getBuyerReviewcnt(rentalReviewDTO);
		}
		catch(Exception e)
		{
			System.out.print("getBuyerAScnt에러발생");
			System.out.print(e.getMessage());
			getBuyerReviewcnt=-1;
		}
		return getBuyerReviewcnt;
	}
	
	/*구매자측 별점 수정AJAX*/
	@RequestMapping
	(
		value="/buyer/rentalInsertReReviewProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int getBuyerReReviewcnt(RentalReviewDTO rentalReviewDTO)
	{
		int getBuyerReReviewcnt=0;
		try
		{
			//System.out.println("getBuyerAScnt호출");
			getBuyerReReviewcnt=this.rentalService.getBuyerReReviewcnt(rentalReviewDTO);
		}
		catch(Exception e)
		{
			System.out.print("getBuyerAScnt에러발생");
			System.out.print(e.getMessage());
			getBuyerReReviewcnt=-1;
		}
		return getBuyerReReviewcnt;
	}

	@RequestMapping
	(
		value="/rental/buyerRentalASProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int getBuyerAScnt(RentalASDTO rentalASDTO,HttpSession session)
	{
		int getBuyerAScnt=0;
		try
		{
			//System.out.println("getBuyerAScnt호출");
			getBuyerAScnt=this.rentalService.getBuyerAScnt(rentalASDTO);
		}
		catch(Exception e)
		{
			System.out.print("getBuyerAScnt에러발생");
			System.out.print(e.getMessage());
			getBuyerAScnt=-2;
		}
		return getBuyerAScnt;
	}
		
	/*구매자측 렌탈신청할수있는 제품 목록페이지*/
	@RequestMapping(value = "/buyer/rentListForm.do")
	public ModelAndView goRentListForm
	(
		RentalProductSerachDTO rentalProductSerachDTO
		,HttpSession session
	)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/rentListForm.jsp");
		try
		{
			String b_id = (String)session.getAttribute("b_id");
			if(b_id!=null) {
			BuyerDTO buyerDTO;
			buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
			mav.addObject("buyerDTO",buyerDTO);}
		}
		catch(Exception e)
		{System.out.println("b_id에러발생"); System.out.println(e.getMessage());}
		try
		{
			List<Map<String,String>> ProductList  = this.rentalService.getProductList();
			List<Map<String,String>> rentalProductList  = this.rentalService.getrentalProductList();
			mav.addObject("ProductList",ProductList);
			mav.addObject("rentalProductList",rentalProductList);
			
			mav.addObject("rentalProductSerachDTO",rentalProductSerachDTO);
		}
		catch(Exception e)
		{
			System.out.print("goRentListForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
	
	/*구매자측 렌탈신청할수있는 제품 목록페이지ajax*/
	@RequestMapping
	(
		value="/buyer/rentListFormProc.do"
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public Object getRentListForm(RentalProductSerachDTO rentalProductSerachDTO,HttpSession session,@RequestParam(value = "rental_product_code[]", required = false) List<String> rental_product_code)
	{
		JSONObject jsonObject = new JSONObject();
		List<Map<String,String>> rentalProductList = null;
		
		try
		{
			
			
			rentalProductList  = this.rentalService.getrentalProductList2(rental_product_code);
			jsonObject.put("data", rentalProductList);
		}
		catch(Exception e)
		{
			System.out.print("rentListFormProc에러발생");
			System.out.print(e.getMessage());
		}
		//System.out.println(rentalProductList);
		return jsonObject;
	};


	/*구매자측 렌탈신청할수있는 제품 상세페이지*/
	@RequestMapping(value = "/buyer/rentConForm.do")
	public ModelAndView goRentConForm
	(
		HttpSession session
		,@RequestParam(value="rp_no") int rp_no
		,RentalProductDTO rentalProductDTO
	) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/rentConForm.jsp");
		try
		{
			String b_id = (String)session.getAttribute("b_id");
			if(b_id!=null) {
			BuyerDTO buyerDTO;
			buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
			mav.addObject("buyerDTO",buyerDTO);}
		}
		catch(Exception e)
		{System.out.println("b_id에러발생"); System.out.println(e.getMessage());}
		try
		{
			
			rentalProductDTO.setRp_no(rp_no);
			RentalProductDTO rentalContent=this.rentalService.getrentalContent(rentalProductDTO);
			List<Map<String,String>> rentalImg=this.rentalService.getrentalImg(rp_no);
			mav.addObject("rentalContent",rentalContent);
			mav.addObject("rentalImg",rentalImg);
		}
		catch(Exception e)
		{
			System.out.print("goRentConForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
	
	/*구매자측 렌탈신청페이지*/
	@RequestMapping(value = "/buyer/rentSubscriptionForm.do")
	public ModelAndView gorentSubscriptionForm
	(
		HttpSession session
		,@RequestParam(value="rp_no") int rp_no
		,RentalProductDTO rentalProductDTO
	) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/rentSubscriptionForm.jsp");
		try
		{
			String b_id = (String)session.getAttribute("b_id");
			if(b_id!=null) {
			BuyerDTO buyerDTO;
			buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
			mav.addObject("buyerDTO",buyerDTO);}
		}
		catch(Exception e)
		{System.out.println("b_id에러발생"); System.out.println(e.getMessage());}
		try
		{
			
			rentalProductDTO.setRp_no(rp_no);
			RentalProductDTO rentalContent=this.rentalService.getrentalContent(rentalProductDTO);
			mav.addObject("rentalContent",rentalContent);
			List<Map<String,String>> rentalTerm=this.rentalService.getrentalTerm();
			mav.addObject("rentalTerm",rentalTerm);
		}
		catch(Exception e)
		{
			System.out.print("goRentConForm에러발생");
			System.out.print(e.getMessage());
		}
		return mav;
	}
	
	/*구매자측 렌탈신청페이지ajax*/
	@RequestMapping
	(
		value="/buyer/rentSubscriptionFormProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int insertSubscription(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		int subscriptioncnt=0;
		try
		{
			subscriptioncnt=this.rentalService.insertSubscription(rentalSubscriptionDTO);
		}
		catch(Exception e)
		{
			System.out.print("insertSubscription에러발생");
			System.out.print(e.getMessage());
			subscriptioncnt=-1;
		}
		return subscriptioncnt;
	};
		
	
	
	/*---------------------------로그아웃------------------------------*/
	@RequestMapping(value = "/rental/rentalLogOut.do")
	public ModelAndView rentalLogOut(HttpSession session) 
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/rental/rentalLogOut.jsp");
		session.removeAttribute("rt_id");
		session.removeAttribute("rt_no");
		return mav;
	}
	
	
	
	
	@RequestMapping( 
	          value="/rental/productImageSession.do"                        
	          ,method=RequestMethod.POST                   
	          ,produces="application/json;carset=UTF-8"          
	    )
	    @ResponseBody 
	    public int roomImageSession(	 MultipartFile[] imageFile , HttpSession session) {
		int result = 0;
		int imageFileLength = imageFile.length;
		System.out.println(imageFile);
		if(imageFile == null) {
			return  -1;
		}
        
	    session.setAttribute("imageFile", imageFile);

	    return result;
	    }	
	
	// 파일 저장 코드  - KBS
	protected String saveFile(MultipartFile file){
			
			
	        
		//final String filePath =  "C:\\Users\\학부생김보성\\Documents\\workspace_spring\\javaBang\\WebContent\\WEB-INF\\resources\\rentalProductImg" ;
		final String filePath = "C:\\Users\\fhxh\\Desktop\\PJT\\javaBang\\WebContent\\WEB-INF\\resources\\rentalProductImg";
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();
		    String saveName = uuid + "_" + file.getOriginalFilename();

		    // 저장할 File 객체를 생성
		    File saveFile = new File(filePath,saveName); // 저장할 폴더 이름, 저장할 파일 이름

		    try {
		        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		    } catch (IOException e) {
		        e.printStackTrace();
		        return null;
		    }

		    return saveName;
		} 
	
	
}
