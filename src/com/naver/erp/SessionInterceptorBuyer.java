package com.naver.erp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptorBuyer extends HandlerInterceptorAdapter {
	// *************************************************
	// URL 접속 시 [컨트롤러 클래스의 메소드] 호출 전에 실행될 preHandle(~) 메소드 선언
	// 메소드가 false 를 리턴하면 메소드 호출 후 컨트롤러의 메소드를 호출하지 않고, 반대면 호출한다.
	// *************************************************
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		System.out.println("-----------------------------------");
//		System.out.println("Interceptor : preHandle(~) 메소드 호출 시작!");
		// -------------------------------------
		// Session 객체 얻기
		// -------------------------------------
		HttpSession session = request.getSession();
		// -------------------------------------
		// Session 객체에서 키값이 admin_id 로 저장된 데이터 꺼내기.
		// 즉 로그인 정보 꺼내기
		// -------------------------------------
		String b_id = (String) session.getAttribute("b_id");

		// ---------------------------------------------
		// master 정보 가져오기
		String m_id = (String) session.getAttribute("m_id"); // 관리자 id
		String m_auth = (String) session.getAttribute("m_auth"); // 관리자별 권한

		// ---------------------------------------------

		// 접속 URI 구하기
		String uri = request.getRequestURI();
		String param=request.getQueryString();
		if(param!=null) {
			session.setAttribute("buyer_uri",uri+"?"+param);}
		else {
		session.setAttribute("buyer_uri",uri);
		}

		// -------------------------------------
		// 컨택스트 류트명 구하기
		// -------------------------------------
		String ctRoot = request.getContextPath();
		
		if(m_id == null) {
			if (b_id == null) {
				// HttpServletResponse 객체의 sendRedirect 메솓 호출로 로그인 화면으로 이동.

				response.sendRedirect(ctRoot + "/logout.do");/**/
//				System.out.println("<접속성공> [접속 URI] -> " + uri + " 접근 불가로 로그인 화면으로 이동");
				return false;
			}
			// -------------------------------------
			// b_id 가 null이 아니면(아이디가 있으면)
			// -------------------------------------
			else {
//				System.out.println("<접속성공> [접속 URI] -> " + uri + " admin_id가 존재합니다.");
				return true;
			}
		}else {
//			System.out.println("관리자 로그인함");
			return true;
		}

		
	}
}
