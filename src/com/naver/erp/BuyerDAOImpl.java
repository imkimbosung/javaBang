package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyerDAOImpl implements BuyerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	//------------------잊어버리셨나요?---------------------
	
	public String buyerIdCnt(BuyerDTO buyerDTO) {
		String buyerIdCnt = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.buyerIdCnt", buyerDTO);
		return buyerIdCnt;
	}
	
	public String buyerPwdGet(BuyerDTO buyerDTO) {
		String buyerPwdGet = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.buyerPwdGet", buyerDTO);
		return buyerPwdGet;
	}
	
	//---------------------------------------
	//----------------------------------------------------------------------------------------------------	
	
	
	
	public List<Map<String, String>> getRoomList( ) {
		List<Map<String, String>> roomList = this.sqlSession.selectList("com.naver.erp.BuyerDAO.getRoomList");
		return roomList;
	}
	
	public List<Map<String, String>> getRoomSecondList( ) {
		List<Map<String, String>> roomList = this.sqlSession.selectList("com.naver.erp.BuyerDAO.getRoomSecondList");
		return roomList;
	}
	
	public List<Map<String, String>> getRoomThirdList( ) {
		List<Map<String, String>> roomList = this.sqlSession.selectList("com.naver.erp.BuyerDAO.getRoomThirdList");
		return roomList;
	}
	
	//----------------------------------------------------------------------------------------------------
	public BuyerDTO getBuyerIdDTO(String b_id) {
		BuyerDTO buyerDTO = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.getBuyerIdDTO", b_id);
		return buyerDTO;
	}
	

	//----------------------------------------------------------------------------------------------------
	public BuyerDTO getBuyerDTO(int b_no) {
		BuyerDTO buyerDTO = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.getBuyerDTO", b_no);
		return buyerDTO;
	}

	
	
	//----------------------------------------------------------------------------------------------------
	public List<Map<String, String>> getLikeRoomList(BuyerDTO buyerDTO) {
		List<Map<String, String>> boardList = this.sqlSession.selectList("com.naver.erp.BuyerDAO.getLikeRoomList", buyerDTO);
		return boardList;
	}

	
	
	//----------------------------------------------------------------------------------------------------
	public RoomDTO getRoomDTO(int sr_no) {
		RoomDTO roomDTO = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.getRoomDTO", sr_no);
		return roomDTO;
	}

	
	
	//----------------------------------------------------------------------------------------------------
	public int updateBuyer(BuyerDTO buyerDTO) {
		int updateCnt = this.sqlSession.update("com.naver.erp.BuyerDAO.updateBuyer", buyerDTO);
		return updateCnt;
	}


	
	//----------------------------------------------------------------------------------------------------
	public int getBuyerCnt(BuyerDTO buyerDTO) {
		int buyerCnt = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.getBuyerCnt", buyerDTO);
		return buyerCnt;
	}



	//----------------------------------------------------------------------------------------------------
	public int getPwdCnt(BuyerDTO buyerDTO) {
		int pwdCnt = this.sqlSession.selectOne("com.naver.erp.BuyerDAO.getPwdCnt", buyerDTO);
		return pwdCnt;
	}


	
	//----------------------------------------------------------------------------------------------------
	public int deleteBuyer(BuyerDTO buyerDTO) {
		int deleteBuyerCnt = this.sqlSession.delete("com.naver.erp.BuyerDAO.deleteBuyer", buyerDTO);
		return deleteBuyerCnt;
	}




	
	//----------------------------------------------------------------------------------------------------
	public int deleteLikeRoom(BuyerDTO buyerDTO) {
		int deleteLikeRoomCnt = this.sqlSession.delete("com.naver.erp.BuyerDAO.deleteLikeRoom", buyerDTO);
		return deleteLikeRoomCnt;
	}

	
	

	
	public List<Map<String, String>> getrentalList() {
		List<Map<String, String>> getrentalList = this.sqlSession.selectList("com.naver.erp.BuyerDAO.getrentalList");
		return getrentalList;
	}
}






