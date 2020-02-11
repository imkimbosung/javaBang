package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BuyerServiceImpl implements BuyerService {

	@Autowired
	private BuyerDAO buyerDAO;
	
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	public List<Map<String, String>> getRoomList( ) {
		List<Map<String, String>> roomList = this.buyerDAO.getRoomList();
		return roomList;
	}
	
	public List<Map<String, String>> getRoomSecondList( ) {
		List<Map<String, String>> roomList = this.buyerDAO.getRoomSecondList();
		return roomList;
	}
	
	public List<Map<String, String>> getRoomThirdList( ) {
		List<Map<String, String>> roomList = this.buyerDAO.getRoomThirdList();
		return roomList;
	}
	
	//------------------잊어버리셨나요?---------------------
	
	public String buyerIdCnt(BuyerDTO buyerDTO) {
		String buyerIdCnt = this.buyerDAO.buyerIdCnt(buyerDTO);
		return buyerIdCnt;
	}
	
	public String buyerPwdGet(BuyerDTO buyerDTO) {
		String buyerPwdGet = this.buyerDAO.buyerPwdGet(buyerDTO);
		return buyerPwdGet;
	}
	
	//---------------------------------------
	
	//----------------------------------------------------------------------------------------------------
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	public BuyerDTO getBuyerIdDTO(String b_id){
		BuyerDTO buyerDTO = buyerDAO.getBuyerIdDTO(b_id);
		return buyerDTO;
	}
	
	
	//----------------------------------------------------------------------------------------------------
	public BuyerDTO getBuyerDTO(int b_no) {
		BuyerDTO buyerDTO = buyerDAO.getBuyerDTO(b_no);
		return buyerDTO;
	}
	
	
	//----------------------------------------------------------------------------------------------------
	public RoomDTO getRoomDTO(int sr_no) {
		RoomDTO roomDTO = this.buyerDAO.getRoomDTO(sr_no);
		return roomDTO;
	}

	
	//----------------------------------------------------------------------------------------------------
	public int updateBuyer(BuyerDTO buyerDTO) {
		int updateCnt = this.buyerDAO.updateBuyer(buyerDTO);
		return updateCnt;
	}
	
	
	//----------------------------------------------------------------------------------------------------
	public int deleteBuyer(BuyerDTO buyerDTO) {

		int buyerCnt = this.buyerDAO.getBuyerCnt(buyerDTO);
		if (buyerCnt == 0) {
			return -1;
		}

		int pwdCnt = this.buyerDAO.getPwdCnt(buyerDTO);
		if (pwdCnt == 0) {
			return -2;
		}

		int deleteCnt = this.buyerDAO.deleteBuyer(buyerDTO);
		return deleteCnt;
	}
	
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	public int buyerPwdCnt(BuyerDTO buyerDTO) {
		int pwdCnt = this.buyerDAO.getPwdCnt(buyerDTO);
		if (pwdCnt == 0) {
			System.out.println(pwdCnt);
			return -2;
		}
		return pwdCnt;

	}
	

	
	


	
	
	//----------------------------------------------------------------------------------------------------
	public int deleteLikeRoom(BuyerDTO buyerDTO) {
		int deleteLikeRoomCnt = this.buyerDAO.deleteLikeRoom(buyerDTO);
		return deleteLikeRoomCnt;
	}

	
	
	//----------------------------------------------------------------------------------------------------
	public List<Map<String, String>> getLikeRoomList(BuyerDTO buyerDTO) {
		List<Map<String, String>> likeRoomList = this.buyerDAO.getLikeRoomList(buyerDTO);
		return likeRoomList;
	}

	

	
	
	public List<Map<String, String>> getrentalList() {
		List<Map<String, String>> getrentalList = this.buyerDAO.getrentalList();
		return getrentalList;
	}
	
}





