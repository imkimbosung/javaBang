package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface BuyerDAO {
	
	BuyerDTO getBuyerIdDTO(String b_id);
	
	BuyerDTO getBuyerDTO(int b_no);

	List<Map<String, String>> getLikeRoomList(BuyerDTO buyerDTO);
	
	List<Map<String, String>> getRoomList();
	List<Map<String, String>> getRoomSecondList();
	List<Map<String, String>> getRoomThirdList();

	RoomDTO getRoomDTO(int sr_no);

	int updateBuyer(BuyerDTO buyerDTO);

	// 삭제할 게시판의 존재 개수를 리턴
	int getBuyerCnt(BuyerDTO buyerDTO);

	// 삭제할 게시판의 비밀번호 존재 개수 리턴
	int getPwdCnt(BuyerDTO buyerDTO);

	// 게시판 삭제 명령한 후 삭제 적용행의 개수 리턴
	int deleteBuyer(BuyerDTO buyerDTO);

	// ---------------------------------------------------------

	//------------------잊어버리셨나요?---------------------
	
	String buyerIdCnt(BuyerDTO buyerDTO);
	
	String buyerPwdGet(BuyerDTO buyerDTO);
	
	//---------------------------------------



	int deleteLikeRoom(BuyerDTO buyerDTO);
	
	
	

	List<Map<String, String>> getrentalList();
}
