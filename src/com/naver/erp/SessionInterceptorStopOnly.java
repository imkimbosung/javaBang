package com.naver.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptorStopOnly extends HandlerInterceptorAdapter {
	
	@Autowired
	private MasterService masterService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();


		// ---------------------------------------------
		// master 정보 가져오기
		String m_id = (String) session.getAttribute("m_id"); // 관리자 id
		String m_auth = (String) session.getAttribute("m_auth"); // 관리자별 권한
		List<Map<String,String>> stopValueList = this.masterService.getStopValue();
		// ---------------------------------------------

		// 접속한 URI 구하기
		String checkUri = request.getRequestURI();		
		String ctRoot = request.getContextPath();
//		System.out.println("uri =>> " +  checkUri.substring(9).indexOf("/buyer/") + "   ctRoot >> " + ctRoot);

		// -------------------------------------
		// stop 명령을 내린 서비스 구분.
		// -------------------------------------
		
		String stopBuyer = stopValueList.get(0).get("buyer");
		String stopSeller = stopValueList.get(0).get("seller");
		String stopRental = stopValueList.get(0).get("rental");
		String stopRealtor = stopValueList.get(0).get("realtor");
		
		
		if(m_id == null) {
//			System.out.println(stopBuyer + " " +  stopSeller + " " +stopRental + " " + stopRealtor );
			if(stopBuyer.equals("true") && checkUri.substring(9).indexOf("/buyer/") != -1) {
				response.sendRedirect(ctRoot + "/master/emergencyStopPage.do");

				return false;
			}
			if(stopSeller.equals("true")&& checkUri.substring(9).indexOf("/seller/") != -1) {
				response.sendRedirect(ctRoot + "/master/emergencyStopPage.do");

				return false;
			}
			if(stopRental.equals("true") && checkUri.substring(9).indexOf("/rental/") != -1) {
				response.sendRedirect(ctRoot + "/master/emergencyStopPage.do");

				return false;
			}
			if(stopRealtor.equals("true") && checkUri.substring(9).indexOf("/realtor/") != -1) {
				response.sendRedirect(ctRoot + "/master/emergencyStopPage.do");

				return false;
			}

			
			
			return true;
			
			
		}else {
//			System.out.println("관리자 로그인함");
			return true;
		}

		
	}
}
