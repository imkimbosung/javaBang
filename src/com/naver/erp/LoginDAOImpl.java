package com.naver.erp;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


// @Repository를 붙여 DAO클래스 임을 지정하고, bean태그로 자동 등록됨

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	// @Autowired에 의해 SqlSessionTemplate라는 인터페이스를 구현한 클래스를 객체화해 저장
	// @Autowired는 인터페이스를 구현한 클래스를 찾아 객체화 하여 저장한다. 해당 인터페이스를 구현한 클래스만
	// 1개 존재 하기만 하면 된다.( 이름을 몰라도 상관없다. ) - 객체간의 결속력이 약하다.
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getBuyerCnt(Map<String, String> buyer_id_pwd) {
		
		// 1행 1열의 데이터를 가져오기 위해 SqlSessionTemplate 클래스의 selectOne 메소드를 사용.
		int adminCnt = this.sqlSession.selectOne(
				
				// 주의! com.naver.erp.LoginDAO 부분은 mapper_login.xml파일의 
				// mapper태그의 내부에 namespace 명과 일치해야함. 그리고 id값은 그 뒤에 온다.
				// ex : getAdminCnt 부분이 id부분이다.				
						"com.naver.erp.LoginDAO.getBuyerCnt"
				//위 sql 구문을 실행할 때 참여할 데이터가 저장된 HashMap 객체 지정
						,buyer_id_pwd
		);
		
		return adminCnt;			
	}
}
