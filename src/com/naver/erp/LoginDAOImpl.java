package com.naver.erp;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// @Repository를 붙여 DAO클래스 임을 지정하고, bean태그로 자동 등록됨

@Repository
public class LoginDAOImpl implements LoginDAO {

	// @Autowired에 의해 SqlSessionTemplate라는 인터페이스를 구현한 클래스를 객체화해 저장
	// @Autowired는 인터페이스를 구현한 클래스를 찾아 객체화 하여 저장한다. 해당 인터페이스를 구현한 클래스만
	// 1개 존재 하기만 하면 된다.( 이름을 몰라도 상관없다. ) - 객체간의 결속력이 약하다.

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getBuyerCnt(Map<String, String> buyer_id_pwd) {

		int b_noValue = this.sqlSession.selectOne(

				"com.naver.erp.LoginDAO.getBuyerCnt", buyer_id_pwd);

		return b_noValue;
	}

	public int getSellerCnt(Map<String, String> seller_id_pwd) {

		int s_noValue = this.sqlSession.selectOne(

				"com.naver.erp.LoginDAO.getSellerCnt", seller_id_pwd);

		return s_noValue;
	}
	
	public int getRealtorCnt(Map<String, String> realtor_id_pwd) {

		int r_noValue = this.sqlSession.selectOne(

				"com.naver.erp.LoginDAO.getRealtorCnt", realtor_id_pwd);

		return r_noValue;
	}
	
	
	
	
	// master 로그인
	public int getMasterCnt(Map<String, String> master_id_pwd) {
		// 1행 1열의 데이터를 가져오기 위해 SqlSessionTemplate 클래스의 selectOne 메소드를 사용.
		int m_noValue = this.sqlSession.selectOne(

				"com.naver.erp.LoginDAO.getMasterCnt"
				// 위 sql 구문을 실행할 때 참여할 데이터가 저장된 HashMap 객체 지정
				, master_id_pwd);

		return m_noValue;
	}

	public String getMasterAuth(Map<String, String> master_id_pwd) {

		// 1행 1열의 데이터를 가져오기 위해 SqlSessionTemplate 클래스의 selectOne 메소드를 사용.
		String m_auth = this.sqlSession.selectOne(

				"com.naver.erp.LoginDAO.getMasterAuth"
				// 위 sql 구문을 실행할 때 참여할 데이터가 저장된 HashMap 객체 지정
				, master_id_pwd);

		return m_auth;
	}

	public int getIdCnt(BuyerSignupDTO buyerSignupDTO) {
		int idCnt = this.sqlSession.selectOne(

				"com.naver.erp.LoginDAO.getIdCnt", buyerSignupDTO);

		return idCnt;
	}

	public int insertBuyerInfo(BuyerSignupDTO buyerSignupDTO) {
		int insertResult = this.sqlSession.insert("com.naver.erp.LoginDAO.insertBuyerInfo", buyerSignupDTO);

		return insertResult;
	}

	// ---------------
	// 판매자 회원가입
	// ---------------
	public int getSellerIdCnt(SellerSignupDTO sellerSignupDTO) {
		int idCnt = this.sqlSession.selectOne("com.naver.erp.LoginDAO.getSellerIdCnt", sellerSignupDTO);
		
		return idCnt;
	}
	
	public int insertSellerInfo(SellerSignupDTO sellerSignupDTO) {
		int insertResult = this.sqlSession.insert("com.naver.erp.LoginDAO.insertSellerInfo", sellerSignupDTO);
		
		return insertResult;
	}

	public int getSellerRouteCnt(SellerSignupDTO sellerSignupDTO) {
		int sellerRouteCnt = this.sqlSession.insert("com.naver.erp.LoginDAO.getSellerRouteCnt",sellerSignupDTO);

		return sellerRouteCnt;
	}


	//---------------------------------------------------------------------------------------------------- 가입경로 입력
		public int insertRoute(BuyerSignupDTO buyerSignupDTO) {
			int insertResult = this.sqlSession.insert(
					"com.naver.erp.LoginDAO.insertRoute"
					, buyerSignupDTO
			);
			return insertResult;
		}
}
