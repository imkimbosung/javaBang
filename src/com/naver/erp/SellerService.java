package com.naver.erp;
import java.util.*;

public interface SellerService {

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// "wonhyeok's coding"
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int insertSellRoom(SellerRoomDTO sellerRoomDTO);

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// soyoung's coding
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	int insertCheck(SellerRoomDTO sellerRoomDTO);

	int getEmptyRoomAllCnt(SellerRoomSearchDTO sellerRoomSearchDTO); 

	List<Map<String, String>> getEmptyRoomList(SellerRoomSearchDTO sellerRoomSearchDTO); 

	SellerInfoDTO getSellerInfoDTO(int sr_no); 

	int updateEmptyList(SellerInfoDTO sellerInfoDTO);

	int deleteEmptyList(SellerInfoDTO sellerInfoDTO);
	
	//로그인 후 홈화면에 아이디가 뜨는것을 이름을 뜨도록 변경.
	String getS_name(SellerDTO sellerDTO);
	
	int getS_no(String s_id);
	
	// kbs
	int insertImageName(SellerRoomDTO sellerRoomDTO);
	
	
	// final contract confirm
	int updateConfirmCode(SellerInfoDTO sellerInfoDTO);
	
	
	List<Map<String, String>> getSellTypeCode();// sell type from DataBase
	
	List<Map<String, String>> getOptionTypeCode();
	
	List<Map<String, String>> getRoomTypeCode();//get room type from DataBase
	
	String getS_name(SellerRoomSearchDTO sellerRoomSearchDTO);

	List<Map<String, String>> getRoomTypeCode(int sr_no);// room type from DataBase
	
	List<Map<String, String>> getOptionTypeCode(int sr_no);// option type from DataBase
	
	List<Map<String, String>> getOptionSelectCode(int sr_no);// option select from DataBase
	
	List<Map<String, String>> getOptionSelectCode();
	
	List<Map<String, String>> getPetAvailableCode();
	
	List<Map<String, String>> getElvCode();
	
	List<Map<String, String>> getHcTypeCode();
	
	List<Map<String, String>> getLiveInTypeCode();
	
	List<Map<String, String>> getManageFeeCode();
	
	List<Map<String, String>> getParkingAvailableCode();
	
	
	List<Map<String, String>> getAverageSalePrice(SellerRoomDTO sellerRoomDTO);
	
	List<Map<String, String>> getAverageJeonsePrice(SellerRoomDTO sellerRoomDTO);	
	
	List<Map<String, String>> getAverageOneRoomPrice(SellerRoomDTO sellerRoomDTO);

	
	String getSellerId (SellerSignupDTO sellerSignupDTO);
	
	String getSellerPwdCnt(SellerSignupDTO sellerSignupDTO);
	
	SellerDTO getSellerDTO(String s_id);
	
	int getSellerPwdCheck(SellerDTO sellerDTO);
	
	int updateSeller(SellerDTO sellerDTO);
	
	int deleteSeller(SellerDTO sellerDTO);

	
	
	List<Map<String, String>> topRealtorList( );
	
	

}
