package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BuyerService {
	
	// home에서 b_no를 가져오기 위해 b_id를 삽입
	BuyerDTO getBuyerIdDTO(String b_id);	

	BuyerDTO getBuyerDTO(int b_no);

	RoomDTO getRoomDTO(int sr_no);

	int updateBuyer(BuyerDTO buyerDTO);

	int deleteBuyer(BuyerDTO buyerDTO);
	
	List<Map<String, String>> getRoomList( );
	List<Map<String, String>> getRoomSecondList( );
	List<Map<String, String>> getRoomThirdList( );
	
	//------------------잊어버리셨나요?---------------------
	
	String buyerIdCnt(BuyerDTO buyerDTO);
	
	String buyerPwdGet(BuyerDTO buyerDTO);
	
	//---------------------------------------
	//---------------------------------------
	

	
	int deleteLikeRoom(BuyerDTO buyerDTO);

	List<Map<String, String>> getLikeRoomList(BuyerDTO buyerDTO);
	
	int buyerPwdCnt(BuyerDTO buyerDTO);

	List<Map<String, String>> getrentalList();
}
