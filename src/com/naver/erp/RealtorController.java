package com.naver.erp;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RealtorController {

	@Autowired
	private RealtorService realtorService;

	
	
	// =============================================================================
	// proHome.do 공인중개사 홈 화면
	// =============================================================================
	@RequestMapping(value = "/realtor/proHome.do")
	public ModelAndView goProHomeForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/proHome.jsp");
		try {
			String r_id = (String) session.getAttribute("r_id");
			if (r_id != null) {
				RealtorMenuInfoDTO realtorMenuInfoDTO =  this.realtorService.getInfo(r_id);
				 session.setAttribute("r_no", realtorMenuInfoDTO.getR_no());	
				 mav.addObject("realtorMenuInfoDTO", realtorMenuInfoDTO);
			}
			
			/*
			 * if (r_id == null) {
			 * System.out.println("현재 회원탈퇴해서 r_id 값이 null 값이 되어서 이게 나오는 거임.");
			 * session.removeAttribute(r_id); }
			 */
			
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}

		return mav;
	}
	
	

	// =============================================================================
	// proRegisterJoin1.do 공인중개사 회원가입 1페이지
	// =============================================================================
	@RequestMapping(value = "/realtor/proRegisterJoinFir.do")
	public ModelAndView goProRegisterJoinFirForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/proRegisterJoinFir.jsp");
		return mav;
	}

	
	
	// =============================================================================
	// proRegisterJoin2.do 공인중개사 회원가입 2페이지
	// =============================================================================
	@RequestMapping(value = "/realtor/proRegisterJoinSec.do")
	public ModelAndView goProRegisterJoinSecForm(RealtorDTO realtorDTO, MultipartFile imageFile,
			 HttpSession session, MultipartHttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/proRegisterJoinSec.jsp");

		session.setAttribute("imageFile", imageFile);
		
		mav.addObject("realtorDTO", realtorDTO);

		return mav;
	}
	
	
	
	
	
	
	// 20202.01.20 monday
	// =============================================================================
	// $.ajax - realtorNumProc.do in proRegisterJoin2
	// =============================================================================
	@RequestMapping(
			value="/realtor/realtorNumProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int realtorNumProc(RealtorDTO realtorDTO) {
		int realtorNumCnt=0;
		try {
			realtorNumCnt = this.realtorService.getRealtorNumCnt(realtorDTO);
			//System.out.println( realtorDTO.getRi_realtor_num() );
			//System.out.println( "realtorNumCnt  >>  " + realtorNumCnt  );
				
		}catch(Exception e) {
			System.out.println(e.getMessage());
			realtorNumCnt = -1;
		}
		return realtorNumCnt;

	}
	// =============================================================================
	// $.ajax - realtorNumProc.do in proRegisterJoin2
	// =============================================================================
	@RequestMapping(
			value="/realtor/businessNumProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int businessNumProc(RealtorDTO realtorDTO) {
		int businessNumCnt=0;
		try {
			businessNumCnt = this.realtorService.getBusinessNumCnt(realtorDTO);
			//System.out.println( realtorDTO.getRi_business_num() );
			//System.out.println( "businessNumCnt  >>  " + businessNumCnt  );
				
		}catch(Exception e) {
			System.out.println(e.getMessage());
			businessNumCnt = -1;
		}
		return businessNumCnt;

	}
	
	
	
	
	
	
	
	
	
	// =============================================================================
	// realtorWithdrawal.do - 공인중개사 탈퇴하는 페이지로 이동 
	// =============================================================================
	@RequestMapping(value = "/realtor/realtorWithdrawal.do")
	public ModelAndView goRealtorWithdrawalForm(RealtorDTO realtorDTO, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/realtorWithdrawal.jsp");
		int r_no = (int)session.getAttribute("r_no");
		realtorDTO.setR_no(r_no);
		return mav;
	}
	
	
	// =============================================================================
	// realtorWithdrawalProc.do - 공인중개사 탈퇴하는 pro 메소드
	// =============================================================================
	@RequestMapping(
			value="/realtor/realtorWithdrawalProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int realtorWithdrawalProc(
		RealtorDTO realtorDTO, HttpSession session
		) {
		int withdrawalCnt=0;
		try {
				withdrawalCnt = this.realtorService.deleteRealtor(realtorDTO);
				session.removeAttribute("r_id");
				//System.out.println( "withdrawalCnt >> " + withdrawalCnt );
				
				
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return withdrawalCnt;

	}
	
	
	// =============================================================================
	// realtorModifyPwdCheckProc.do - 공인중개사 정보수정 시 비밀번호 갯수 확인
	// =============================================================================
		@RequestMapping(
				value="/realtor/realtorModifyPwdCheckProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int realtorModifyPwdCheckProc(
			RealtorDTO realtorDTO
			) {
			int pwdCnt=0;
			try {
					
				pwdCnt = this.realtorService.realtorPwdCnt(realtorDTO);
					
			}catch(Exception e) {
				System.out.println("에러발생"+pwdCnt);
				System.out.println(e.getMessage());
			}
			return pwdCnt;

		}
		
		
	
	// =============================================================================
	// realtorModifyPwdCheck.do - 공인중개사 회원정보 수정 비밀번호 체크 페이지 이동
	// =============================================================================
	@RequestMapping(value = "/realtor/realtorModifyPwdCheck.do")
	public ModelAndView goRealtorModifyPwdCheckForm(RealtorDTO realtorDTO, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/realtorModifyPwdCheck.jsp");
		int r_no = (int)session.getAttribute("r_no");
		realtorDTO.setR_no(r_no);
		return mav;
		
	}
	
	// =============================================================================
	// proRegisterJoinFin.do 공인중개사 회원가입 완성
	// =============================================================================
	@RequestMapping(value = "/realtor/proRegisterJoinFin.do")
	public ModelAndView goProRegisterJoinFinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/proRegisterJoinFin.jsp");
		return mav;
	}
	
	// =============================================================================
	// forgetRealtorId 페이지 화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/realtor/forgetRealtorId.do")
	public ModelAndView goForgetRealtorIdForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/forgetRealtorId.jsp");
	
		return mav;
	}
	// =============================================================================
	// forgetRealtorIdProc.do - 공인중개사 id 찾기
	// =============================================================================
	@RequestMapping(
			value="/realtor/forgetRealtorIdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public JSONObject forgetRealtorIdProc(
			RealtorDTO realtorDTO
	/* ,@RequestParam(value="upDel") String upDel */
		) {
		//System.out.println("컨트롤러시작");
		JSONObject jsonObject = new JSONObject();
		String realtorId = null;
		
		try {
			realtorId = this.realtorService.realtorIdCnt(realtorDTO);
			jsonObject.put("realtorId", realtorId);

		}catch(Exception e) {
			System.out.println(e.getMessage());  
		}
		return jsonObject;

	}
	// =============================================================================
	// forgetRealtorPwd 페이지 화면으로 이동
	// =============================================================================
	@RequestMapping(value = "/realtor/forgetRealtorPwd.do")
	public ModelAndView goForgetRealtorPwdForm(HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/forgetRealtorPwd.jsp");
	
		return mav;
	}
	// =============================================================================
	// forgetRealtorIdProc.do - 공인중개사 pwd 찾기
	// =============================================================================
	@RequestMapping(
			value="/realtor/forgetRealtorPwdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public JSONObject forgetRealtorPwdProc(
		RealtorDTO realtorDTO
		) {
		System.out.println("컨트롤러시작");
		JSONObject jsonObject = new JSONObject();
		String realtorPwdGet = null;
		
		try {
			realtorPwdGet = this.realtorService.realtorPwdGet(realtorDTO);
			jsonObject.put("realtorPwd", realtorPwdGet);

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return jsonObject;

	}
	
	
	
	// =============================================================================
	// proMyPageHome.do. 공인중개사 마이페이지 홈
	// =============================================================================
	@RequestMapping(value = "/realtor/proMyPageHome.do")
	public ModelAndView goProMyPageHomeForm(
			HttpSession session
			, RealtorSearchDTO realtorSearchDTO
			//, RealtorSaleRoomListDTO realtorSaleRoomListDTO
			) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/proMyPageHome.jsp");
		String r_id = (String) session.getAttribute("r_id");
		try {
//			int r_no = this.realtorService.getR_no(r_id); 
//			session.setAttribute("r_no", r_no);
			RealtorMenuInfoDTO realtorMenuInfoDTO =  this.realtorService.getInfo(r_id);
			 session.setAttribute("r_no", realtorMenuInfoDTO.getR_no());
			 session.setAttribute("image_name", realtorMenuInfoDTO.getImage_name());
			 session.setAttribute("realtorMenuInfoDTO", realtorMenuInfoDTO);
			 
			 mav.addObject("realtorMenuInfoDTO", realtorMenuInfoDTO);
			 //System.out.println( "================================" );
			 //System.out.println( realtorMenuInfoDTO.getImage_name() );
			 //System.out.println( "================================" );
			 //int getRealtorSaleRoomList = this.realtorService.getgetRealtorSaleRoomList(getRealtorSaleRoomList);
			
			
			realtorSearchDTO.setR_no(realtorMenuInfoDTO.getR_no());
			int realtorSaleRoomAllCnt = this.realtorService.getRealtorSaleRoomAllCnt(realtorSearchDTO);
//			System.out.println( "realtorSaleRoomAllCnt >>" + realtorSaleRoomAllCnt );
			if(realtorSaleRoomAllCnt>0) { 	
				int selectPageNo = realtorSearchDTO.getSelectPageNo();			
				int rowCntPerPage = realtorSearchDTO.getRowCntPerPage();			
				int beginRowNo = selectPageNo*rowCntPerPage-rowCntPerPage +1;	// start hang			
				if(realtorSaleRoomAllCnt < beginRowNo ) {
					realtorSearchDTO.setSelectPageNo(1);
				}
			}
			mav.addObject("realtorSaleRoomAllCnt",realtorSaleRoomAllCnt);
			
			List<Map<String,String>> realtorSaleRoomList  = this.realtorService.getRealtorSalRoomList();
			mav.addObject("realtorSaleRoomList",realtorSaleRoomList);
//			System.out.println(" realtorSaleRoomList Size() "+realtorSaleRoomList.size());
//			System.out.println(realtorSaleRoomList.get(0));
//			System.out.println(realtorSaleRoomList.get(1));
			
			
			int r_no = realtorMenuInfoDTO.getR_no();
			List<Map<String,String>> rateOfSalesList = this.realtorService.getRateOfSalesList(r_no);
			mav.addObject("rateOfSalesList",rateOfSalesList);
			//System.out.println(" rateOfSalesList Size() "+rateOfSalesList.size());
			//System.out.println(rateOfSalesList.get(0));
			
			
			List<Map<String,String>> salesByRegionList = this.realtorService.getSalesByRegionList(r_no);
			mav.addObject("salesByRegionList",salesByRegionList);
			//System.out.println(" salesByRegionList Size() "+salesByRegionList.size());
			//System.out.println(salesByRegionList.get(0));
			
			// proleftBar Menu에서 보여줄 프로필 사진 아래 부분.
			String authority = this.realtorService.getAuthority(r_no);
			session.setAttribute("authority", authority);
			mav.addObject("authority", authority);
				
			}
			catch(Exception e) {
				System.out.println(e.getMessage());
			}
			return mav;
		}
		
	
	

	// =============================================================================
	// confirmPwd.do. 
	// =============================================================================
	// member info update
	@RequestMapping(value = "/realtor/confirmPwd.do")
	public ModelAndView goConfirmPwdForm(/* @RequestParam(value = "r_no", required = false) int r_no */ HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/confirmPWD.jsp");
		// If you use the "r_no" plz use the under r_no & DB connection use try{}catch{} 
		int r_no = (int) session.getAttribute("r_no");
		mav.addObject("r_no", r_no);
		return mav;
	}

	
	// =============================================================================
	// contentMemberInfo.do. 
	// =============================================================================
	// member info update
		@RequestMapping(value = "/realtor/contentMemberInfo.do")
		public ModelAndView goContentMemberInfoForm(
				//@RequestParam(value = "r_no", required = false) int r_no,
				HttpSession session
				) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/realtor/contentMemberInfo.jsp");
			//String r_id = (String) session.getAttribute("r_id");
			RealtorMenuInfoDTO realtorMenuInfoDTO = (RealtorMenuInfoDTO)session.getAttribute("realtorMenuInfoDTO");
		    mav.addObject("realtorMenuInfoDTO", realtorMenuInfoDTO);

			try {	
				// If you use the "r_no" plz use the under r_no & DB connection use try{}catch{} 
				int r_no = (int) session.getAttribute("r_no");
				RealtorDTO realtorDTO = this.realtorService.getRealtorDTO(r_no);
				realtorDTO.setR_no(r_no);
				mav.addObject("realtorDTO", realtorDTO);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return mav;
		}

		
		
	// =============================================================================
	// realtorInfoUpProc.do. 
	// =============================================================================
		@RequestMapping(value = "/realtor/realtorInfoUpProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public int realtroInfoUpProc(RealtorDTO realtorDTO, /*@RequestParam(value = "r_no", required = false) int r_no*/
					HttpSession session
				) {
			int realtorUpdateCnt = 0;
			try {
				/* realtorDTO.setR_no(r_no); */
				// If you use the "r_no" plz use the under r_no & DB connection use try{}catch{} 
				int r_no = (int) session.getAttribute("r_no");
				realtorDTO.setR_no(r_no);
				realtorUpdateCnt = this.realtorService.updateRealtor(realtorDTO);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				realtorUpdateCnt = -2;
			}

			return realtorUpdateCnt;
		}



	// =============================================================================
	// customerCenter.do. 고객센터
	// =============================================================================
	@RequestMapping(value = "/realtor/customerCenter.do")
	public ModelAndView goCustomerCenterForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/customerCenter.jsp");
		return mav;
	}

	
	// =============================================================================
	// managementHouse.do. 부동산현황
	// =============================================================================
	@RequestMapping(value = "/realtor/managementHouse.do")
	public ModelAndView goManagementHouseForm(
				SellroomSearchDTO sellroomSearchDTO, RealtorDTO realtorDTO, RealtorProductDTO realtorProductDTO,
				HttpSession session
				) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/managementHouse.jsp");
	    int r_no = (int)session.getAttribute("r_no");
	    RealtorMenuInfoDTO realtorMenuInfoDTO = (RealtorMenuInfoDTO)session.getAttribute("realtorMenuInfoDTO");
	    mav.addObject("realtorMenuInfoDTO", realtorMenuInfoDTO);
	    //realtorMenuInfoDTO.setR_no(r_no);
	    sellroomSearchDTO.setR_no(r_no);
	    realtorProductDTO.setR_no(r_no);
	    realtorDTO.setR_no(r_no);
		String authority = (String) session.getAttribute("authority");
	    
		try {
		
			String uri = (String) session.getAttribute("realtor_uri");
			if (uri == null || uri.equals("managementHouse.do")) {
				session.setAttribute("sellroomSearchDTO", sellroomSearchDTO);
			} else {
				sellroomSearchDTO = (SellroomSearchDTO) session.getAttribute("sellroomSearchDTO");
			}
			session.setAttribute("realtor_uri", "managementHouse.do");
			//session.setAttribute("r_no", r_no);
			
			
			
			
			int roomListAllCnt = this.realtorService.getRoomListAllCnt(sellroomSearchDTO);
			int smallRoomCnt = this.realtorService.getSmallRoomCnt(sellroomSearchDTO);
			int middleRoomCnt = this.realtorService.getMiddleRoomCnt(sellroomSearchDTO);
			int bigRoomCnt = this.realtorService.getBigRoomCnt(sellroomSearchDTO);
			int smallMiddleRoomCnt = this.realtorService.getSmallMiddleRoomCnt(sellroomSearchDTO);
			
			if (roomListAllCnt > 0) {
				int selectPageNo = sellroomSearchDTO.getSelectPageNo();
				int rowCntPerPage = sellroomSearchDTO.getRowCntPerPage();
				int beginRowNo = selectPageNo * rowCntPerPage - rowCntPerPage + 1;
				if (roomListAllCnt < beginRowNo) {
					sellroomSearchDTO.setSelectPageNo(1);
				}
			}
			//List<Map<String, String>> roomList = this.realtorService.getRoomList(sellroomSearchDTO);
			List<Map<String, String>> roomList = this.realtorService.getRoomList(realtorProductDTO);
			List<Map<String, String>> addrList = this.realtorService.getAddrList(sellroomSearchDTO);
			// --------------------------------------------------------------------------------------------
			mav.addObject("roomList", roomList);
			mav.addObject("addrList", addrList);
			mav.addObject("roomListAllCnt", roomListAllCnt);
			mav.addObject("smallRoomCnt", smallRoomCnt);
			mav.addObject("smallMiddleRoomCnt", smallMiddleRoomCnt);
			mav.addObject("middleRoomCnt", middleRoomCnt);
			mav.addObject("bigRoomCnt", bigRoomCnt);
			//mav.addObject("sellroomSearchDTO", sellroomSearchDTO);
			mav.addObject("authority", authority);


		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mav;
	}
	
	//==================================================================================================================================================2020.01.22 wonhyeok's coding
	@RequestMapping(
			value="/realtor/managementHouseProc_code2.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int managementHouseProc_code2Cnt(
			RealtorProductDTO realtorProductDTO, HttpSession session
		) {
		int CheckOwnerCodeCnt = 0;
	    int r_no = (int)session.getAttribute("r_no");
	    realtorProductDTO.setR_no(r_no);
		try {
			CheckOwnerCodeCnt = this.realtorService.updateCheck_codeOf2(realtorProductDTO);
			
			

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return CheckOwnerCodeCnt;

	}
	
	//==================================================================================================================================================2020.01.22 wonhyeok's coding
	// =============================================================================
	// managementHouseProc.do. 
	// =============================================================================
	@RequestMapping(value = "/realtor/managementHouseProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int managementHouseProc(
			SellroomSearchDTO sellroomSearchDTO, HttpSession session
		){
		
			int CheckCnt = 0;
		    int r_no = (int)session.getAttribute("r_no");
		    sellroomSearchDTO.setR_no(r_no);
		    
	
			try {
					//System.out.println(">>>> " + sellroomSearchDTO.getSr_no());
					CheckCnt = this.realtorService.updateCheck(sellroomSearchDTO);
					
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				CheckCnt = -2;
			}
			return CheckCnt;
	}
	
	



	// =============================================================================
	// uploadHouse.do. 방올리기
	// =============================================================================
	@RequestMapping(value = "/realtor/uploadHouse.do")
	public ModelAndView goUploadHouseForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/uploadHouse.jsp");
		return mav;
	}

	
	
	// =============================================================================
	// managementProduct.do. 
	// =============================================================================
	@RequestMapping( value="/realtor/managementProduct.do" )
	   public ModelAndView managementProduct(
			   RealtorProductDTO realtorProductDTO
			   ,HttpSession session) 
	{
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/realtor/managementProduct.jsp");
	      int r_no = (int)session.getAttribute("r_no");
	      realtorProductDTO.setR_no(r_no);
	      
	      RealtorMenuInfoDTO realtorMenuInfoDTO = (RealtorMenuInfoDTO)session.getAttribute("realtorMenuInfoDTO");
		  mav.addObject("realtorMenuInfoDTO", realtorMenuInfoDTO);
		  String authority = (String) session.getAttribute("authority");
	      try {
	         // reg emptyRoom cnt
	    	
	         int emptyRoomAllCnt=this.realtorService.getEmptyRoomAllCnt(realtorProductDTO);
	         //System.out.print("emptyRoomAllCnt_controller =>"+ emptyRoomAllCnt);
	         if(emptyRoomAllCnt>0) {
	            int selectPageNo = realtorProductDTO.getSelectPageNo();
	            int rowCntPerPage = realtorProductDTO.getRowCntPerPage();
	            int beginRowNo = selectPageNo*rowCntPerPage-rowCntPerPage +1;   // start hang
	            if(emptyRoomAllCnt < beginRowNo ) {
	               realtorProductDTO.setSelectPageNo(1);
	            }
	         }      
	         // List of Reg EmptyRoom
	         List<Map<String,String>> emptyRoomList = this.realtorService.getEmptyRoomList(realtorProductDTO);
	         //System.out.print("emptyRoomList_controller =>"+ emptyRoomList.size()); 
	         mav.addObject("emptyRoomAllCnt",emptyRoomAllCnt);
	         mav.addObject("emptyRoomList",emptyRoomList);
	         mav.addObject("realtorProductDTO",realtorProductDTO);
	         mav.addObject("authority", authority);
//	         System.out.println( realtorProductDTO.getImage_name() );
	         //System.out.print("select Page Number =>"+realtorProductDTO.getSelectPageNo());
	         //System.out.print("\nrow count per page>"+realtorProductDTO.getRowCntPerPage());
	      }catch(Exception e) {
	         System.out.println("< List error occure >");
	         System.out.println(e.getMessage());
	      }
	      return mav;
	   }


	
	// =============================================================================
	// realtorIdCheck.do. 아이디체크
	// =============================================================================
	@RequestMapping(value = "/realtor/realtorIdCheck.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int realtorIdCheck(HttpSession session, RealtorDTO realtorDTO) {
		int realtorRegCnt = 0;
		try {
			realtorRegCnt = this.realtorService.realtorIdCheck(realtorDTO);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			realtorRegCnt = -2;
		}
		return realtorRegCnt;
	}


	// =============================================================================
	// realtorReg2Proc.do. 공인중개사 회원가입2 Proc 메소드
	// =============================================================================
	@RequestMapping(value = "/realtor/realtorReg2Proc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int realtorReg2Proc(HttpSession session, RealtorDTO realtorDTO, HttpServletResponse response) {
		int realtorRegCnt = 0;
		MultipartFile imageFile = (MultipartFile)session.getAttribute("imageFile");
		
		
		try {		
				//System.out.println("asdfasghwgr");
				String saveName = saveFile(imageFile);
				
	            realtorDTO.setImage_name(saveName);	
	            
	            realtorRegCnt = this.realtorService.insertRealtor(realtorDTO);
	            //System.out.println("imageFile " + imageFile);
	            session.removeAttribute("imageFile");
	            
		} catch (Exception e) {
			System.out.println(e.getMessage());
			realtorRegCnt = -2;
		}
		return realtorRegCnt;
	}

	
	protected String saveFile(MultipartFile file){
		
		String filePath = null;
        
        filePath = "D:\\document\\Stu_2020_02_12_cwh\\workspace_04\\javaBang\\WebContent\\WEB-INF\\resources\\profileImage\\" ;
        //"C:\\Users\\choiwonhyeok\\Documents\\workspace2\\javaBang\\WebContent\\WEB-INF\\resources\\images\\profileImage";  원혁
        //D:\document\Stu_2020_02_12_cwh\workspace_04\javaBang\WebContent\WEB-INF\resources\profileImage
        
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();

	    // 저장할 File 객체를 생성(껍데기 파일)ㄴ
	    File saveFile = new File(filePath,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} 


	// =============================================================================
	// productContent.do. 
	// =============================================================================
	@RequestMapping(value = "/realtor/productContent.do")
	public ModelAndView goProductContent(@RequestParam(value = "sr_no") int sr_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/realtor/productContent.jsp");
		try {
			RealtorProductDTO realtorProductDTO = this.realtorService.getrealtorProductDTO(sr_no);
//			System.out.println("Contentproduct =>" + realtorProductDTO);
			mav.addObject("realtorProductDTO", realtorProductDTO);
		} catch (Exception e) {
			//System.out.println("goProductContent error ");
			System.out.println(e.getMessage());
		}
		return mav;
	}

	
	
	// =============================================================================
	// productContentProc.do. 
	// =============================================================================
	@RequestMapping(value = "/realtor/productContentProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int productContentProc(
			RealtorProductDTO realtorProductDTO/* ,HttpServletRequest request,HttpServletResponse response */
			, @RequestParam(value = "checkOwner") String checkOwner
			, HttpSession session) {
		// String checkOwner = "";
		// checkOwner = request.getParameter("checkOwner");
		// System.out.println("checkOwner=>"+checkOwner);
		int CheckCnt = 0;
	    int r_no = (int)session.getAttribute("r_no");
	    realtorProductDTO.setR_no(r_no);

		try {
			//System.out.println(" r_no=>" + r_no);
			if (checkOwner.equals("check")) {
				CheckCnt = this.realtorService.updateCheckOwnerCode(realtorProductDTO);
			} else if (checkOwner.equals("register")) {
				CheckCnt = this.realtorService.updateCheckRegisterCode(realtorProductDTO);
			}
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println(" emptyUpDelProc error ");
		}
		return CheckCnt;
	}

	
}







