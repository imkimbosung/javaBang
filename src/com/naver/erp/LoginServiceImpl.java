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
public class LoginServiceImpl implements LoginService{
	
	
	// @Autowired에 의해 LoginDAO라는 인터페이스를 구현한 클래스를 객체화해 저장
	// @Autowired는 인터페이스를 구현한 클래스를 찾아 객체화 하여 저장한다. 해당 인터페이스를 구현한 클래스만
	// 1개 존재 하기만 하면 된다.( 이름을 몰라도 상관없다. ) - 객체간의 결속력이 약하다.
	@Autowired
	private LoginDAO loginDAO;
	
	
	// 로그인 정보의 개수 리턴 메소드
	public int getBuyerCnt(Map<String, String> buyer_id_pwd) {
		
		// LoginDAOImpl 객체의 getAdminCnt 메소드를 호출해 아이디, 암호 존재개수 얻기
		int buyerCnt = this.loginDAO.getBuyerCnt(buyer_id_pwd);
		return buyerCnt;
	}
}
