package com.naver.erp;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyerDAOImpl implements BuyerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public BuyerDTO getBuyerDTO(int b_no) {
		BuyerDTO buyerDTO = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.getBuyerDTO", b_no);
		return buyerDTO;
	}

}
