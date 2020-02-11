package com.naver.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BuyerController {

	@Autowired
	private BuyerService buyerService;
	@Autowired
	private RoomListService roomListService;
	

	// =============================================================================
		// homeForm.do. 구해방 홈 화면
		// =============================================================================
		@RequestMapping(value = "/buyer/homeForm.do")
		public ModelAndView goHomeForm(
				HttpSession session) {

			ModelAndView mav = new ModelAndView();
			mav.setViewName("/buyer/homeForm.jsp");
			try {
					String b_id = (String)session.getAttribute("b_id");
					if (b_id != null) {
						BuyerDTO buyerDTO =  this.buyerService.getBuyerIdDTO(b_id);
						 session.setAttribute("b_no", buyerDTO.getB_no());	
						 mav.addObject("buyerDTO", buyerDTO);
						
						 
					}	

					List<Map<String,String>> roomList  = this.buyerService.getRoomList();
					List<Map<String,String>> roomSecondList  = this.buyerService.getRoomSecondList();
					List<Map<String,String>> roomThirdList  = this.buyerService.getRoomThirdList();
					List<Map<String,String>> rentalList=this.buyerService.getrentalList();

					mav.addObject("roomList", roomList);
					mav.addObject("roomSecondList", roomSecondList);
					mav.addObject("roomThirdList", roomThirdList);
					mav.addObject("rentalList",rentalList);
					
					

				
			           
			} catch (Exception e) {
				
				System.out.println(e.getMessage());
			}
			
			return mav;
		}


	
	
	
	// =============================================================================
	// test 페이지 화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/test.do")
	public ModelAndView gotestForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/test.jsp");
		mav.addObject("buyerDTO", getSessionInfo(session));
	
		return mav;
	}


	
	
	
	// =============================================================================
	// modifyInfo.do - 구매자 정보수정 화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/modifyInfo.do")
	public ModelAndView goModifyInfoForm( HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/modifyInfo.jsp");
		
		int b_no = (int)session.getAttribute("b_no");
		try {
			BuyerDTO buyerDTO = this.buyerService.getBuyerDTO(b_no);
			mav.addObject("buyerDTO", buyerDTO);
			mav.addObject("buyerDTO", getSessionInfo(session));
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return mav;
	}
	
	

	
	
	
	
	// =============================================================================
	// latestLookList.do - 최근 본 방 페이지화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/latestLookList.do")
	public ModelAndView goLatestLookListForm( HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/latestLookList.jsp");
		mav.addObject("buyerDTO", getSessionInfo(session));
		
		return mav;
	}

	
	
	
	
	// =============================================================================
	// mypageAlarm.do - 구매자 마이페이지 알림 페이지화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/mypageAlarm.do")
	public ModelAndView goMypageAlarmForm( HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/mypageAlarm.jsp");	

		mav.addObject("buyerDTO", getSessionInfo(session));
		return mav;
	}

	
	
	
	
	// =============================================================================
	// likeRoomList.do - 구매자 찜한 방 목록 페이지 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/likeRoomList.do")
	public ModelAndView goLikeRoomListForm(/* @RequestParam(value = "sr_no", required = false) int sr_no */ HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/likeRoomList.jsp");
		
		int b_no = (int)session.getAttribute("b_no");
		try {
			/*
			 * RoomDTO roomDTO = this.buyerService.getRoomDTO(1); mav.addObject("roomDTO",
			 * roomDTO);
			 */
			BuyerDTO buyerDTO = this.buyerService.getBuyerDTO(b_no);
			List<Map<String,String>> likeRoomList  = this.buyerService.getLikeRoomList(buyerDTO);

			mav.addObject("likeRoomList", likeRoomList);
			mav.addObject("buyerDTO", getSessionInfo(session));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return mav;
	}

	
	
	
	
	// =============================================================================
	// myReview.do - 구매자 내가 쓴 리뷰 페이지 화면으로 이동
	// =============================================================================
		@RequestMapping(value = "/buyer/myReview.do")
		public ModelAndView goMyReviewForm(
				/* @RequestParam(value = "review_no", required = false) int review_no , */HttpSession session) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/buyer/myReview.jsp");
			int b_no = (int)session.getAttribute("b_no");
			
			try {
					BuyerDTO buyerDTO = this.buyerService.getBuyerDTO(b_no);
			
					
					mav.addObject("buyerDTO", buyerDTO);
					mav.addObject("buyerDTO", getSessionInfo(session));
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return mav;
		}

	
	
	
	
	// =============================================================================
	// modifyInfoFin.do - 구매자 정보수정 완성 페이지로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/modifyInfoFin.do")
	public ModelAndView goModifyInfoFinForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/modifyInfoFin.jsp");
		mav.addObject("buyerDTO", getSessionInfo(session));
		
		return mav;
	}
	
	
	// =============================================================================
	// writeMyReview.do - 구매자 정보수정 완성 페이지로 이동
	// =============================================================================
		@RequestMapping(value = "/buyer/writeMyReview.do")
		public ModelAndView writeMyReview(HttpSession session) {

			ModelAndView mav = new ModelAndView();
			mav.setViewName("/buyer/writeMyReview.jsp");
			mav.addObject("buyerDTO", getSessionInfo(session));
			
			return mav;
		}
	

	// =============================================================================
	// myReviewContent.do - 구매자 리뷰 상세화면 페이지 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/myReviewContent.do")
	public ModelAndView goMyReviewContentForm(@RequestParam(value = "review_no", required = false) int review_no,HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/myReviewContent.jsp");
		try {
				BuyerDTO buyerDTO = this.buyerService.getBuyerDTO(1);
				mav.addObject("buyerDTO", buyerDTO);
				mav.addObject("buyerDTO", getSessionInfo(session));
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return mav;
	}
	
	
	
	
	
	
	
	// =============================================================================
	// likeRoomContent.do - 구매자 찜한 방 상세화면 페이지로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/likeRoomContent.do")
	public ModelAndView goLikeRoomContentForm(/* @RequestParam(value = "sr_no", required = false) int sr_no */ HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/likeRoomContent.jsp");

		try {
			/*
			 * RoomDTO roomDTO = this.buyerService.getRoomDTO(1); mav.addObject("roomDTO",
			 * roomDTO); mav.addObject("buyerDTO", getSessionInfo(session));
			 */
			String b_id = (String)session.getAttribute("b_id");
			BuyerDTO buyerDTO;
				
				buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
				List<Map<String,String>> likeRoomList  = this.buyerService.getLikeRoomList(buyerDTO);
				session.setAttribute("b_no", buyerDTO.getB_no());
				
				mav.addObject("likeRoomList", likeRoomList);
				mav.addObject("buyerDTO", buyerDTO);
				mav.addObject("buyerDTO", getSessionInfo(session));
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return mav;
	}
	

	
	
	
	
	// =============================================================================
	// buyerUpDelProc.do - 구매자 정보 수정하는 proc 메소드
	// =============================================================================
	@RequestMapping(
			value="/buyer/buyerUpDelProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int buyerUpDelProc(
		BuyerDTO buyerDTO
	/* ,@RequestParam(value="upDel") String upDel */
		
		) {
		int buyerUpDelCnt=0;
		try {
				buyerUpDelCnt = this.buyerService.updateBuyer(buyerDTO);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return buyerUpDelCnt;

	}
	

	
	// =============================================================================
		// forgetBuyerIdProc.do - 구매자 id 찾기
		// =============================================================================
		@RequestMapping(
				value="/buyer/forgetBuyerIdProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public JSONObject forgetBuyerIdProc(HttpSession session, 
			BuyerDTO buyerDTO
		/* ,@RequestParam(value="upDel") String upDel */
			) {
			System.out.println("컨트롤러시작");
			JSONObject jsonObject = new JSONObject();
			String buyerIdCnt = null;
			
			try {
				String b_jumin1 = buyerDTO.getB_jumin1();
				String b_jumin2 = buyerDTO.getB_jumin2();
				String b_jumin = b_jumin1 + b_jumin2;
				buyerDTO.setB_jumin(b_jumin);
				buyerIdCnt = this.buyerService.buyerIdCnt(buyerDTO);
				jsonObject.put("buyerId", buyerIdCnt);

			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			return jsonObject;

		}
	
	
	// =============================================================================
		// forgetBuyerPwdProc.do - 구매자 pwd 찾기
		// =============================================================================
		@RequestMapping(
				value="/buyer/forgetBuyerPwdProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public JSONObject forgetBuyerPwdProc(
			BuyerDTO buyerDTO
			) {
			System.out.println("컨트롤러시작");
			JSONObject jsonObject = new JSONObject();
			String buyerPwdGet = null;
			
			try {
				String b_jumin1 = buyerDTO.getB_jumin1();
				String b_jumin2 = buyerDTO.getB_jumin2();
				String b_jumin = b_jumin1 + b_jumin2;
				buyerDTO.setB_jumin(b_jumin);
				buyerPwdGet = this.buyerService.buyerPwdGet(buyerDTO);
				jsonObject.put("buyerPwd", buyerPwdGet);

			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			return jsonObject;

		}
	
	
	
	
	
	// =============================================================================
	// withdrawal.do - 구매자 탈퇴하는 페이지로 이동 
	// =============================================================================
	@RequestMapping(value = "/buyer/withdrawal.do")
	public ModelAndView goWithdrawalForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/withdrawal.jsp");
		mav.addObject("buyerDTO", getSessionInfo(session));
		return mav;
	}
	
	
	
	
	// =============================================================================
	// modifyPwdCheck.do - 구매자 회원정보 수정 비밀번호 체크 페이지 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/modifyPwdCheck.do")
	public ModelAndView goModifyPwdCheckForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/modifyPwdCheck.jsp");
		mav.addObject("buyerDTO", getSessionInfo(session));
		return mav;
		
	}
	
	
	
	
	
	
	// =============================================================================
	// withdrawalProc.do - 구매자 탈퇴하는 pro 메소드
	// =============================================================================
	@RequestMapping(
			value="/buyer/withdrawalProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int withdrawalProc(
		BuyerDTO buyerDTO, HttpSession session
		) {
		int buyerLikeRoomCnt=0;
		int withdrawalCnt=0;
		try {
				String b_id = (String)session.getAttribute("b_id");
				buyerLikeRoomCnt = this.buyerService.deleteLikeRoom(buyerDTO);
				withdrawalCnt = this.buyerService.deleteBuyer(buyerDTO);
				session.removeAttribute("b_id");
				session.removeAttribute("b_no");
				session.removeAttribute("buyer_uri");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return withdrawalCnt;
	}
	
	
	
	// =============================================================================
	// modifyPwdCheckProc.do - 구매자 정보수정 시 비밀번호 갯수 확인
	// =============================================================================
		@RequestMapping(
				value="/buyer/modifyPwdCheckProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int modifyPwdCheckProc(
			BuyerDTO buyerDTO
			) {
			int pwdCnt=0;
			try {
					
				pwdCnt = this.buyerService.buyerPwdCnt(buyerDTO);
					
			}catch(Exception e) {
				System.out.println("에러발생"+pwdCnt);
				System.out.println(e.getMessage());
			}
			return pwdCnt;

		}
		
		
	
	
	
	
	
	// =============================================================================
	// getSessionInfo - 구매자 b_id 세션으로 값 가져오기
	// =============================================================================
	public BuyerDTO getSessionInfo(HttpSession session) {
		String b_id = (String)session.getAttribute("b_id");
		BuyerDTO buyerDTO;
		buyerDTO = this.buyerService.getBuyerIdDTO(b_id);
		return buyerDTO;
	}
	
	
	
	
	// =============================================================================
	// forgetBuyerId 페이지 화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/forgetBuyerId.do")
	public ModelAndView goForgetBuyerIdForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/forgetBuyerId.jsp");
	
		return mav;
	}
	
	// =============================================================================
	// forgetBuyerPwd 페이지 화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/buyer/forgetBuyerPwd.do")
	public ModelAndView goForgetBuyerPwdForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/forgetBuyerPwd.jsp");
	
		return mav;
	}
	
	
	
	

}
















