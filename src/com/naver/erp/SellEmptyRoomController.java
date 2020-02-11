package com.naver.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SellEmptyRoomController {
	@Autowired
	SellerService sellerService;
	
	@RequestMapping( value="/seller/emptyListForm.do" )
	
	public ModelAndView goemptyListForm(
			SellerRoomSearchDTO sellerRoomSearchDTO
			, HttpSession session ) 
	{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/emptyListForm.jsp");
		String s_id = (String) session.getAttribute("s_id");
		sellerRoomSearchDTO.setS_id(s_id);
		
			if(s_id != null) {
			
			String s_name = this.sellerService.getS_name(sellerRoomSearchDTO);
			mav.addObject("s_name",s_name);
			
		}

			
		
		try {
		// reg emptyRoom cnt
			//sellerRoomSearchDTO.setS_id(s_id);
			
			//System.out.print("s_id=>" +s_id);
			
			
			
			 //int s_no = this.sellerService.getS_no(s_id);
			 //sellerRoomSearchDTO.setS_no(s_no);
			 
			int emptyRoomAllCnt=this.sellerService.getEmptyRoomAllCnt(sellerRoomSearchDTO);
			if(emptyRoomAllCnt>0) { 
				
				
				int selectPageNo = sellerRoomSearchDTO.getSelectPageNo();
				
				int rowCntPerPage = sellerRoomSearchDTO.getRowCntPerPage();
				
				int beginRowNo = selectPageNo*rowCntPerPage-rowCntPerPage +1;	// start hang
	
				if(emptyRoomAllCnt < beginRowNo ) {
					sellerRoomSearchDTO.setSelectPageNo(1);
				}
			}		

		// List of Reg EmptyRoom
		List<Map<String,String>> emptyRoomList = this.sellerService.getEmptyRoomList(sellerRoomSearchDTO);
		
		
		mav.addObject("emptyRoomAllCnt",emptyRoomAllCnt);
		mav.addObject("emptyRoomList",emptyRoomList);
		mav.addObject("sellerRoomSearchDTO",sellerRoomSearchDTO);
		
//		System.out.print("select Page Number =>"+sellerRoomSearchDTO.getSelectPageNo());
//		System.out.print("row count per page>"+sellerRoomSearchDTO.getRowCntPerPage());

		
		}catch(Exception e) {
			System.out.println("emptyListForm ==> < List error occure >");
			System.out.println(e.getMessage());
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/seller/emptyListProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int goemptyListProc(
			SellerInfoDTO sellerInfoDTO, @RequestParam(value = "confirmCode") String confirmCode
	) {

//		System.out.println("confirmCode=>" + confirmCode);
		
		int UpdateCnt = 0;
		
		try {
			
			if (confirmCode.equals("confirm")) {
//				System.out.println("confirmcode2=>" + confirmCode);
				UpdateCnt = this.sellerService.updateConfirmCode(sellerInfoDTO);
			} 
		} catch (Exception e) {
			System.out.println(" goemptyListProc error ");
		}

		return UpdateCnt;
	}
	
	
	@RequestMapping( value="/seller/roomContentForm.do" )
	public ModelAndView goroomContentForm(
			
			@RequestParam(value="sr_no") int sr_no , SellerRoomSearchDTO sellerRoomSearchDTO, HttpSession session
	) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/roomContentForm.jsp");
		String s_id = (String) session.getAttribute("s_id");
		sellerRoomSearchDTO.setS_id(s_id);
		
		if(s_id != null) {
			
			String s_name = this.sellerService.getS_name(sellerRoomSearchDTO);
			mav.addObject("s_name",s_name);
		}
		
		
		try {
			SellerInfoDTO sellerInfoDTO = this.sellerService.getSellerInfoDTO(sr_no);
			
			//String selected_option_List = sellerInfoDTO.getSelected_option();
			//String [] optionArray = selected_option_List.split(",");
			
			//List<String> optionList = new ArrayList<>();
			//for(int i=0; i<optionArray.length; i++) {
				//optionList.add(optionArray[i]);
				//System.out.println("optionList =>"+optionArray[i]);
			//}
			
			//sellerInfoDTO.setSelect_option(optionArray);
			
			
			//System.out.println("optionList =>"+optionArray[1]);
			//System.out.println("selected_option_List =>"+select_option);
			//System.out.println("Content =>"+sellerInfoDTO);
			
			mav.addObject("sellerInfoDTO",sellerInfoDTO);
			
//			System.out.println("optionList =>"+sellerInfoDTO.getSelect_option());
			
		}catch(Exception e) {
			System.out.println("goroomContentForm error ");
			System.out.println(e.getMessage());
		}
		
		return mav;
	}

	
	@RequestMapping( value="/seller/emptyUpDelForm.do", method=RequestMethod.POST )
	public ModelAndView goemptyUpDelForm(
			@RequestParam(value="sr_no") int sr_no , SellerRoomSearchDTO sellerRoomSearchDTO, HttpSession session
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/seller/emptyUpDelForm.jsp");
		String s_id = (String) session.getAttribute("s_id");
		sellerRoomSearchDTO.setS_id(s_id);
		
		if(s_id != null) {
			
			String s_name = this.sellerService.getS_name(sellerRoomSearchDTO);
			mav.addObject("s_name",s_name);
		}
		
		try {
			
			SellerInfoDTO sellerInfoDTO = this.sellerService.getSellerInfoDTO(sr_no);
			
			String selected_option_List = sellerInfoDTO.getSelected_option();
			
			String [] optionArray = selected_option_List.split(",");
			
			int [] option = new int[optionArray.length];
			
			List<String> optionList = new ArrayList<>();
			
			for(int i=0; i<option.length; i++) {
				
				optionList.add(optionArray[i]);
				option[i]=Integer.parseInt(optionArray[i]);
//				System.out.println("option =>"+ option[i]);
			}
			
			sellerInfoDTO.setSelect_option(option);
			
			
			List<Map<String, String>> roomTypeCode = this.sellerService.getRoomTypeCode(sr_no);
			List<Map<String, String>> optionTypeCode = this.sellerService.getOptionTypeCode(sr_no);
			List<Map<String, String>> optionSelectCode = this.sellerService.getOptionSelectCode(sr_no);
			
			
			mav.addObject("sellerInfoDTO",sellerInfoDTO);
			mav.addObject("roomTypeCode",roomTypeCode);
			mav.addObject("optionTypeCode",optionTypeCode);
			mav.addObject("optionSelectCode",optionSelectCode);
			
		}catch(Exception e) {
			System.out.println("< goemptyUpDelForm > error ");
			System.out.println(e.getMessage());
		}
		
		return mav;
	}

	
	@RequestMapping(value = "/seller/emptyUpDelProc.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int emptyUpDelProc(
			SellerInfoDTO sellerInfoDTO, @RequestParam(value = "upDel") String upDel
	) {

//		System.out.println("upDel=>" + upDel);
		int emptyUpDelCnt = 0;
		try {
			
			if (upDel.equals("up")) {
				emptyUpDelCnt = this.sellerService.updateEmptyList(sellerInfoDTO);
			} else {
				emptyUpDelCnt = this.sellerService.deleteEmptyList(sellerInfoDTO);
			}
		} catch (Exception e) {
			System.out.println(" emptyUpDelProc error ");
			System.out.println(e.getMessage());
		}

		return emptyUpDelCnt;
	}
}

