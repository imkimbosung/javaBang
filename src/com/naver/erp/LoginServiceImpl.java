package com.naver.erp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

// 서비스 클래스인 LoginServiceImpl 클래스 선언

//	서비스 클래스에는 @Service 와 @Transactional을 붙인다.
//  @Service   => 서비스 클래스임을 지정하고 bean 태그로 자동 등록된다.
//  @Transactional  => 서비스 클래스의 메소드 내부에서 일어나는 모든 작업에는 트랜잭션이 걸린다.
//                     select는 transactional 을 걸 필요가 없다.(걸어도 에러는 안난다.)
@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	// @Autowired에 의해 LoginDAO라는 인터페이스를 구현한 클래스를 객체화해 저장
	// @Autowired는 인터페이스를 구현한 클래스를 찾아 객체화 하여 저장한다. 해당 인터페이스를 구현한 클래스만
	// 1개 존재 하기만 하면 된다.( 이름을 몰라도 상관없다. ) - 객체간의 결속력이 약하다.
	@Autowired
	private LoginDAO loginDAO;

	// 로그인 정보의 개수 리턴 메소드
	public int getBuyerCnt(Map<String, String> buyer_id_pwd) {

		int buyerCnt = this.loginDAO.getBuyerCnt(buyer_id_pwd);
		return buyerCnt;
	}

	public int getSellerCnt(Map<String, String> seller_id_pwd) {

		int sellerCnt = this.loginDAO.getSellerCnt(seller_id_pwd);
		return sellerCnt;
	}
	
	public int getRealtorCnt(Map<String, String> realtor_id_pwd) {
		int realtorCnt = this.loginDAO.getRealtorCnt(realtor_id_pwd);
		return realtorCnt;
		
	}

	// Master 로그인 정보의 개수 리턴 메소드
	public int getMasterCnt(Map<String, String> master_id_pwd) {

		int masterCnt = this.loginDAO.getMasterCnt(master_id_pwd);
		return masterCnt;
	}

	public String getMasterAuth(Map<String, String> master_id_pwd) {
		String masterAuth = this.loginDAO.getMasterAuth(master_id_pwd);

		return masterAuth;
	}

	public int insertBuyerInfo(BuyerSignupDTO buyerSignupDTO) {
		// 아이디 중복 검사
		int idCnt = this.loginDAO.getIdCnt(buyerSignupDTO);
		if (idCnt != 0) {
			return -1;
		}

		int buyerCnt = this.loginDAO.insertBuyerInfo(buyerSignupDTO);
		
		//-------구매자 가입 경로 입력
		int routeRegCnt = this.loginDAO.insertRoute(buyerSignupDTO);
		if (routeRegCnt == 0) {
			return -5;
		}
		
		return buyerCnt;
	}

	public int insertSellerInfo(SellerSignupDTO sellerSignupDTO) {
		// 아이디 중복 검사
		int idCnt = this.loginDAO.getSellerIdCnt(sellerSignupDTO);
		if (idCnt != 0) {
			return -1;
		}
		
		int sellerCnt = this.loginDAO.insertSellerInfo(sellerSignupDTO);

		int sellerRouteCnt = this.loginDAO.getSellerRouteCnt(sellerSignupDTO);
		if(sellerRouteCnt==0) {
			return -3;
		}

		return sellerCnt;

	}


}
