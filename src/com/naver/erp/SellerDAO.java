package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface SellerDAO {

	int insertSellRoom(SellerRoomDTO sellerRoomDTO);

	// TYPE_SELL_ROOM �뜲�씠�꽣 ���옣.
	int insertTypeSellRoom(SellerRoomDTO sellerRoomDTO);

	// select
	int seletSr_no(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_PET_AVAILABILITY �뜲�씠�꽣 ���옣.
	int insertSellRoomPetAvail(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_PARKING_AVAILABILITY �뜲�씠�꽣 ���옣.
	int insertSellRoomParkAvail(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_HC_TYPE �뜲�씠�꽣 ���옣.
	int insertSellRoomHCTypeAvail(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_MANAGE_FEE �뜲�씠�꽣 ���옣.
	int insertSellRoomManageFeeYN(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_ELV �뜲�씠�꽣 ���옣.
	int insertSellRoomElvYN(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_LIVE_IN_TYPE �뜲�씠�꽣 ���옣.
	int insertSellRoomLiveInType(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_OPTION_TYPE �뜲�씠�꽣 ���옣.
	int insertSellRoomOptionType(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_SELL_TYPE �뜲�씠�꽣 ���옣.
	int insertSellRoomSellType(SellerRoomDTO sellerRoomDTO);

	// SELL_ROOM_OPTION_SELECT �뜲�씠�꽣 ���옣.

	int insertSellRoomOptionSelect(SellerRoomDTO sellerRoomDTO);

	// ==================================================================================
	// SELL_ROOM_ADDR 데이터 저장하기 위한 속성변수 추가
	int insertSellRoomAddr(SellerRoomDTO sellerRoomDTO);

	/*
	 * int insertSellRoomDetailAddr(SellerRoomDTO sellerRoomDTO);
	 * 
	 * int insertSellRoomFloor(SellerRoomDTO sellerRoomDTO);
	 * 
	 * int insertSellRoomZipCode(SellerRoomDTO sellerRoomDTO);
	 */

	// ==================================================================================

	// ==================================================================================
	// ONE_ROOM_PRICE, JEONSE_PRICE, SALE_PRICE 데이터 저장을 위한 속성변수 선언
	int insertSalePrice(SellerRoomDTO sellerRoomDTO);

	int insertJeonsePrice(SellerRoomDTO sellerRoomDTO);

	int insertOneRoomPrice(SellerRoomDTO sellerRoomDTO);
	// ==================================================================================

	// address part
	// soyoung's coding
	int insertCheck(SellerRoomDTO sellerRoomDTO);

	int getEmptyRoomAllCnt(SellerRoomSearchDTO sellerRoomSearchDTO); // ��ϵ� ������ ����

	List<Map<String, String>> getEmptyRoomList(SellerRoomSearchDTO sellerRoomSearchDTO); // ��ϵ� ������ ���

	SellerInfoDTO getSellerInfoDTO(int sr_no);

	int getEmptyListCnt(SellerInfoDTO sellerInfoDTO);

	int getPwdCnt(SellerInfoDTO sellerInfoDTO);

	int updateList(SellerInfoDTO sellerInfoDTO);

	int deleteList(SellerInfoDTO sellerInfoDTO);
	
	//로그인 후 홈화면에 아이디가 뜨는것을 이름을 뜨도록 변경.
	String getS_name(SellerDTO sellerDTO);
	
	int getS_no(String s_id);
	
	// kbs
	int insertImageName(SellerRoomDTO sellerRoomDTO);
	
	

	int updateConfirmCode(SellerInfoDTO sellerInfoDTO);

	int getEmptyUpdateListCnt(SellerInfoDTO sellerInfoDTO);
	//--------------------------------------------------------------------------------------------------------------200127 수정 soyeon	
	List<Map<String, String>> getRoomTypeCode();
	//--------------------------------------------------------------------------------------------------------------200127 수정 soyeon
	
	List<Map<String, String>> getSellTypeCode();
	
	List<Map<String, String>> getOptionTypeCode();
	
	List<Map<String, String>> getOptionSelectCode(); 
	
	List<Map<String, String>> getPetAvailableCode();
	
	List<Map<String, String>> getElvCode();
	
	List<Map<String, String>> getHcTypeCode();
	
	List<Map<String, String>> getLiveInTypeCode();
	
	List<Map<String, String>> getManageFeeCode();
	
	List<Map<String, String>> getParkingAvailableCode();
	
	String getS_name(SellerRoomSearchDTO sellerRoomSearchDTO);


	List<Map<String, String>> getRoomTypeCode(int sr_no);
	
	List<Map<String, String>> getOptionTypeCode(int sr_no);
	
	List<Map<String, String>> getOptionSelectCode(int sr_no);
	
	//--------------------------------------------------------------------------------------------------------------
	
	String getSellerId(SellerSignupDTO sellerSignupDTO);
	
	String getSellerPwdCnt(SellerSignupDTO sellerSignupDTO);
	
	SellerDTO getSellerDTO(String s_id);
	
	int getSellerPwdCheck(SellerDTO sellerDTO);
	
	int updateSeller(SellerDTO sellerDTO);
	
	int getSellerCnt(SellerDTO sellerDTO);
	
	int deleteSeller(SellerDTO sellerDTO);
	
	
	//---------------추가--------------------
	List<Map<String, String>> topRealtorList();
	
	
List<Map<String, String>> getAverageSalePrice(SellerRoomDTO sellerRoomDTO);		
	
	List<Map<String, String>> getAverageJeonsePrice(SellerRoomDTO sellerRoomDTO);		
	
	List<Map<String, String>> getAverageOneRoomPrice(SellerRoomDTO sellerRoomDTO);
	

}
