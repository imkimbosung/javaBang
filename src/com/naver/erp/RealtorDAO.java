package com.naver.erp;
import java.util.*;

public interface RealtorDAO {

	List<Map<String,String>> getRoomList(RealtorProductDTO realtorProductDTO);
	
	int getIdCnt(RealtorDTO realtorDTO);
	
	//int realtorOfficeNameCnt(RealtorDTO realtorDTO);
	
	// insert into realtor_info >> join in javaBang
	int insertRealtorInfo(RealtorDTO realtorDTO);
	
	int insertAuthority(RealtorDTO realtorDTO);
	
	int insertOffice(RealtorDTO realtorDTO);
	
	int insertOfficeAddr(RealtorDTO realtorDTO);
	
	int insertImage(RealtorDTO realtorDTO);
	
	int insertRoute(RealtorDTO realtorDTO);
	
	int getRealtorImageCnt(RealtorDTO realtorDTO);
	
	//----------------------------------------------------------------------
	
	int getRoomListAllCnt(SellroomSearchDTO sellroomSearchDTO);
	
	int getSmallRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	
	
	int getSmallMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	
	int getMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	int getBigRoomCnt(SellroomSearchDTO sellroomSearchDTO);
	
	List<Map<String,String>> getAddrList(SellroomSearchDTO sellroomSearchDTO);
	

	// 삭제할 게시판의 존재 개수를 리턴
	int getRealtorCnt(RealtorDTO realtorDTO);
	
	
	// 게시판 삭제 명령한 후 삭제 적용행의 개수 리턴
	int deleteRealtor(RealtorDTO realtorDTO);
	
	
	
	
	
	
	
	
	
	
	
	
	//int getRealtorNumCnt(RealtorDTO realtorDTO);
	
	//int getRealtorBusinessCntCnt(RealtorDTO realtorDTO);
	
	
	
	
	//password get and proc part
	int getPwdProcCnt(RealtorDTO realtorDTO);
	
	//member imformation get
	RealtorDTO getRealtorDTO(int r_no);
	
	int realtorUpdateRegCnt(RealtorDTO realtorDTO);
	
	int realtorUpdateInfoCnt(RealtorDTO realtorDTO);
	
	int realtorUpdateAddrCnt(RealtorDTO realtorDTO);
	
	int realtorUpdateAuthCnt(RealtorDTO realtorDTO);
	
	int updateCheck(SellroomSearchDTO sellroomSearchDTO);
	
	
	// 수정할 게시판의 비밀번호 존재 개수 리턴
	int getPwdCnt(RealtorDTO realtorDTO);
	
	

	int getEmptyRoomAllCnt(RealtorProductDTO realtorProductDTO);//for ���Ǹ�Ͼ��ε�
	
	List<Map<String, String>> getEmptyRoomList(RealtorProductDTO realtorProductDTO);//for ���Ǹ�Ͼ��ε�
	
	RealtorProductDTO getrealtorProductDTO(int sr_no);
	
	int updateCheckOwnerCode(RealtorProductDTO realtorProductDTO);
	
	int updateCheckRegisterCode(RealtorProductDTO realtorProductDTO);

	
	
	int getRealtorSaleRoomAllCnt(RealtorSearchDTO realtorSearchDTO);
	
	List<Map<String, String>> getRealtorSalRoomList();
	
	//List<Map<String,String>> getRateOfSalesList();
	List<Map<String,String>> getRateOfSalesList(int r_no);
	
	List<Map<String,String>> getSalesByRegionList(int r_no);
	
	
	
	// proMyPageHome info가져오기
		RealtorMenuInfoDTO getInfo(String r_id);
//		int getR_no(String r_id);
		
	String getAuthority(int r_no);
	
	
	int getRealtorNumCnt(RealtorDTO realtorDTO);
	
	int getBusinessNumCnt(RealtorDTO realtorDTO);
	
	//------------------잊어버리셨나요?---------------------
	
	String realtorIdCnt(RealtorDTO realtorDTO);
	
	String realtorPwdGet(RealtorDTO realtorDTO);
	
	
	
	int updateCheck_codeOf2(RealtorProductDTO realtorProductDTO);
	
	
	
	
	
	
	
	
	
}
