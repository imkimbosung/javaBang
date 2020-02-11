package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface MasterDAO {

	MasterHomeDTO getHomeData();
	
	 List<Map<String, String>> getHomeGraphData(int yearVal);

		
	// ----------------------------------------------------------
	// 데이터 조회 -> 고객 현황
	// ----------------------------------------------------------
	int getBuyerListAllCnt();
	
	int getSellerListAllCnt();
	
	int getRentalListAllCnt();
	
	//MasterBuyerListDTO masterBuyerListDTO
	List<Map<String, String>> getBoardListBuyer();
	
	List<Map<String, String>> getBoardListSeller();
	
	List<Map<String, String>> getBoardListRealtor();
	
	List<Map<String, String>> getBoardListRental();
	
	 List<Map<String, String>> getGender();
	 
	 List<Map<String, String>> getAge();
	
	// 고객 정지 기능
	int insertStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO);
	
	int updateStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO);
	
	int deleteStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO);
	
	List<Map<String, String>> getStopCustomer(String tableName);

	
	// ----------------------------------------------------------
	// 목록 수정 -> 판매자 code 데이터 가져오기
	// ----------------------------------------------------------
	
	List<Map<String, String>> getRoomTypeCode();

	List<Map<String, String>> getELVCode();

	List<Map<String, String>> getHcTypeCode();
	
	List<Map<String, String>> getOptionSelectCode();
	
	List<Map<String, String>> getPetCode();
	
	List<Map<String, String>> getParkingCode();
	
	List<Map<String, String>> getOptionTypeCode();
	
	List<Map<String, String>> getFeeCode();
	
	List<Map<String, String>> getLiveInCode();
	
	List<Map<String, String>> getSellCode();

	// ----------------------------------------------------------
	// 목록 수정 -> 공인중개사 code 데이터 가져오기
	// ----------------------------------------------------------
	List<Map<String, String>> getAuthCode();

	List<Map<String, String>> getSignupRouteCode();

	List<Map<String, String>> getDataCheckCode();
	
	// ----------------------------------------------------------
	// 목록 수정 -> 물품렌트 code 데이터 가져오기
	// ----------------------------------------------------------
	List<Map<String, String>> getRentalCode();

	List<Map<String, String>> getRentalProductCode();
	
	// ----------------------------------------------------------
	// 목록 수정 -> 모든 코드들의 입력, 수정, 삭제
	// ----------------------------------------------------------
	int getDeleteNum(Map<String, String> map);

	int delAllCode(Map<String, String> map);

	int updateRoomTypeCode(Map<String, String> map);

	int upAllCode(Map<String, String> updateCode);

	int inAllCode(Map<String, String> insertCode);

	int getCheckNum(Map<String, String> insertCode);
	
	// ----------------------------------------------------------
	// 서버 점검시 유저 접근 차단
	// ----------------------------------------------------------
	String getCheckCode();
	List<Map<String,String>> getCheckInfo();
	
	
	
	int updateCheckCode(MasterCheckcodeDTO masterCheckcodeDTO);
	
	List<Map<String, String>> getYearValCnt(int yearVal);
	
//	MasterBuyerListDTO getBuyerChartData();
	
	// ----------------------------------------------------------
	// 매물 현황 데이터 가져오기
	// ----------------------------------------------------------	
		
	List<Map<String, String>> getRoomGraphData();
	
	List<Map<String, String>> getCustoemrGraphData();
	
	List<Map<String, String>> getProductLabels();
	
	
	
	
	
	
	
	 int setVisitTotalCount() ;
	
	 int getVisitTodayCount();
	
	int getVisitTotalCount();
	
	
	
	
	 List<Map<String, String>> getProductMonthCnt(MasterRentCntDTO masterRentCntDTO);
	 
	 List<Map<String, String>> getProductRankingCnt();

	 
	int getCompanyRankingAllCnt();

	List<Map<String, String>> getCompanyRankingCnt();
	 
	 // 공인중개사 정보 가져오기
	 List<Map<String,String>> getRealtorInfo();
	 
	 List<Map<String, String>> getSignUpRoot();
	 


	int getRealtorListAllCnt();
	
	
	
	// ----------------------------------------------------------
	// 긴급 점검
	// ----------------------------------------------------------
	int insertStopValue( MasterE_stopDTO masterE_stopDTO);
	
	List<Map<String, String>> getStopValue();
	
	int cancelStopValue(MasterE_stopDTO masterE_stopDTO);
	
	
	
	List<Map<String, String>> getYearRoomType(int yearVal);
	
	List<Map<String, String>> roomtypeGraph(MasterChartsDTO masterChartsDTO);
}
