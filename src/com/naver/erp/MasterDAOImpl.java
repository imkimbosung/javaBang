package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// @Repository를 붙여 DAO클래스 임을 지정하고, bean태그로 자동 등록됨

@Repository
public class MasterDAOImpl implements MasterDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public MasterHomeDTO getHomeData() {
		MasterHomeDTO masterHomeDTO = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getHomeData");

		return masterHomeDTO;
	}

	public List<Map<String, String>> getHomeGraphData(int yearVal) {
		List<Map<String, String>> mamterHomeGrap = this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getHomeGraphData",yearVal);

		return mamterHomeGrap;

	}

	
	// ----------------------------------------------------------
	// 데이터 조회 -> 고객 현황
	// ----------------------------------------------------------
	public int getBuyerListAllCnt() {
		int buyerListAllCnt=this.sqlSession.selectOne("com.naver.erp.MasterDAO.getBuyerListAllCnt");
		
		return buyerListAllCnt;
	}
	
	public int getSellerListAllCnt() {
		int sellerListAllCnt=this.sqlSession.selectOne("com.naver.erp.MasterDAO.getSellerListAllCnt");
		
		return sellerListAllCnt;
	}
	
	public int getRentalListAllCnt() {
		int rentalListAllCnt=this.sqlSession.selectOne("com.naver.erp.MasterDAO.getRentalListAllCnt");
		
		return rentalListAllCnt;
	}
	
	public List<Map<String, String>> getBoardListBuyer() {
		List<Map<String, String>> boardListBuyer= this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getBoardListBuyer");

		return boardListBuyer;
	}
	
	public List<Map<String, String>> getBoardListSeller() {
		List<Map<String, String>> boardListSeller =  this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getBoardListSeller");

		return boardListSeller;
	}

	public List<Map<String, String>> getBoardListRealtor() {
		List<Map<String, String>> boardListRealtor =  this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getBoardListRealtor");

		return boardListRealtor;
	}
	
	public List<Map<String, String>> getBoardListRental() {
		List<Map<String, String>> boardListRental =  this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getBoardListRental");

		return boardListRental;
	}
	
	public List<Map<String, String>> getGender() {
		List<Map<String, String>> getGender =  this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getGender");


		return getGender;
	}
	
	public List<Map<String, String>> getAge() {
		List<Map<String, String>> getAge =  this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getAge");


		return getAge;
	}
	
	
	
	
	// 고객 정지 기능
	public int insertStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO) {
		int inputStomCus = this.sqlSession.insert("com.naver.erp.MasterDAO.insertStopCustomer", masterStopCustomerDTO);
		
		return inputStomCus;
	}
	
	public int updateStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO) {
		int updateStopCus = this.sqlSession.update("com.naver.erp.MasterDAO.updateStopCustomer", masterStopCustomerDTO);
		
		return updateStopCus;
	}
	
	public int deleteStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO) {
		int deleteStopCus = this.sqlSession.delete("com.naver.erp.MasterDAO.deleteStopCustomer", masterStopCustomerDTO);
		
		return deleteStopCus;
		
	}
	
	public List<Map<String, String>> getStopCustomer(String tableName){
		List<Map<String,String>> stopCustomer = this.sqlSession.selectList("com.naver.erp.MasterDAO.getStopCustomer", tableName);
		
		return stopCustomer;
	}
	
	
	
	
	// ----------------------------------------------------------
	// 목록 수정 -> 판매자 code 데이터 가져오기
	// ----------------------------------------------------------
	public List<Map<String, String>> getRoomTypeCode() {
		List<Map<String, String>> roomTypeCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getRoomTypeCode");

		return roomTypeCode;
	}

	public List<Map<String, String>> getELVCode() {
		List<Map<String, String>> ELVCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getELVCode");

		return ELVCode;
	}

	public List<Map<String, String>> getHcTypeCode() {
		List<Map<String, String>> hcTypeCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getHcTypeCode");

		return hcTypeCode;
	}
	
	public List<Map<String, String>> getOptionSelectCode() {
		List<Map<String, String>> optionSelectCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getOptionSelectCode");

		return optionSelectCode;
	}
	
	public List<Map<String, String>> getPetCode() {
		List<Map<String, String>> getPetCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getPetCode");

		return getPetCode;
	}
	
	public List<Map<String, String>> getParkingCode() {
		List<Map<String, String>> getParkingCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getParkingCode");

		return getParkingCode;
	}
	
	public List<Map<String, String>> getOptionTypeCode() {
		List<Map<String, String>> getOptionTypeCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getOptionTypeCode");

		return getOptionTypeCode;
	}
	
	public List<Map<String, String>> getFeeCode() {
		List<Map<String, String>> getFeeCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getFeeCode");

		return getFeeCode;
	}
	
	public List<Map<String, String>> getLiveInCode() {
		List<Map<String, String>> getLiveInCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getLiveInCode");

		return getLiveInCode;
	}
	
	public List<Map<String, String>> getSellCode() {
		List<Map<String, String>> getSellCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getSellCode");

		return getSellCode;
	}

	// ----------------------------------------------------------
	// 목록 수정 -> 공인중개사 code 데이터 가져오기
	// ----------------------------------------------------------
	public List<Map<String, String>> getAuthCode() {
		List<Map<String, String>> roomTypeCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getAuthCode");

		return roomTypeCode;
	}

	public List<Map<String, String>> getSignupRouteCode() {
		List<Map<String, String>> ELVCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getSignupRouteCode");

		return ELVCode;
	}

	public List<Map<String, String>> getDataCheckCode() {
		List<Map<String, String>> hcTypeCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getDataCheckCode");

		return hcTypeCode;
	}

	// ----------------------------------------------------------
	// 목록 수정 -> 렌탈 code 데이터 가져오기
	// ----------------------------------------------------------
	public List<Map<String, String>> getRentalCode() {
		List<Map<String, String>> rentalCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getRentalCode");

		return rentalCode;
	}

	public List<Map<String, String>> getRentalProductCode() {
		List<Map<String, String>> rentalProductCode = this.sqlSession.selectList("com.naver.erp.MasterDAO.getRentalProductCode");

		return rentalProductCode;
	}

	// ----------------------------------------------------------
	// 목록 수정 -> 모든 코드들의 입력, 수정, 삭제
	// ----------------------------------------------------------
	public int getDeleteNum(Map<String, String> map) {

		int deleteNum = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getDeleteNum", map);
//			System.out.println("getDeleteNum >> " + deleteNum);
		return deleteNum;
	}

	public int delAllCode(Map<String, String> map) {

		int sellerCodeCnt = this.sqlSession.delete("com.naver.erp.MasterDAO.delAllCode", map);

		return sellerCodeCnt;
	}

	public int updateRoomTypeCode(Map<String, String> map) {
//			System.out.println("updateRoomTypeCode >> " + map.get("deleteNum"));
		int updateRoomTypeCode = this.sqlSession.update("com.naver.erp.MasterDAO.updateRoomTypeCode", map);

		return updateRoomTypeCode;
	}

	public int upAllCode(Map<String, String> updateCode) {
		int sellerCodeCnt = this.sqlSession.update("com.naver.erp.MasterDAO.upAllCode", updateCode);

		return sellerCodeCnt;
	}

	public int getCheckNum(Map<String, String> map) {
		int checkNum = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getCheckNum", map);

		return checkNum;
	}

	public int inAllCode(Map<String, String> insertCode) {
		int sellerCodeCnt = this.sqlSession.insert("com.naver.erp.MasterDAO.inAllCode", insertCode);

		return sellerCodeCnt;
	}
	
	// ----------------------------------------------------------
	// 서버 점검시 유저 접근 차단
	// ----------------------------------------------------------
	public String getCheckCode() {
		String checkCode = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getCheckCode");
		return checkCode;
	}
	
	public List<Map<String,String>> getCheckInfo(){
		List<Map<String,String>> getCheckInfo = this.sqlSession.selectList("com.naver.erp.MasterDAO.getCheckInfo");
		
		return getCheckInfo;
		
	}
	
	
	
	
	public int updateCheckCode(MasterCheckcodeDTO masterCheckcodeDTO) {
		int checkingCnt =  this.sqlSession.update("com.naver.erp.MasterDAO.updateCheckCode", masterCheckcodeDTO);
		return checkingCnt;
	}
	
	
	
	
	
	
//	public MasterBuyerListDTO getBuyerChartData() {
//		MasterBuyerListDTO masterBuyerListDTO = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getBuyerChartData");
//		
//		return masterBuyerListDTO;
//		
//	}
	
	
	
	public List<Map<String, String>> getYearValCnt(int yearVal) {
		List<Map<String, String>> mamterHomeGrap = this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getHomeGraphData",yearVal );

		return mamterHomeGrap;

	}
	
	
	// ----------------------------------------------------------
	// 매물 현황 데이터 가져오기
	// ----------------------------------------------------------		
	public List<Map<String, String>> getRoomGraphData(){
		List<Map<String, String>> masterRoomGraph = this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getRoomGraphData");

		return masterRoomGraph;
	}
	
	public List<Map<String, String>> getCustoemrGraphData(){
		List<Map<String, String>> masterCustomerGraph = this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getCustoemrGraphData");

		return masterCustomerGraph;
		
	}
	
	public List<Map<String, String>> getProductLabels(){
		List<Map<String, String>> rentProductLabels = this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getProductLabels");

		return rentProductLabels;
		
	}
	
	
	
	
	

	// 방문자 count
	
	public int setVisitTotalCount() {

		int visitCnt = this.sqlSession.insert("com.naver.erp.MasterDAO.setVisitTotalCount");

		return visitCnt;
	}
	
	public int getVisitTodayCount() {
		int VisitTodayCnt = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getVisitTodayCount");

		return VisitTodayCnt;
	}
	
	public int getVisitTotalCount() {
		int VisitAllCnt = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getVisitTotalCount");

		return VisitAllCnt;
	}
	
	
	

	 public List<Map<String, String>> getProductMonthCnt(MasterRentCntDTO masterRentCntDTO){
			List<Map<String, String>> productMonthCnt = this.sqlSession.selectList("com.naver.erp.MasterDAO.getProductMonthCnt" , masterRentCntDTO);
			
			return productMonthCnt;
	 }
	 
		//  테이터조회 -> 렌트 물품 현황   제품 페이징 처리
	 public  List<Map<String, String>> getProductRankingCnt(){
			// 최근 3개월 ranking
				List<Map<String, String>> productRankingCnt = this.sqlSession.selectList("com.naver.erp.MasterDAO.getProductRankingCnt" );
				
				return productRankingCnt;
		 }
	 
	 
	//  테이터조회 -> 렌트 물품 현황   회사 페이징 처리
	 public  int getCompanyRankingAllCnt() {
			int companyRankingAllCnt = this.sqlSession.selectOne("com.naver.erp.MasterDAO.getCompanyRankingAllCnt");
			
			return companyRankingAllCnt;
		 }
	 
	 
	 public  List<Map<String, String>> getCompanyRankingCnt(){
		// 최근 3개월 ranking
		 List<Map<String, String>> companyRankingCnt = this.sqlSession.selectList("com.naver.erp.MasterDAO.getCompanyRankingCnt" );
			
			
			return companyRankingCnt;
	 }
	 
	 
	 
	 // 공인중개사 정보 가져오기
	 public List<Map<String,String>> getRealtorInfo(){
		 
		 List<Map<String,String>> getRealtorInfo =this.sqlSession.selectList("com.naver.erp.MasterDAO.getRealtorInfo" );
		 
		 return getRealtorInfo;
	 }
	 
	 public List<Map<String, String>> getSignUpRoot(){
		 List<Map<String, String>> getSignUpRoot = this.sqlSession.selectList("com.naver.erp.MasterDAO.getSignUpRoot");
		 
		 return getSignUpRoot;
	 }
	 
	 public 	int getRealtorListAllCnt() {
		 
		 int realtorListAllCnt= this.sqlSession.selectOne("com.naver.erp.MasterDAO.getRealtorListAllCnt");
		 
		 return  realtorListAllCnt;
	 }
	
	 
	 
	// ----------------------------------------------------------
	// 긴급 점검
	// ----------------------------------------------------------
	public int insertStopValue( MasterE_stopDTO masterE_stopDTO) {
		int checkingCnt = this.sqlSession.update("com.naver.erp.MasterDAO.insertStopValue" , masterE_stopDTO);
		
		return checkingCnt;
	}
	
	
	public List<Map<String, String>> getStopValue(){
		
		List<Map<String,String>> stopValueList = this.sqlSession.selectList("com.naver.erp.MasterDAO.getStopValue" );
		
		return stopValueList;
	}
	
	

	public int cancelStopValue(MasterE_stopDTO masterE_stopDTO) {
		
		int checkingCnt =  this.sqlSession.update("com.naver.erp.MasterDAO.cancelStopValue" , masterE_stopDTO );
		
		return checkingCnt;
	}

	
	
	
	public List<Map<String, String>> roomtypeGraph(MasterChartsDTO masterChartsDTO){
		List<Map<String, String>> roomtypeGraph = this.sqlSession
				.selectList("com.naver.erp.MasterDAO.roomtypeGraph", masterChartsDTO);

		return roomtypeGraph;
	}
	
	
	public List<Map<String, String>> getYearRoomType(int yearVal) {
		MasterChartsDTO masterChartsDTO = new MasterChartsDTO();
		masterChartsDTO.setYearVal( Integer.toString(yearVal));
		List<Map<String, String>> roomtypeGraph = this.sqlSession
				.selectList("com.naver.erp.MasterDAO.getYearRoomType", masterChartsDTO );

		return roomtypeGraph;

	}

}
