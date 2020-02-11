package com.naver.erp;
import java.util.*;


public interface RealtorService {

	int insertRealtor(RealtorDTO realtorDTO);
	
	int realtorIdCheck(RealtorDTO realtorDTO);
	
	List<Map<String,String>> getRoomList(RealtorProductDTO realtorProductDTO);
	
	int getRoomListAllCnt(SellroomSearchDTO sellroomSearchDTO);
	
	int getSmallRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	int getSmallMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	
	int getMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	int getBigRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	List<Map<String,String>> getAddrList(SellroomSearchDTO sellroomSearchDTO);
	
	
	int deleteRealtor(RealtorDTO realtorDTO);
	
	int realtorPwdCnt(RealtorDTO realtorDTO);
	
	
	
	
	
	
	int getPwdProc(RealtorDTO realtorDTO);
	
	RealtorDTO getRealtorDTO(int r_no);
	
	int updateRealtor(RealtorDTO realtorDTO);
	
	int getEmptyRoomAllCnt(RealtorProductDTO realtorProductDTO); //for.upload empty room list
	
	List<Map<String, String>> getEmptyRoomList(RealtorProductDTO realtorProductDTO); //for.upload empty room list
	
	RealtorProductDTO getrealtorProductDTO(int sr_no);
	
	int updateCheckOwnerCode(RealtorProductDTO realtorProductDTO);
	
	int updateCheckRegisterCode(RealtorProductDTO realtorProductDTO);
	

	
		int getRealtorSaleRoomAllCnt(RealtorSearchDTO realtorSearchDTO);
		
		List<Map<String, String>> getRealtorSalRoomList();
		
		//List<Map<String,String>> getRateOfSalesList();
		List<Map<String,String>> getRateOfSalesList(int r_no);
		
		List<Map<String,String>> getSalesByRegionList(int r_no);
		
	String getAuthority(int r_no);
		
	// proMyPageHome info가져오기
	RealtorMenuInfoDTO getInfo(String r_id);
	
	
	int updateCheck(SellroomSearchDTO sellroomSearchDTO);
//	int getR_no(String r_id);
	
	
	
	// =============================================================================
	// $.ajax - realtorNumProc.do in proRegisterJoin2
	// =============================================================================
	int getRealtorNumCnt(RealtorDTO realtorDTO);
	
	int getBusinessNumCnt(RealtorDTO realtorDTO);
	
	
	//------------------잊어버리셨나요?---------------------
	
	String realtorIdCnt(RealtorDTO realtorDTO);
	
	String realtorPwdGet(RealtorDTO realtorDTO);
	
	
	// =============================================================================
	// $.ajax - managementHouseProc_code2.do in managementHouse.jsp
	// =============================================================================
	int updateCheck_codeOf2(RealtorProductDTO realtorProductDTO);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
