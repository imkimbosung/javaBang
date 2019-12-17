package com.naver.erp;

import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/*
 * 가상 URL주소로 접속해 호출되는 메소드를 소유한 [컨트롤러 클래스] 선언
 * @Controller 를 붙임으로써 [컨트롤러 클래스]임을 지정함.
 */

@Controller

@ControllerAdvice // 메소드 실행 이전에 즉, 해당 클라스 내부에서 발생하는 모든 에러를 잡아준다. ( 405, 400 에러등 )
				  // 에러 발생시 @ExceptionHandler의 메소드를 호출한다

public class LoginController {

	// ------------------------------------------------------
	// @Autowired에 의해 LoginService라는 인터페이스를 구현한 클래스를
	// 객체화하여 저장함, 구현된 클래스의 이름을 몰라도 돼!
	// interface를 구현한 클래스가 하나만 있으면 된다.
	// ------------------------------------------------------
	@Autowired
	private LoginService loginService;

	// ------------------------------------------------------
	// 가상주소 /z_spring/loginForm.do 로 접근하면 호출되는 메소드 선언
	// ------------------------------------------------------
	@RequestMapping(value = "/loginForm.do")
	public ModelAndView loginForm( ) {

		// ------------------------------------------------------
		// [ModelAndView 객체] 생성하기
		// [ModelAndView 객체]에 [호출할 JSP 페이지명]을 저장
		// [ModelAndView 객체] 리턴하기
		// ------------------------------------------------------
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
		return mav;
	}

	// ------------------------------------------------------
	// 가상주소 /z_spring/loginProc.do로 접근하면 호출되는 메소드 선언
	// 메소드 호출 후 ModelAndView객체를 리턴하지 않고
	// 아이디 암호의 존재개수를 리턴하도록 설정
	// ------------------------------------------------------
	@RequestMapping(value = "/loginProc.do" // 접속하는 URL 주소 설정
			, method = RequestMethod.POST // 접속하는 파일전송값 전송 방법 설정
			, produces = "application/json;charset=UTF-8" // 응답 데이터 종류 설정
	)
	@ResponseBody
	public int loginProc(@RequestParam(value = "b_id") String b_id, @RequestParam(value = "b_pwd") String b_pwd // 없으면 400 에러

	) {

		// ------------------------------------------------------
		// 매개변수에 저장된 파라미터값을 HashMap에 저장
		// 한번에 담아 보내기 위한 방법.
		// ------------------------------------------------------
		Map<String, String> map = new HashMap<String, String>();
		map.put("b_id", b_id);
		map.put("b_pwd", b_pwd);

		// ------------------------------------------------------
		// 로그인 아이디, 암호 존재 개수 저장변수 선언
		// ------------------------------------------------------
		int admin_idCnt = 0;
		
		try {
			// 서비스클래스 메소드를 호출해
			// admin테이블에 존재하는 로그인 아이디의 존재 개수 얻어오기
			admin_idCnt = this.loginService.getBuyerCnt(map);

		}catch(Exception e) {
			System.out.println("<접속실패> [접속 URL]-> /loginProc.do [호출 메소드] -> LoginController.loginProc(~)");
			System.out.println(e.getMessage());
			
			admin_idCnt = -1;
		}
		

//		LoginServiceImpl loginServiceImpl = new LoginServiceImpl();
//		admin_idCnt = loginServiceImpl.getAdminCnt( map);

		return admin_idCnt;
	}
	
	
	
//	
//	@RequestMapping(value = "/logout.do")
//	public ModelAndView logout( HttpSession session) {
//
//		
//		// HttpSession 객체에 저장된 로그인 아이디 삭제하기(없는것을 지워도 에러안남)
//		session.removeAttribute("admin_id");
//		session.removeAttribute("uri");
//		session.removeAttribute("boardSearchDTO");
//		
//		// ------------------------------------------------------
//		// [ModelAndView 객체] 생성하기
//		// [ModelAndView 객체]에 [호출할 JSP 페이지명]을 저장
//		// [ModelAndView 객체] 리턴하기
//		// ------------------------------------------------------
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("logout.jsp"); // servlet-context.xml 46번째 줄에 자동으로 앞에 경로가 붙게 되어있다.
//		
//		System.out.println("<접속성공> [접속 URI] -> logout.do");
//		
//		return mav;
//	}
//	
//	
//	// @@RequestMapping이 붙은 메소드 호출시 예외 발상하면 호출 되는 메소드
//	@ExceptionHandler(Exception.class)
//	public String handleException( HttpServletRequest request) {
//		return "logout.jsp";
//	}
//	
//	
	

}
