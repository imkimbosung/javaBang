package com.naver.erp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptorMaster extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		// ---------------------------------------------
		// master 정보 가져오기
		String m_id = (String) session.getAttribute("m_id"); // 관리자 id
		String m_auth = (String) session.getAttribute("m_auth"); // 관리자별 권한

		// ---------------------------------------------

		// 접속 URI 구하기
		String uri = request.getRequestURI();
		
		// -------------------------------------
		// 컨택스트 류트명 구하기
		// -------------------------------------
		String ctRoot = request.getContextPath();
		
		if(m_id == null) {
		
				// HttpServletResponse 객체의 sendRedirect 메솓 호출로 로그인 화면으로 이동.

				response.sendRedirect(ctRoot + "/master/logout.do");/**/
//				System.out.println("<접속성공> [접속 URI] -> " + uri + " 접근 불가로 로그인 화면으로 이동");
				return false;

		}else {

//			System.out.println("<접속성공> [접속 URI] -> " + uri + " 로그인 하였습니다.");
			return true;
		}

		
	}
}
