package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MasterServiceImpl implements MasterService {

	@Autowired
	private MasterDAO masterDAO;

	public MasterHomeDTO getHomeData() {

		MasterHomeDTO masterHomeDTO = this.masterDAO.getHomeData();

		return masterHomeDTO;
	}
	
	public List<Map<String, String>> getHomeGraphData(int yearVal) {
		List<Map<String, String>> mamterHomeGrap = this.masterDAO.getHomeGraphData(yearVal);

		return mamterHomeGrap;
	}
	
	
	// ----------------------------------------------------------
	// 데이터 조회 -> 고객 현황
	// ----------------------------------------------------------
	
	public int getBuyerListAllCnt() {
		int buyerListAllCnt=this.masterDAO.getBuyerListAllCnt();
		
		return buyerListAllCnt;
	}
	
	public int getSellerListAllCnt() {
		int sellerListAllCnt=this.masterDAO.getSellerListAllCnt();
		
		return sellerListAllCnt;
	}
	
	public int getRentalListAllCnt() {
		int rentalListAllCnt=this.masterDAO.getRentalListAllCnt();
		
		return rentalListAllCnt;
	}

	public List<Map<String, String>> getBoardListBuyer() {
		List<Map<String, String>> boardListBuyer= this.masterDAO.getBoardListBuyer();

		return boardListBuyer;
	}
	
	public List<Map<String, String>> getBoardListSeller() {
		List<Map<String, String>> boardListSeller = this.masterDAO.getBoardListSeller();

		return boardListSeller;
	}
	
	public List<Map<String, String>> getBoardListRealtor() {
		List<Map<String, String>> boardListRealtor = this.masterDAO.getBoardListRealtor();

		return boardListRealtor;
	}
	
	public List<Map<String, String>> getBoardListRental() {
		List<Map<String, String>> boardListRental = this.masterDAO.getBoardListRental();

		return boardListRental;
	}
	
	public List<Map<String, String>> getGender() {
		List<Map<String, String>> getGender = this.masterDAO.getGender();

		return getGender;
	}
	
	public List<Map<String, String>> getAge() {
		List<Map<String, String>> getAge = this.masterDAO.getAge();

		return getAge;
	}
	
	
	
	// 고객 정지 기능
	public int insertStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO) {
		int inputStomCus = this.masterDAO.insertStopCustomer(masterStopCustomerDTO);
		
		return inputStomCus;
	}
	
	public int updateStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO) {
		int updateStopCus = this.masterDAO.updateStopCustomer(masterStopCustomerDTO);
		
		return updateStopCus;
	}
	
	public int deleteStopCustomer(MasterStopCustomerDTO masterStopCustomerDTO) {
		int deleteStopCus = this.masterDAO.deleteStopCustomer(masterStopCustomerDTO);
		
		return deleteStopCus;
		
	}
	
	public List<Map<String, String>> getStopCustomer(String tableName){
		List<Map<String,String>> stopCustomer = this.masterDAO.getStopCustomer(tableName);
		
		return stopCustomer;
	}
	

	// ----------------------------------------------------------
	// 목록 수정 -> 판매자 code
	// ----------------------------------------------------------
	public List<Map<String, String>> getRoomTypeCode() {
		List<Map<String, String>> roomTypeCode = this.masterDAO.getRoomTypeCode();

		return roomTypeCode;
	}

	public List<Map<String, String>> getELVCode() {
		List<Map<String, String>> ELVCode = this.masterDAO.getELVCode();

		return ELVCode;

	}

	public List<Map<String, String>> getHcTypeCode() {
		List<Map<String, String>> hcTypeCode = this.masterDAO.getHcTypeCode();

		return hcTypeCode;
	}

	public List<Map<String, String>> getOptionSelectCode() {
		List<Map<String, String>> optionSelectCode = this.masterDAO.getOptionSelectCode();

		return optionSelectCode;
	}
	
	public List<Map<String, String>> getPetCode() {
		List<Map<String, String>> optionSelectCode = this.masterDAO.getPetCode();

		return optionSelectCode;
	}

	public List<Map<String, String>> getParkingCode() {
		List<Map<String, String>> optionSelectCode = this.masterDAO.getParkingCode();

		return optionSelectCode;
	}
	
	public List<Map<String, String>> getOptionTypeCode() {
		List<Map<String, String>> optionSelectCode = this.masterDAO.getOptionTypeCode();

		return optionSelectCode;
	}
	
	public List<Map<String, String>> getFeeCode() {
		List<Map<String, String>> optionSelectCode = this.masterDAO.getFeeCode();

		return optionSelectCode;
	}
	
	public List<Map<String, String>> getLiveInCode() {
		List<Map<String, String>> optionSelectCode = this.masterDAO.getLiveInCode();

		return optionSelectCode;
	}
	
	public List<Map<String, String>> getSellCode() {
		List<Map<String, String>> optionSelectCode = this.masterDAO.getSellCode();

		return optionSelectCode;
	}


	// ----------------------------------------------------------
	// 목록 수정 -> 공인중개사 code (페이지에 정보 가져오기)
	// ----------------------------------------------------------
	public List<Map<String, String>> getAuthCode() {
		List<Map<String, String>> roomTypeCode = this.masterDAO.getAuthCode();

		return roomTypeCode;
	}

	public List<Map<String, String>> getSignupRouteCode() {
		List<Map<String, String>> ELVCode = this.masterDAO.getSignupRouteCode();

		return ELVCode;

	}

	public List<Map<String, String>> getDataCheckCode() {
		List<Map<String, String>> hcTypeCode = this.masterDAO.getDataCheckCode();

		return hcTypeCode;
	}
	
	// ----------------------------------------------------------
	// 목록 수정 -> 공인중개사 code (페이지에 정보 가져오기)
	// ----------------------------------------------------------
	public List<Map<String, String>> getRentalCode() {
		List<Map<String, String>> rentalCode = this.masterDAO.getRentalCode();

		return rentalCode;
	}

	public List<Map<String, String>> getRentalProductCode() {
		List<Map<String, String>> rentalProductCode = this.masterDAO.getRentalProductCode();

		return rentalProductCode;

	}
	
	// ----------------------------------------------------------
	// 목록 수정 -> 모든 코드들의 입력, 수정, 삭제
	// ----------------------------------------------------------
	public int delAllCode(MasterAllCodeDTO masterAllCodeDTO) {

		int sellerCodeCnt = 0;
		int j = 0;
		int checkNumCnt = 0;
		for (int i = 0; i < masterAllCodeDTO.getSelectColumn().length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("selectColumn", masterAllCodeDTO.getSelectColumn()[i]);
			map.put("tableName", masterAllCodeDTO.getTableName()[j]);
			map.put("columnName", masterAllCodeDTO.getColumnName()[j]);
			map.put("columnCodeName", masterAllCodeDTO.getColumnCodeName()[j]);

			int deleteNum = this.masterDAO.getDeleteNum(map);

			sellerCodeCnt = this.masterDAO.delAllCode(map);
			map.put("deleteNum", Integer.toString(deleteNum));
			int downNum = this.masterDAO.updateRoomTypeCode(map);

			if (i == (masterAllCodeDTO.getCheckNum()[checkNumCnt] - 1)) {
				j++;
				checkNumCnt++;
			}

		}

		return sellerCodeCnt;
	}

	public int upAllCode(List<String> changeCode, List<String> tableInfo) {
		int sellerCodeCnt = 0;

		for (int i = 0; i < changeCode.size(); i = i + 2) {
			Map<String, String> updateCode = new HashMap<String, String>();
			updateCode.put("gizonValue", changeCode.get(i));
			updateCode.put("changeValue", changeCode.get(i + 1));
			updateCode.put("tableName", tableInfo.get(i));
			updateCode.put("tableColumn", tableInfo.get(i + 1));

			sellerCodeCnt = this.masterDAO.upAllCode(updateCode);
			if (sellerCodeCnt == 0)
				return -1;

		}

		return sellerCodeCnt;
	}

	public int inAllCode(MasterAllCodeDTO masterAllCodeDTO) {

		int sellerCodeCnt = 0;
		for (int i = 0; i < masterAllCodeDTO.getTableName().length; i++) {

			Map<String, String> map = new HashMap<String, String>();
			map.put("tableName", masterAllCodeDTO.getTableName()[i]);
			map.put("columnName", masterAllCodeDTO.getColumnName()[i]);
			map.put("columnCodeName", masterAllCodeDTO.getColumnCodeName()[i]);

			map.put("insertValue", masterAllCodeDTO.getInsertValue()[i]);
			int checkOverlap = this.masterDAO.getCheckNum(map);
			if (checkOverlap != 0) {
				return -2;
			}
			sellerCodeCnt = this.masterDAO.inAllCode(map);

		}
		return sellerCodeCnt;
	}
	
	
	// ----------------------------------------------------------
	// 서버 점검시 유저 접근 차단
	// ----------------------------------------------------------
	public String getCheckCode() {
		String checkCode = this.masterDAO.getCheckCode();
		return checkCode;
	}
	
	public List<Map<String,String>> getCheckInfo(){
		List<Map<String,String>> getCheckInfo = this.masterDAO.getCheckInfo();
		
		return getCheckInfo;
	}
	
	
	
	
	public int updateCheckCode(MasterCheckcodeDTO masterCheckcodeDTO) {
//		System.out.println("serviceimpl");
		int checkingCnt = this.masterDAO.updateCheckCode(masterCheckcodeDTO);
//		System.out.println("checkingCnt => " + checkingCnt);
		return checkingCnt;
	}
	
	
//	
//	public MasterBuyerListDTO getBuyerChartData() {
//		MasterBuyerListDTO masterBuyerListDTO = this.masterDAO.getBuyerChartData();
//		
//		return masterBuyerListDTO;
//		
//	}
	
	
	// home 그래프 year값
	public List<Map<String, String>> getYearValCnt(int yearVal) {
		
		List<Map<String, String>> yearValCnt = this.masterDAO.getYearValCnt(yearVal);
		
		return yearValCnt;
		
	}
	
	// ----------------------------------------------------------
	// 매물 현황 데이터 가져오기
	// ----------------------------------------------------------		
	public List<Map<String, String>> getRoomGraphData(){
		List<Map<String, String>> masterRoomGrap = this.masterDAO.getRoomGraphData();

		return masterRoomGrap;
	}
	
	public List<Map<String, String>> getCustoemrGraphData(){
		List<Map<String, String>> masterCustomerGraph = this.masterDAO.getCustoemrGraphData();

		return masterCustomerGraph;
		
	}
	
	public List<Map<String, String>> getProductLabels(){
		List<Map<String, String>> rentProductLabels = this.masterDAO.getProductLabels();

		return rentProductLabels;
		
	}
	
	
	
	
	// 방문자 count	
	
	public int setVisitTotalCount() {

		int visitCnt = this.masterDAO.setVisitTotalCount();

		return visitCnt;
	}
	
	public int getVisitTodayCount() {
		int VisitTodayCnt = this.masterDAO.getVisitTodayCount();

		return VisitTodayCnt;
	}
	
	public int getVisitTotalCount() {
		int VisitAllCnt = this.masterDAO.getVisitTotalCount();

		return VisitAllCnt;
	}
	
	
	
	 public List<Map<String, String>> getProductMonthCnt(MasterRentCntDTO masterRentCntDTO){
			List<Map<String, String>> productMonthCnt = this.masterDAO.getProductMonthCnt(masterRentCntDTO);
			
			return productMonthCnt;
	 }
	 
	 public  List<Map<String, String>> getProductRankingCnt(){
		// 최근 3개월 ranking
			List<Map<String, String>> productRankingCnt = this.masterDAO.getProductRankingCnt();
			
			return productRankingCnt;
	 }
	 
	 
	 
	 
	 
	public  int getCompanyRankingAllCnt() {
		int companyRankingAllCnt = this.masterDAO.getCompanyRankingAllCnt();
		
		return companyRankingAllCnt;
	 }
	  
	 
	 public  List<Map<String, String>> getCompanyRankingCnt(){
		// 최근 3개월 ranking
		 List<Map<String, String>> companyRankingCnt = this.masterDAO.getCompanyRankingCnt();
			
			return companyRankingCnt;
	 }
	 

	 // 공인중개사 정보 가져오기
	 public List<Map<String,String>> getRealtorInfo(){
		 
		 List<Map<String,String>> getRealtorInfo = this.masterDAO.getRealtorInfo();
		 
		 return getRealtorInfo;
	 }
	 
	 public List<Map<String, String>> getSignUpRoot(){
		 List<Map<String, String>> getSignUpRoot = this.masterDAO.getSignUpRoot();
		 
		 return getSignUpRoot;
	 }
	 
	 
	 public 	int getRealtorListAllCnt( ) {
		 
		 int realtorListAllCnt=this.masterDAO.getRealtorListAllCnt();
		 
		 return  realtorListAllCnt;
	 }
	 
	 
		// ----------------------------------------------------------
		// 긴급 점검
		// ----------------------------------------------------------
		public int insertStopValue( List<String>  checkValue) {
			MasterE_stopDTO masterE_stopDTO = new MasterE_stopDTO();
			int checkingCnt = 0;
			
				for(int i = 0; i  < checkValue.size() ; i++) {
					
				if(checkValue.get(i).equals("buyer")) {
					masterE_stopDTO.setCheckValue("stop_buyer");
					checkingCnt = this.masterDAO.insertStopValue(masterE_stopDTO);
				}else if(checkValue.get(i).equals("seller")) {
					masterE_stopDTO.setCheckValue("stop_seller");
					checkingCnt = this.masterDAO.insertStopValue(masterE_stopDTO);
				}else if(checkValue.get(i).equals("rental")) {
					masterE_stopDTO.setCheckValue("stop_rental");
					checkingCnt = this.masterDAO.insertStopValue(masterE_stopDTO);
				}else if(checkValue.get(i).equals("realtor")) {
					masterE_stopDTO.setCheckValue("stop_realtor");
					checkingCnt = this.masterDAO.insertStopValue(masterE_stopDTO);
				}

				if(checkingCnt < 1) return checkingCnt = -1;
			}
				
			return checkingCnt;
		}
		
		public List<Map<String, String>> getStopValue(){
			
			List<Map<String,String>> stopValueList = this.masterDAO.getStopValue();
			
			return stopValueList;
		}
	
		public int cancelStopValue(String cancelValue) {
			MasterE_stopDTO masterE_stopDTO = new MasterE_stopDTO();
			int checkingCnt  = 0;
			
			if(cancelValue.equals("buyer")) {
				masterE_stopDTO.setCancelValue("stop_buyer");
				checkingCnt = this.masterDAO.cancelStopValue(masterE_stopDTO);
			}else if(cancelValue.equals("seller")) {
				masterE_stopDTO.setCancelValue("stop_seller");
				checkingCnt =this.masterDAO.cancelStopValue(masterE_stopDTO);
			}else if(cancelValue.equals("rental")) {
				masterE_stopDTO.setCancelValue("stop_rental");
				checkingCnt = this.masterDAO.cancelStopValue(masterE_stopDTO);
			}else if(cancelValue.equals("realtor")) {
				masterE_stopDTO.setCancelValue("stop_realtor");
				checkingCnt = this.masterDAO.cancelStopValue(masterE_stopDTO);
			}
			
			if(checkingCnt < 1) return checkingCnt = -1;
			
			return checkingCnt;
		}

		
		
		
		public List<Map<String, String>> roomtypeGraph(MasterChartsDTO masterChartsDTO){
			List<Map<String, String>> roomtypeGraph = this.masterDAO.roomtypeGraph(masterChartsDTO);

			return roomtypeGraph;
		}
		
		
		// home 그래프 year값
		public List<Map<String, String>> getYearRoomType(int yearVal) {
			
			List<Map<String, String>> yearValCnt = this.masterDAO.getYearRoomType(yearVal);
			
			return yearValCnt;
			
		}
}
