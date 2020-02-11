package com.naver.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface RoomListDAO {

	RoomListDTO getRoomContent(int sr_no);

	List<Map<String, String>> getRoomserachList(RoomSerachDTO roomSerachDTO);

	List<Map<String, String>> getsellerList(RoomSerachDTO roomSerachDTO);

	int selectlike(BuyerLikeRoomDTO buyerLikeRoomDTO);
	int insertlike(BuyerLikeRoomDTO buyerLikeRoomDTO);

	List<Map<String, String>> getlikeroomList(int b_no);

	int deletelike(BuyerLikeRoomDTO buyerLikeRoomDTO);

	List<Map<String, String>> getoptionList(int sr_no);

	List<Map<String, String>> getimageList(int sr_no);

	List<Map<String,String>> getrentalList();
	
	List<Map<String,String>> getselltypeList();
	List<Map<String,String>> getroomtypeList();
	
	//------------------추가
	
	int getBuyerReviewcnt(BuyerRealtorScoreDTO buyerRealtorScoreDTO);
	int getBuyerReReviewcnt(BuyerRealtorScoreDTO buyerRealtorScoreDTO);
	BuyerRealtorScoreDTO getBuyerRealtorScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO);
	BuyerRealtorScoreDTO getBuyerAvgScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO);
RentalProductDTO getFirstAir();
	
	RentalProductDTO getFirstWater();
	
	RentalProductDTO getFirstGas();
	
	RentalProductDTO getFirstTv();

	RentalProductDTO getFirstMicro();

	RentalProductDTO getFirstWasher();

	RentalProductDTO getFirstAircon();

	RentalProductDTO getFirstFrig();

	RentalProductDTO getFirstCucu();

	RentalProductDTO getFirstPrint();

	RentalProductDTO getFirstBed();

	RentalProductDTO getFirstVide();

	RentalProductDTO getFirstStyler();
	
	List<Map<String,String>> getRoomOptionList();

}
