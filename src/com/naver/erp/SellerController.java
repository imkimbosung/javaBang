package com.naver.erp;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// soyoung's coding
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	
	
	
	
	@RequestMapping(value = "/Main_javaBang.do")
	public ModelAndView goMain_javaBang(
			HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("Main_javaBang.jsp");
		
		try {
				
				List<Map<String,String>> topRealtorList  = this.sellerService.topRealtorList();

				mav.addObject("topRealtorList", topRealtorList);

		           
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping( value="/seller/ownerHomeForm.do" )
	public ModelAndView goOwnerHomeForm(HttpSession session , SellerDTO sellerDTO) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/ownerHomeForm.jsp");
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		
		if(s_id != null) {
			sellerDTO.setS_id(s_id);
			String s_name = this.sellerService.getS_name(sellerDTO);
			mav.addObject("s_name",s_name);
			mav.addObject("sellerDTO",sellerDTO);
		}
		
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping( value = "/seller/checkRoomForm.do" )
	public ModelAndView goCheckRoomForm(HttpServletRequest request, SellerDTO sellerDTO, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/checkRoomForm.jsp");
		
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		
		if(s_id != null) {
			sellerDTO.setS_id(s_id);
			String s_name = this.sellerService.getS_name(sellerDTO);
			mav.addObject("s_name",s_name);
		}
		
	    try {  
	    	//get roomtype form from DataBase
		    List<Map<String, String>> roomTypeCode = this.sellerService.getRoomTypeCode();
		    mav.addObject("roomTypeCode", roomTypeCode);
		    
		    //add values in jsp & parameter => remember value (for go back to prev page)
		    mav.addObject("roomType_code", request.getParameter("roomtype_code"));
			mav.addObject("sr_roomsize", request.getParameter("sr_roomsize") );
			mav.addObject("sr_builddate", request.getParameter("sr_builddate") );
	    
	    }catch(Exception e) {
	    	System.out.println("<Error => sellerController_checkRoomForm.do >");
	    	System.out.println(e.getMessage());
	    }
		
		return mav;
	}
	/*
	@RequestMapping(
			value = "/checkRegProc.do"
			, method = RequestMethod.POST
			, produces = "application/json;charset=UTF-8"
			)

	
	@ResponseBody
	public int insertCheck(SellerRoomDTO sellerRoomDTO) {
		System.out.println("<insertCheck> 占쎌깈�빊占�");
		int checkRoomCnt = 0;
		try {
			checkRoomCnt = this.sellerService.insertCheck(sellerRoomDTO);

		} catch (Exception e) {
			System.out.println("<insertCheck> 占쎈퓠占쎌쑎獄쏆뮇源�");
			System.out.println(e.getMessage());
			checkRoomCnt = -1;
		}
		return checkRoomCnt;
	};
	*/
	
	@ResponseBody
	@RequestMapping(
			value = "/seller/checkAddrForm.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
			)
	public ModelAndView goCheckAddrForm(
			SellerRoomDTO sellerRoomDTO, SellerDTO sellerDTO ,HttpServletRequest request , HttpSession session
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/checkAddrForm.jsp");
		
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		
		if(s_id != null) {
			sellerDTO.setS_id(s_id);
			String s_name = this.sellerService.getS_name(sellerDTO);
			mav.addObject("s_name",s_name);
		}
		try {
			//send parameter values
			mav.addObject("roomType_code", sellerRoomDTO.getRoomtype_code() );
			mav.addObject("sr_roomsize", sellerRoomDTO.getSr_roomsize() );
			mav.addObject("sr_builddate", sellerRoomDTO.getSr_builddate() );
			
			//add values in jsp & parameter => remember value (for go back to prev page)
			mav.addObject("sr_zip_code", request.getParameter("sr_zip_code"));
			mav.addObject("sr_addr", request.getParameter("sr_addr") );
			mav.addObject("sr_detail_addr", request.getParameter("sr_detail_addr") );
			mav.addObject("sr_room_floor", request.getParameter("sr_room_floor") );
			
			session.setAttribute("sr_addr", request.getParameter("sr_addr"));

		}catch(Exception e) {
	    	System.out.println("<Error => sellerController_checkRoomForm.do >");
	    	System.out.println(e.getMessage());
		}
		return mav;
	};	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/seller/goSellTypeForm.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8") 
	public ModelAndView goSellTypeForm( SellerRoomDTO sellerRoomDTO, SellerDTO sellerDTO, HttpServletRequest request, HttpSession session)
	{ 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/sellTypeForm.jsp");
		
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		
		if(s_id != null) {
			sellerDTO.setS_id(s_id);
			String s_name = this.sellerService.getS_name(sellerDTO);
			mav.addObject("s_name",s_name);
		}
		
		try {
			//send parameter values
			mav.addObject("roomType_code", sellerRoomDTO.getRoomtype_code() );
			mav.addObject("sr_roomsize", sellerRoomDTO.getSr_roomsize() );
			mav.addObject("sr_builddate", sellerRoomDTO.getSr_builddate() );
			mav.addObject("sr_zip_code", sellerRoomDTO.getSr_zip_code());
			mav.addObject("sr_addr", sellerRoomDTO.getSr_addr() );
			mav.addObject("sr_detail_addr", sellerRoomDTO.getSr_detail_addr() );
			mav.addObject("sr_room_floor", sellerRoomDTO.getSr_room_floor() );

			//get roomtype form from DataBase
			List<Map<String, String>> sellTypeCode = this.sellerService.getSellTypeCode();
			List<Map<String, String>> optionTypeCode = this.sellerService.getOptionTypeCode();
			List<Map<String, String>> optionSelectCode = this.sellerService.getOptionSelectCode();
			List<Map<String, String>> codePetAvailable = this.sellerService.getPetAvailableCode();
			List<Map<String, String>> codeElv = this.sellerService.getElvCode();
			List<Map<String, String>> codeHcType = this.sellerService.getHcTypeCode();
			List<Map<String, String>> codeLiveInType = this.sellerService.getLiveInTypeCode();
			List<Map<String, String>> codeManageFee = this.sellerService.getManageFeeCode();
			List<Map<String, String>> codeParkingAvailable = this.sellerService.getParkingAvailableCode();
			
			//add values in jsp & parameter => remember value (for go back to prev page)
			mav.addObject("optionTypeCode", optionTypeCode);
			mav.addObject("sellTypeCode", sellTypeCode);
			mav.addObject("optionSelectCode", optionSelectCode);
			mav.addObject("codePetAvailable", codePetAvailable);
			mav.addObject("codeElv", codeElv);
			mav.addObject("codeHcType", codeHcType);
			mav.addObject("codeLiveInType", codeLiveInType);
			mav.addObject("codeManageFee", codeManageFee);
			mav.addObject("codeParkingAvailable", codeParkingAvailable);
			
			
			List<Map<String, String>> averageSalePrice = this.sellerService.getAverageSalePrice(sellerRoomDTO);
			mav.addObject("averageSalePrice", averageSalePrice);
			
			List<Map<String, String>> averageJeonsePrice = this.sellerService.getAverageJeonsePrice(sellerRoomDTO);
			mav.addObject("averageJeonsePrice", averageJeonsePrice);
		
			List<Map<String, String>> averageOneRoomPrice = this.sellerService.getAverageOneRoomPrice(sellerRoomDTO);
			
		}catch(Exception e) {
	    	System.out.println("<'goSellTypeForm' error>");
	    	System.out.println(e.getMessage());
		}
	  return mav;
	}
	
	
	
	
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//	"wonhyeok's coding"
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	@RequestMapping( value="/seller/sellTypeForm.do" )
	public ModelAndView goSellTypeForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/sellTypeForm.jsp");
		return mav;
	}
	
	
	@RequestMapping( 
	          value="/seller/sellTypeProc.do"                        
	          ,method=RequestMethod.POST                   
	          ,produces="application/json;carset=UTF-8"          
	    )
	    @ResponseBody 
	    public int insertSellRoomType(
	             SellerRoomDTO sellerRoomDTO
	             ,HttpSession session 
	/* ,MultipartFile[] imageFile */
	          ) {
	       int sellRoomRegCnt = 0;

	       String s_id = (String)session.getAttribute("s_id");
	       MultipartFile imageFile[] = (MultipartFile[])session.getAttribute("imageFile");
	       session.removeAttribute("imageFile");
	      
//	      System.out.println(imageFile.length);
	       try {
	          sellerRoomDTO.setS_id(s_id);
	          sellRoomRegCnt = this.sellerService.insertSellRoom(sellerRoomDTO);
	          if(imageFile != null) { 	  
		       
	          
	        	  String[] saveName = new String[imageFile.length];

		          
		          for( int i = 0; i < saveName.length; i++) {
		        	  saveName[i] = saveFile(imageFile[i]);
		          }
		          sellerRoomDTO.setImage_name(saveName);
		          int saveImageCnt = this.sellerService.insertImageName(sellerRoomDTO);
		          
	          }else {
	        	  // image 업로드 실패
	        	  sellRoomRegCnt = -2;
	          }
	                    
	       }
	       catch(Exception e) {
	          System.out.println("< 'insertSellRoomType' error >"); 
	          System.out.println(e.getMessage());
	          sellRoomRegCnt = -1;
	       }
	       return sellRoomRegCnt;
	    }	
	
	
	@RequestMapping( 
	          value="/seller/roomImageSession.do"                        
	          ,method=RequestMethod.POST                   
	          ,produces="application/json;carset=UTF-8"          
	    )
	    @ResponseBody 
	    public int roomImageSession(	 MultipartFile[] imageFile , HttpSession session) {
		int result = 0;
		int imageFileLength = imageFile.length;
//		System.out.println(imageFile);
		if(imageFile == null) {
			return  -1;
		}
        
	    session.setAttribute("imageFile", imageFile);

	    return result;
	    }	
	
	
	
	
	
	// =============================================================================
	// sellerPwdCheck.do - 정보수정 비밀번호 확인페이지
	// =============================================================================
	@RequestMapping(value = "/seller/sellerPwdCheck.do")
	public ModelAndView goSellerPwdCheckForm(SellerDTO sellerDTO, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/sellerPwdCheck.jsp");
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		
		return mav;
	}

	
	
	/*
	
	@RequestMapping( value="/seller/messageForm.do" )
	public ModelAndView goMessageForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/messageForm.jsp");
		return mav;
	}
	
	@RequestMapping( value="/seller/confirmForm.do" )
	public ModelAndView goConfirmForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/confirmForm.jsp");
		return mav;
	}
	
	*/
	
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	//	"wonhyeok's coding" /
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	
	// 파일 저장 코드  - KBS
protected String saveFile(MultipartFile file){
		
		
        
	//final String filePath =  "C:\\Users\\학부생김보성\\Documents\\workspace_spring\\javaBang\\WebContent\\WEB-INF\\resources\\roomImage" ;
	final String filePath = "C:\\Users\\fhxh\\Desktop\\PJT\\javaBang\\WebContent\\WEB-INF\\resources\\roomImage";
        
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


	// go forgetSellerId page
	@RequestMapping(value = "/seller/forgetSellerId.do")
	public ModelAndView goForgetSellerIdForm(HttpSession session) {
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/forgetSellerId.jsp");
	
		return mav;
	}
	
	
	
	
	// go forgetSellerPwd page
	@RequestMapping(value = "/seller/forgetSellerPwd.do")
	public ModelAndView goForgetSellerPwdForm(HttpSession session) {
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/forgetSellerPwd.jsp");
	
		return mav;
	}
	
	
	// =============================================================================
	// forgetSellerIdProc.do - 판매자 id 찾기
	// =============================================================================
	@RequestMapping(
			value="/seller/forgetSellerIdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public JSONObject forgetSellerIdProc(
		SellerSignupDTO sellerSignupDTO
	/* ,@RequestParam(value="upDel") String upDel */
		) {
//		System.out.println("컨트롤러시작");
		JSONObject jsonObject = new JSONObject();
		String sellerIdGet = null;
		
		try {
			String s_jumin1 = sellerSignupDTO.getS_jumin1();
			String s_jumin2 = sellerSignupDTO.getS_jumin2();
			String s_jumin = s_jumin1 + s_jumin2;
			sellerSignupDTO.setS_jumin(s_jumin);
			
			sellerIdGet = this.sellerService.getSellerId(sellerSignupDTO);
//			System.out.print(sellerIdGet);
			jsonObject.put("sellerId", sellerIdGet);
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return jsonObject;
	
	}
	
	// =============================================================================
	// forgetSellerPwdProc.do - 판매자 pwd 찾기
	// =============================================================================
	@RequestMapping(
			value="/seller/forgetSellerPwdProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public JSONObject forgetSellerPwdProc(
			SellerSignupDTO sellerSignupDTO
		) {
//		System.out.println("컨트롤러시작");
		JSONObject jsonObject = new JSONObject();
		String sellerPwdGet = null;
		
		try {
			String s_jumin1 = sellerSignupDTO.getS_jumin1();
			String s_jumin2 = sellerSignupDTO.getS_jumin2();
			String s_jumin = s_jumin1 + s_jumin2;
			sellerSignupDTO.setS_jumin(s_jumin);

			sellerPwdGet = this.sellerService.getSellerPwdCnt(sellerSignupDTO);
			jsonObject.put("sellerPwd", sellerPwdGet);
	
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return jsonObject;
	
	}
	
	
	
	
	@RequestMapping(value = "/seller/modifyCheckPwd.do")
	public ModelAndView modifyCheckPwdForm(HttpSession session, SellerDTO sellerDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/modifyCheckPwd.jsp");
		
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		mav.addObject("sellerDTO", sellerDTO);
		
		//after login,showing seller's name
		if(s_id != null) {
			sellerDTO.setS_id(s_id);
			String s_name = this.sellerService.getS_name(sellerDTO);
			mav.addObject("s_name",s_name);
		}
	
		return mav;
	}
	
	// =============================================================================
	// modifyPwdCheckProc.do - 판매자 정보수정 시 비밀번호 갯수 확인
	// =============================================================================
		@RequestMapping(
				value="/seller/modifyCheckPwdProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int modifyCheckPwdProc(
			HttpSession session
			) {
			int pwdCnt=0;
			try {
				String s_id = (String)session.getAttribute("s_id");
				SellerDTO sellerDTO = this.sellerService.getSellerDTO(s_id);
				pwdCnt = this.sellerService.getSellerPwdCheck(sellerDTO);
					
			}catch(Exception e) {
				System.out.println("에러발생"+pwdCnt);
				System.out.println(e.getMessage());
			}
			return pwdCnt;
	
		}
	
	// go modify Seller's info
	
	@RequestMapping(value = "/seller/modifySellerInfo.do")
	public ModelAndView modifySellerInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/modifySellerInfo.jsp");
	
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		SellerDTO sellerDTO = this.sellerService.getSellerDTO(s_id);
		mav.addObject("sellerDTO", sellerDTO);
		
		//after login,showing seller's name
		if(s_id != null) {
			//sellerDTO.setS_id(s_id);
			String s_name = this.sellerService.getS_name(sellerDTO);
			mav.addObject("s_name",s_name);
		}
	
		return mav;
	}
	
	// =============================================================================
	// sellerUpDelProc.do - 판매자 정보 수정하는 proc 메소드
	// =============================================================================
	@RequestMapping(
			value="/seller/sellerUpDelProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int sellerUpDelProc(
		SellerDTO sellerDTO
	/* ,@RequestParam(value="upDel") String upDel */
		
		) {
		int sellerUpDelCnt=0;
		try {
//				System.out.println("s_id=>"+sellerDTO.getS_id());
				sellerUpDelCnt = this.sellerService.updateSeller(sellerDTO);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return sellerUpDelCnt;
	
	}
	
	// go withdrawal page
	
	@RequestMapping(value = "/seller/withdrawal.do")
	public ModelAndView goWithdrawal(HttpSession session) {
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/withdrawal.jsp");
		
		
		String s_id = (String)session.getAttribute("s_id");
		mav.addObject("s_id", s_id);
		SellerDTO sellerDTO = this.sellerService.getSellerDTO(s_id);
		mav.addObject("sellerDTO", sellerDTO);
		
		//after login,showing seller's name
		if(s_id != null) {
			
			String s_name = this.sellerService.getS_name(sellerDTO);
			mav.addObject("s_name",s_name);
		}
	
		return mav;
	}
	
	// go withdrawal Proc
	
	@RequestMapping(
			value="/seller/withdrawalProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int withdrawalProc(SellerDTO sellerDTO, HttpSession session) {
		int withdrawalCnt=0;
		
		try {
			String s_id = (String)session.getAttribute("s_id");
			withdrawalCnt = this.sellerService.deleteSeller(sellerDTO);			
			session.removeAttribute("s_id");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return withdrawalCnt;
	}

}



















