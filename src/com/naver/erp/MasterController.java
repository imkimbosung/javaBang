package com.naver.erp;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MasterController {

	@Autowired
	private MasterService masterService;

	// --------------------------------
	// 목록 수정 -> homeFome 메인에 그래프 데이터 가져오기
	// --------------------------------
	@RequestMapping(value = "/master/homeForm.do")
	public ModelAndView homeForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/homeForm.jsp");

		try {

			MasterHomeDTO masterHomeDTO = this.masterService.getHomeData();
//			MasterHomeGraphDTO mamterHomeGraphDTO = this.masterService.getHomeGraphData();
			List<Map<String, String>> masterHomeGrap = this.masterService.getHomeGraphData(2020);

			mav.addObject("masterHomeDTO", masterHomeDTO);
			mav.addObject("masterHomeGrap", masterHomeGrap);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(" Master - homeForm error");
		}

		return mav;
	}
	
	
	@RequestMapping(value = "/master/noticeForm.do")
	public ModelAndView noticeForm(HttpSession session, @RequestParam(value ="title", required= false)String title, @RequestParam(value ="content", required= false) String content) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/noticeForm.jsp");
	
		mav.addObject("title", title);
		mav.addObject("content", content);


		return mav;
	}
	
	
	
	@RequestMapping(value = "/master/masterHomeProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject masterHomeProc(
			@RequestParam(value = "yearVal", required = false) int yearVal , MasterHomeGraphDTO masterHomeGraphDTO) {
		
		JSONObject jsonObject = new JSONObject();
		List<Map<String, String>> masterHomeGraph = null;
		

		try {
			 masterHomeGraph = this.masterService.getYearValCnt(yearVal);
			 masterHomeGraphDTO.setMasterHomeGrap(masterHomeGraph);
			 jsonObject.put("masterHomeGraph", masterHomeGraph);

		} catch (Exception e) {
			System.out.println("masterHomeProc 실패");
			System.out.println(e.getMessage());
			masterHomeGraphDTO = null;
		}

		return jsonObject;

	}
	

	// --------------------------------
	// 데이터 조회 -> roomListForm가져오기
	// --------------------------------
	
	@RequestMapping(value = "/master/roomListForm.do")
	public ModelAndView roomListForm( HttpSession session, MasterChartsDTO masterChartsDTO) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/roomListForm.jsp");

		try {
			
			List<Map<String, String>> masterRoomGraph = this.masterService.getRoomGraphData();
			List<Map<String, String>> roomtypeGraph = this.masterService.roomtypeGraph(masterChartsDTO);
			
			mav.addObject("masterRoomGraph", masterRoomGraph);
			mav.addObject("roomtypeGraph", roomtypeGraph);

		} catch (Exception e) {
			System.out.println("Master - roomListForm error");
			System.out.println(e.getMessage());
		}

		return mav;
	}
	

	@RequestMapping(value = "/master/roomListFormProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject roomListFormProc(
			@RequestParam(value = "yearVal", required = false) int yearVal,HttpSession session) {
		
		JSONObject jsonObject = new JSONObject();
		List<Map<String, String>> roomtypeGraph = null;


		try {
			roomtypeGraph = this.masterService.getYearRoomType(yearVal);
//			masterChartsDTO.setRoomtypeGraph(roomtypeGraph);
			 jsonObject.put("roomtypeGraph", roomtypeGraph);
			 System.out.println(roomtypeGraph);
		} catch (Exception e) {
			System.out.println("roomListFormProc 실패");
			System.out.println(e.getMessage());
			roomtypeGraph = null;
		}

		return jsonObject;

	}
	
	
	// --------------------------------
	// 데이터 조회 -> customerListForm가져오기
	// --------------------------------

	@RequestMapping(value = "/master/customerListForm.do")
	public ModelAndView customerListForm(HttpSession session , 
			 @RequestParam(value ="selectInfo", required= false) String selectInfo) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/customerListForm.jsp");

		try {
			
			List<Map<String, String>> masterCustomerGraph = this.masterService.getCustoemrGraphData();
			
			
			// buyer 정보 table 가져오는 부분 ------------------
			int buyerListAllCnt=this.masterService.getBuyerListAllCnt();
			
			List<Map<String, String>> boardListBuyer = this.masterService.getBoardListBuyer();
			
			// 정지 유무 가져오기
			List<Map<String,String>> stopBuyer = this.masterService.getStopCustomer("buyer");
			
			// buyer 정보 table 가져오는 부분 ------------------
			mav.addObject("boardListBuyer", boardListBuyer);		
			mav.addObject("buyerListAllCnt", buyerListAllCnt);
			mav.addObject("stopBuyer", stopBuyer);
			
			
			// ---------------------------------------------
			// ================================================================================================
			
			// seller 정보 table 가져오는 부분 ------------------
			int sellerListAllCnt=this.masterService.getSellerListAllCnt();
			
			List<Map<String, String>> boardListSeller = this.masterService.getBoardListSeller();
			
			// 정지 유무 가져오기
			List<Map<String,String>> stopSeller = this.masterService.getStopCustomer("seller");
						
			// seller 정보 table 가져오는 부분 ------------------
			mav.addObject("boardListSeller", boardListSeller);
			mav.addObject("sellerListAllCnt", sellerListAllCnt);
			mav.addObject("stopSeller", stopSeller);
			// ---------------------------------------------
			
			// ---------------------------------------------
			// ================================================================================================
				
				// realtor 정보 table 가져오는 부분 ------------------
				int realtorListAllCnt=this.masterService.getRealtorListAllCnt();
				
				List<Map<String, String>> boardListRealtor = this.masterService.getBoardListRealtor();
				
				// 정지 유무 가져오기
				List<Map<String,String>> stopRealtor = this.masterService.getStopCustomer("realtor");
							
				// realtor 정보 table 가져오는 부분 ------------------
				mav.addObject("boardListRealtor", boardListRealtor);
				mav.addObject("realtorListAllCnt", realtorListAllCnt);
				mav.addObject("stopRealtor", stopRealtor);
				// ---------------------------------------------
						
				
				
			// ---------------------------------------------
			// ================================================================================================
				
				// rental 정보 table 가져오는 부분 ------------------
				int rentalListAllCnt=this.masterService.getRentalListAllCnt();
				
				List<Map<String, String>> boardListRental = this.masterService.getBoardListRental();
				
				// 정지 유무 가져오기
				List<Map<String,String>> stopRental = this.masterService.getStopCustomer("rental");
							
				// rental 정보 table 가져오는 부분 ------------------
				mav.addObject("boardListRental", boardListRental);
				mav.addObject("rentalListAllCnt", rentalListAllCnt);
				mav.addObject("stopRental", stopRental);
				// ---------------------------------------------
						
						
			mav.addObject("masterCustomerGraph", masterCustomerGraph);
			
			
			// 전체 가입 경로
			List<Map<String,String>> getSignUpRoot = this.masterService.getSignUpRoot();
			mav.addObject("getSignUpRoot", getSignUpRoot);
			
			// 성별 
			List<Map<String,String>> getGender = this.masterService.getGender();
			mav.addObject("getGender", getGender);
			
			// 연령
			List<Map<String,String>> getAge = this.masterService.getAge();
			mav.addObject("getAge", getAge);
			
			if(selectInfo == null) {selectInfo = "buyerSubmit";} // 초기 선택값
			mav.addObject("selectInfo", selectInfo);


		} catch (Exception e) {
			System.out.println("Master - customerListForm error");
			System.out.println(e.getMessage());
		}

		return mav;
	}
	
	
	
	@RequestMapping(value = "/master/customerStopProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int customerStopProc(MasterStopCustomerDTO masterStopCustomerDTO ) {			
			int inputStopCus = 0;
		try {
			inputStopCus = this.masterService.insertStopCustomer(masterStopCustomerDTO);

		} catch (Exception e) {
			System.out.println("masterHomeProc 실패");
			System.out.println(e.getMessage());
			inputStopCus = -1;
		}

		return inputStopCus;

	}
	
	
	@RequestMapping(value = "/master/customerUpDelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int customerUpDelProc(MasterStopCustomerDTO masterStopCustomerDTO, @RequestParam(value = "upDel") String upDel ) {			
			int upDelStopCus = 0;
		try {
			if(upDel.equals("up")) {
				upDelStopCus = this.masterService.updateStopCustomer(masterStopCustomerDTO);
			}else if(upDel.equals("del")) {
				upDelStopCus = this.masterService.deleteStopCustomer(masterStopCustomerDTO);
			}
			

		} catch (Exception e) {
			System.out.println("masterHomeProc 실패");
			System.out.println(e.getMessage());
			upDelStopCus = -1;
		}

		return upDelStopCus;

	}
	
	
	// --------------------------------
	// 데이터 조회 -> realtorListForm가져오기
	// --------------------------------

	@RequestMapping(value = "/master/realtorListForm.do")
	public ModelAndView realtorListForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/realtorListForm.jsp");

		try {
			
			int realtorListAllCnt=this.masterService.getRealtorListAllCnt();
			
			List<Map<String,String>> getRealtorInfo = this.masterService.getRealtorInfo();
			
			mav.addObject("getRealtorInfo", getRealtorInfo);
			mav.addObject("realtorListAllCnt", realtorListAllCnt);


		} catch (Exception e) {
			System.out.println("Master - realtorListForm error");
			System.out.println(e.getMessage());
		}

		return mav;
	}
	
	
	// --------------------------------
	// 데이터 조회 -> rentListForm가져오기
	// --------------------------------

		@RequestMapping(value = "/master/rentListForm.do")
		public ModelAndView rentListForm(HttpSession session ) {

			ModelAndView mav = new ModelAndView();
			mav.setViewName("/master/rentListForm.jsp");

			try {

				
				// 렌트 물품 리스트 Get
				List<Map<String, String>> rentProductLabels = this.masterService.getProductLabels();
				
				
				// 렌트 물품 개수만큼 배열 크기 만들기
				// -> mapper에서 제품 개수만큼 foreach가 작동되도록 해야하기 때문
				int productCnt[] = new int [rentProductLabels.size()];
				for(int i =0 ; i < productCnt.length ; i++) {
					productCnt[i] = i;
				}
				MasterRentCntDTO masterRentCntDTO = new MasterRentCntDTO();
				masterRentCntDTO.setArrayCnt(productCnt.length);
				masterRentCntDTO.setProductCnt(productCnt);
				
				List<Map<String, String>> productMonthCnt = this.masterService.getProductMonthCnt(masterRentCntDTO);
				
				
				int productRankingAllCnt =  productCnt.length;

				// 최근 3개월 ranking 페이징 처리 됨
				List<Map<String, String>> productRankingCnt = this.masterService.getProductRankingCnt();
				
				// =========================================================================================================================
				
				int companyRankingAllCnt =  this.masterService.getCompanyRankingAllCnt();
				
				List<Map<String, String>> companyRankingCnt = this.masterService.getCompanyRankingCnt();
				
				List<Map<String, String>> masterCustomerGraph = this.masterService.getCustoemrGraphData();

				mav.addObject("rentProductLabels", rentProductLabels);
				mav.addObject("productMonthCnt", productMonthCnt);
				mav.addObject("productRankingCnt", productRankingCnt);
				mav.addObject("masterCustomerGraph", masterCustomerGraph);
				
	
				mav.addObject("companyRankingCnt", companyRankingCnt);
				mav.addObject("companyCnt", companyRankingAllCnt);
				
				mav.addObject("productRankingAllCnt", productRankingAllCnt);

			} catch (Exception e) {
				System.out.println("Master - rentListForm error");
				System.out.println(e.getMessage());
			}

			return mav;
		}

	
	
	

	// --------------------------------
	// 목록 수정 -> 판매자 code get
	// --------------------------------
	@RequestMapping(value = "/master/sellerCodeForm.do")
	public ModelAndView sellerCodeForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/sellerCodeForm.jsp");

		try {
			List<Map<String, String>> roomTypeCode = this.masterService.getRoomTypeCode();
			List<Map<String, String>> ELVCode = this.masterService.getELVCode();
			List<Map<String, String>> hcTypeCode = this.masterService.getHcTypeCode();
			
			List<Map<String, String>> optionSelectCode = this.masterService.getOptionSelectCode();
			List<Map<String, String>> petCode = this.masterService.getPetCode();
			List<Map<String, String>> parkingCode = this.masterService.getParkingCode();
			List<Map<String, String>> optionTypeCode = this.masterService.getOptionTypeCode();
			List<Map<String, String>> feeCode = this.masterService.getFeeCode();
			List<Map<String, String>> liveInCode = this.masterService.getLiveInCode();
			List<Map<String, String>> sellCode = this.masterService.getSellCode();
			
			mav.addObject("roomTypeCode", roomTypeCode);
			mav.addObject("ELVCode", ELVCode);
			mav.addObject("hcTypeCode", hcTypeCode);
			
			mav.addObject("optionSelectCode", optionSelectCode);
			mav.addObject("petCode", petCode);
			mav.addObject("parkingCode", parkingCode);
			mav.addObject("optionTypeCode", optionTypeCode);
			mav.addObject("feeCode", feeCode);
			mav.addObject("liveInCode", liveInCode);
			mav.addObject("sellCode", sellCode);

		} catch (Exception e) {
			System.out.println("Master - sellerCodeForm error");
			System.out.println(e.getMessage());
		}

		return mav;
	}

	// --------------------------------
	// 목록 수정 -> 공인중개사 code get
	// --------------------------------
	@RequestMapping(value = "/master/realtorCodeForm.do")
	public ModelAndView reatorCodeForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/realtorCodeForm.jsp");

		try {
			List<Map<String, String>> authCode = this.masterService.getAuthCode();
			List<Map<String, String>> signupRouteCode = this.masterService.getSignupRouteCode();

			mav.addObject("authCode", authCode);
			mav.addObject("signupRouteCode", signupRouteCode);

		} catch (Exception e) {
			System.out.println("Master - realtorCodeForm error");
			System.out.println(e.getMessage());

		}

		return mav;
	}
	// --------------------------------
	// 목록 수정 -> 렌탈 code get
	// --------------------------------

	@RequestMapping(value = "/master/rentalCodeForm.do")
	public ModelAndView rentalCodeForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/rentalCodeForm.jsp");

		try {
			List<Map<String, String>> rentalCode = this.masterService.getRentalCode();
			List<Map<String, String>> rentalProductCode = this.masterService.getRentalProductCode();

			mav.addObject("rentalCode", rentalCode);
			mav.addObject("rentalProductCode", rentalProductCode);

		} catch (Exception e) {
			System.out.println("Master - rentalCodeForm error");
			System.out.println(e.getMessage());

		}

		return mav;
	}

	// --------------------------------
	// 목록 수정 -> code 입력, 수정, 삭제
	// --------------------------------

	@RequestMapping(value = "/master/allCodeProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int allCodeProc(MasterAllCodeDTO masterAllCodeDTO,
			@RequestParam(value = "changeCode[]", required = false) List<String> changeCode,
			@RequestParam(value = "tableInfo[]", required = false) List<String> tableInfo,
			@RequestParam(value = "check", required = false) String check) {

		int sellerCodeCnt = 0;
		try {
			if (check.equals("del")) {
				sellerCodeCnt = this.masterService.delAllCode(masterAllCodeDTO);
			} else if (check.equals("up")) {

				sellerCodeCnt = this.masterService.upAllCode(changeCode, tableInfo);

			} else if (check.equals("in")) {

				sellerCodeCnt = this.masterService.inAllCode(masterAllCodeDTO);
			}

		} catch (Exception e) {
			System.out.println("sellerCodeProc 실패");
			System.out.println(e.getMessage());
			sellerCodeCnt = -1;
		}

		return sellerCodeCnt;

	}
	// --------------------------------
	// 점검 중 toggle 페이지 접속
	// --------------------------------

	@RequestMapping(value = "/master/checkingForm.do")
	public ModelAndView checkingForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/checkingForm.jsp");
		
		try {
			String checkCode = this.masterService.getCheckCode();
			
			List<Map<String,String>> stopValueList = this.masterService.getStopValue();

			mav.addObject("checkCode", checkCode);
			mav.addObject("stopValueList", stopValueList);
			
		}catch(Exception e) {
			System.out.println("checkingForm 실패");
			System.out.println(e.getMessage());
		}

		return mav;
	}

	// --------------------------------
	// 점검 중 toggle
	// --------------------------------
	@RequestMapping(value = "/master/checkingProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int checkingProc(HttpSession session, MasterCheckcodeDTO masterCheckcodeDTO/* @RequestParam(value = "checkCode") String checkCode*/) {

		int checkingCnt = 0;

		try {

			checkingCnt = this.masterService.updateCheckCode(masterCheckcodeDTO);

		} catch (Exception e) {
			System.out.println("checkingProc 실패");
			System.out.println(e.getMessage());
			checkingCnt = -1;

		}

		return checkingCnt;
	}

	// --------------------------------
	// 점검 중 점검 페이지 띄우기
	// --------------------------------

	@RequestMapping(value = "/checking.do")
	public ModelAndView checking(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/checking.jsp");
		
		try {
			
			List<Map<String, String>> getCheckInfo = this.masterService.getCheckInfo();
		
			mav.addObject("getCheckInfo", getCheckInfo);
		}catch(Exception e) {
			System.out.println("checking 접속 실패");
			System.out.println(e.getMessage());
		}


		return mav;
	}
	
	
	// --------------------------------
	// 긴급 중단
	// --------------------------------
		@RequestMapping(value = "/master/stoppingProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public int stoppingProc(HttpSession session , @RequestParam(value = "checkValue[]", required = false) List<String> checkValue) {

			int checkingCnt = 0;
			
			try {

				 checkingCnt = this.masterService.insertStopValue(checkValue);

			} catch (Exception e) {
				System.out.println("stoppingProc 실패");
				System.out.println(e.getMessage());
				checkingCnt = -1;

			}

			return checkingCnt;
		}
		
		// --------------------------------
		// 긴급 중단 취소
		// --------------------------------
			@RequestMapping(value = "/master/cancelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public int cancelProc(HttpSession session , @RequestParam(value = "cancelValue", required = false) String cancelValue) {

				int checkingCnt = 0;
				
				try {

					 checkingCnt = this.masterService.cancelStopValue(cancelValue);

				} catch (Exception e) {
					System.out.println("stoppingProc 실패");
					System.out.println(e.getMessage());
					checkingCnt = -1;

				}

				return checkingCnt;
			}		
	
		// --------------------------------
		// 긴급 중단 알림 페이지
		// --------------------------------

		@RequestMapping(value = "/master/emergencyStopPage.do")
		public ModelAndView emergencyStopPage(HttpSession session) {

			ModelAndView mav = new ModelAndView();
			mav.setViewName("/master/emergencyStopPage.jsp");


			return mav;
		}


	// --------------------------------
	// 공지 띄우는 페이지 
	// --------------------------------

	@RequestMapping(value = "/master/sendNoticeMsg.do")
	public ModelAndView sendNoticeMsg(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master/sendNoticeMsg.jsp");


		return mav;
	}

	// --------------------------------
	// master 로그인 페이지
	// --------------------------------

	@RequestMapping(value = "/master.do")
	public ModelAndView master(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/master.jsp");

		return mav;
	}
}
