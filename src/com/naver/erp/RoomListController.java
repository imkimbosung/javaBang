package com.naver.erp;

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
public class RoomListController {
	
	@Autowired
	private BuyerService buyerService;
	@Autowired
	private RoomListService roomListService;
	
	/*--------------------------검색페이지이동메소드-------------------------------------*/
	@RequestMapping(value="/buyer/NewFile.do")
	public ModelAndView asd
	(
		RoomSerachDTO roomSerachDTO
		,HttpSession session
	) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/buyer/NewFile.jsp");
		try
		{
//			System.out.println("roomList호출");
			List<Map<String,String>> roomList=this.roomListService.getRoomserachList(roomSerachDTO);
			session.setAttribute("roomSerachDTO",roomSerachDTO);
			mav.addObject("roomSerachDTO",roomSerachDTO);
			mav.addObject("roomList",roomList);
		}
		catch(Exception e)
		{System.out.println("getRoomserachList에러발생"); System.out.println(e.getMessage());}
		return mav;
	}
	
	@RequestMapping(value="/buyer/roomListForm.do")
	public ModelAndView roomListForm
	(
		RoomSerachDTO roomSerachDTO
		,HttpSession session
	)
	{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/buyer/roomListForm.jsp");
		try {
			//System.out.println("mapSerach호출");
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
			
			/*검색*/
			try
			{
//				System.out.println("roomList호출");
				List<Map<String,String>> roomList=this.roomListService.getRoomserachList(roomSerachDTO);
				List<Map<String,String>> selltypeList=this.roomListService.getselltypeList();
				List<Map<String,String>> roomtypeList=this.roomListService.getroomtypeList();
				session.setAttribute("roomSerachDTO",roomSerachDTO);
				String uri="/javaBang/buyer/roomListForm.do";
				mav.addObject("roomtypeList",roomtypeList);
				session.setAttribute("buyer_uri",uri);
				mav.addObject("selltypeList",selltypeList);
				mav.addObject("roomSerachDTO",roomSerachDTO);
				mav.addObject("roomList",roomList);
			}
			catch(Exception e)
			{System.out.println("getRoomserachList에러발생"); System.out.println(e.getMessage());}
			
			/*판매자수얻기*/
			try
			{
//				System.out.println("sellerList호출");
				List<Map<String,String>> sellerList=this.roomListService.getsellerList(roomSerachDTO);
				mav.addObject("sellerList",sellerList);
			}
			catch(Exception e)
			{System.out.println("getsellerList에러발생"); System.out.println(e.getMessage());}
			
			/*검색된갯수*/
			
			
			/*찜한리스트정보얻기*/
			try 
			{
				int b_no=(int)session.getAttribute("b_no");
				//System.out.println("likeroomList호출"); 
				
				List<Map<String,String>> likeroomList=this.roomListService.getlikeroomList(b_no);
				mav.addObject("likeroomList",likeroomList); 
				mav.addObject("b_no",b_no); 
			}
			catch(Exception e){System.out.println("getlikeroomList에러발생"); System.out.println(e.getMessage());}
			 
		
		}
		catch(Exception e)
		{System.out.println("mapSerach에러발생"); System.out.println(e.getMessage());}
		return mav;
	};
	
	
	
	
	
	
	
	
	
	
	
	/*상세페이지 이동메소드*/
	@RequestMapping(value="/buyer/roomConForm.do")
	public ModelAndView roomConForm
	(
		RoomSerachDTO roomSerachDTO, BuyerRealtorScoreDTO buyerRealtorScoreDTO
		,@RequestParam(value="sr_no") int sr_no
		,HttpSession session
	)
	{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/buyer/roomConForm.jsp");
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
			
//			System.out.println("roomConForm호출");
			String b_id = (String)session.getAttribute("b_id");
			RoomListDTO roomContent=this.roomListService.getRoomContent(sr_no);
			RoomSerachDTO roomSerachDTO1=(RoomSerachDTO) session.getAttribute("roomSerachDTO");
			List<Map<String,String>> optionList=this.roomListService.getoptionList(sr_no);
			List<Map<String,String>> imageList=this.roomListService.getimageList(sr_no);
			List<Map<String,String>> rentalList=this.roomListService.getrentalList();
			List<Map<String,String>> roomoptionList=this.roomListService.getRoomOptionList();

			mav.addObject("roomoptionList",roomoptionList);
			
			String uri="/javaBang/buyer/roomConForm.do?sr_no="+sr_no;
			session.setAttribute("buyer_uri",uri);
			mav.addObject("roomContent",roomContent);
			mav.addObject("optionList",optionList);
			mav.addObject("rentalList",rentalList);
			mav.addObject("imageList",imageList);
			mav.addObject("roomSerachDTO",roomSerachDTO1);
		}
		catch(Exception e)
		{System.out.print("roomConForm1에러발생");System.out.print(e.getMessage());}
		try
		{	
			
//			System.out.println("roomConForm호출");
			int b_no=(int)session.getAttribute("b_no");
			
			buyerRealtorScoreDTO.setB_no(b_no);

			RoomListDTO roomContent=this.roomListService.getRoomContent(sr_no);
			buyerRealtorScoreDTO.setR_no(roomContent.getR_no());
			BuyerRealtorScoreDTO getBuyerRealtorScore = this.roomListService.getBuyerRealtorScore(buyerRealtorScoreDTO);
			String uri="/javaBang/buyer/roomConForm.do?sr_no="+sr_no;
			session.setAttribute("buyer_uri",uri);
			mav.addObject("getBuyerRealtorScore",getBuyerRealtorScore);
		}
		catch(Exception e)
		{System.out.print("roomConForm2에러발생");System.out.print(e.getMessage());}
		try
		{	
			RoomListDTO roomContent=this.roomListService.getRoomContent(sr_no);
			buyerRealtorScoreDTO.setR_no(roomContent.getR_no());
			BuyerRealtorScoreDTO getBuyerAvgScore = this.roomListService.getBuyerAvgScore(buyerRealtorScoreDTO);
			String uri="/javaBang/buyer/roomConForm.do?sr_no="+sr_no;
			mav.addObject("getBuyerAvgScore",getBuyerAvgScore);
		}
		catch(Exception e)
		{System.out.print("roomConForm3에러발생");System.out.print(e.getMessage());}
		try
		{	
			RentalProductDTO firstAir=this.roomListService.getFirstAir();
			mav.addObject("firstAir",firstAir);
			
			RentalProductDTO firstWater=this.roomListService.getFirstWater();
			mav.addObject("firstWater",firstWater);
			
			RentalProductDTO firstGas=this.roomListService.getFirstGas();
			mav.addObject("firstGas",firstGas);
			
			RentalProductDTO firstTv=this.roomListService.getFirstTv();
			mav.addObject("firstTv",firstTv);

			RentalProductDTO firstMicro=this.roomListService.getFirstMicro();
			mav.addObject("firstMicro",firstMicro);

			RentalProductDTO firstWasher=this.roomListService.getFirstWasher();
			mav.addObject("firstWasher",firstWasher);

			RentalProductDTO firstAircon=this.roomListService.getFirstAircon();
			mav.addObject("firstAircon",firstAircon);

			RentalProductDTO firstFrig=this.roomListService.getFirstFrig();
			mav.addObject("firstFrig",firstFrig);

			RentalProductDTO firstCucu=this.roomListService.getFirstCucu();
			mav.addObject("firstCucu",firstCucu);

			RentalProductDTO firstPrint=this.roomListService.getFirstPrint();
			mav.addObject("firstPrint",firstPrint);

			RentalProductDTO firstBed=this.roomListService.getFirstBed();
			mav.addObject("firstBed",firstBed);

			RentalProductDTO firstVide=this.roomListService.getFirstVide();
			mav.addObject("firstVide",firstVide);

			RentalProductDTO firstStyler=this.roomListService.getFirstStyler();
			mav.addObject("firstStyler",firstStyler);


		}
		catch(Exception e)
		{System.out.println(e.getMessage());}
		return mav;
	};
	/*구매자측 별점AJAX*/
	@RequestMapping
	(
		value="/buyer/roomConFormProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int buyerRealtorScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		int getBuyerRealtorScorecnt=0;
		try
		{
			//System.out.println("getBuyerAScnt호출");
			getBuyerRealtorScorecnt=this.roomListService.getBuyerReviewcnt(buyerRealtorScoreDTO);
		}
		catch(Exception e)
		{
			getBuyerRealtorScorecnt=-1;
		}
		return getBuyerRealtorScorecnt;
	}
	
	
	
	
	/*구매자측 별점 수정AJAX*/
	@RequestMapping
	(
		value="/buyer/reroomConFormProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
			
	@ResponseBody
	public int buyerRealtorReScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		int getBuyerRealtorReScorecnt=0;
		try
		{
			//System.out.println("getBuyerAScnt호출");
			getBuyerRealtorReScorecnt=this.roomListService.getBuyerReReviewcnt(buyerRealtorScoreDTO);
		}
		catch(Exception e)
		{

			getBuyerRealtorReScorecnt=-1;
		}
		return getBuyerRealtorReScorecnt;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*찜하기*/
	@RequestMapping(
		value="/buyer/buyer_likeProc.do"
		,method=RequestMethod.POST
		,produces="application/json;charset=UTF-8"
	)
		
	@ResponseBody
	public int insertlike(BuyerLikeRoomDTO buyerLikeRoomDTO)
	{
		int likecnt=0;
		try
		{
//			System.out.println("insertlike호출");
			likecnt=this.roomListService.insertlike(buyerLikeRoomDTO);
		}
		catch(Exception e)
		{
			System.out.print("insertlike에러발생");
			System.out.print(e.getMessage());
			likecnt=-1;
		}
		return likecnt;
	};
	
	/*찜취소*/
	@RequestMapping(
			value="/buyer/buyer_likeDelProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
		
	@ResponseBody
	public int deletelike(BuyerLikeRoomDTO buyerLikeRoomDTO)
	{
		int likedelcnt=0;
		try
		{
//			System.out.println("deletelike호출");
			likedelcnt=this.roomListService.deletelike(buyerLikeRoomDTO);
		}
		catch(Exception e)
		{
			System.out.print("deletelike에러발생");
			likedelcnt=-1;
		}
		return likedelcnt;
	}
		

}
