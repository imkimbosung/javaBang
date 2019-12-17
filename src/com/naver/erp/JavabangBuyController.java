package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JavabangBuyController {
	
	@Autowired
	private BuyerService buyerService;
	
	@RequestMapping( value="/buyer/homeForm.do" )
	public ModelAndView goHomeForm( @RequestParam(value="b_id" ,required=false) String b_id) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/homeForm.jsp");
		
		try {
			if(b_id == null) {
				BuyerDTO buyerDTO = this.buyerService.getBuyerDTO(2);;
				mav.addObject("buyerDTO", buyerDTO);
			}else {
				BuyerDTO buyerDTO = this.buyerService.getBuyerDTO(1);
				mav.addObject("buyerDTO", buyerDTO);
			}
						
			
		}catch(Exception e) {
			System.out.println("=============== goHomeForm <에러발생> ===============");
			System.out.println(e.getMessage());
		}
		
		return mav;
	}
	
	@RequestMapping( value="/buyer/test.do" )
	public ModelAndView gotestForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/test.jsp");
		return mav;
	}
	
	@RequestMapping( value="/buyer/roomListForm.do" )
	public ModelAndView goRoomListForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/buyer/roomListForm.jsp");
		return mav;
	}
}
