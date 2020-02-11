package com.naver.erp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptorCheckOnly extends HandlerInterceptorAdapter {	
	
	@Autowired
	private MasterService masterService;
	
	@Override
	public boolean preHandle(
		HttpServletRequest request 
		, HttpServletResponse response 
		, Object handler
	) throws Exception {

		HttpSession session = request.getSession();   

		//---------------------------------------------
		// master 정보 가져오기
		String m_id = (String) session.getAttribute("m_id"); // 관리자 id
		String m_auth = (String) session.getAttribute("m_auth"); // 관리자별 권한
		String checkCode = this.masterService.getCheckCode();

		//---------------------------------------------
		
		// 접속 URI 구하기
		String uri = request.getRequestURI();		
		
		//-------------------------------------
		// 컨택스트 류트명 구하기
		//-------------------------------------
		String ctRoot  = request.getContextPath();
		

		
		//-------------------------------------
		// 방문자수 확인
		//-------------------------------------
		int todayCount = 0;
		int totalCount = 0;
		
		String visitCounted = (String) session.getAttribute("visitCounted");
		
		if(visitCounted == null) {
						
			try {

				masterService.setVisitTotalCount();
				
				todayCount = masterService.getVisitTodayCount();
		 
				totalCount = masterService.getVisitTotalCount();
				
				session.setAttribute("visitCounted", "True");
				 

			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("error msg => " + e.getMessage());
			}
			
	        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
	        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
		}
		
		
		
		
		
		
		//-------------------------------------
		// 관리자가 로그인 중이지 않을 경우
		//-------------------------------------
		if(m_id == null) {
			
			//-------------------------------------
			// 점검 중
			//-------------------------------------
			if(  checkCode.equals("Y") )  {
	
				
				response.sendRedirect( ctRoot+"/checking.do" );/**/
				session.setAttribute("uri",uri);
//				System.out.println("<접속성공> [접속 URI] -> " + uri  + "  현재 서비스 점검중");
				return false;
			} 
			//-------------------------------------
			// 점검 중이지 않을 때 
			//-------------------------------------
			else { 
//				session.removeAttribute("checkCode");
//				System.out.println("<접속성공> [접속 URI] -> " + uri + " 서비스 점검 중이 아님 " );
				return true;
			}
			
		// 관리자가 로그인 한 경우
		}else {
//			System.out.println("관리자 로그인함");
			return true;
		}
		

	}

	
}

















	
	