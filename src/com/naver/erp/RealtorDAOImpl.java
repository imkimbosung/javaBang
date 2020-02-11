package com.naver.erp;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RealtorDAOImpl implements RealtorDAO {
	

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------------------
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	public List<Map<String,String>> getRoomList(RealtorProductDTO realtorProductDTO){
		List<Map<String,String>> roomList = this.sqlSession.selectList(
			"com.naver.erp.RealtorDAO.getRoomList"
			,realtorProductDTO
		);
		return roomList;
				
	}


	//----------------------------------------------------------------------------------------------------
	public int getRoomListAllCnt(SellroomSearchDTO sellroomSearchDTO) {
		
		int roomListAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getRoomListAllCnt"
				, sellroomSearchDTO
		);
		return roomListAllCnt;
	}
	
	//----------------------------------------------------------------------------------------------------
	public int getSmallRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
		int getSmallRoomCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getSmallRoomCnt"
				, sellroomSearchDTO
		);
		return getSmallRoomCnt;
	}
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	public int getSmallMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
		int getSmallMiddleRoomCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getSmallMiddleRoomCnt"
				, sellroomSearchDTO
		);
		return getSmallMiddleRoomCnt;
	}
	

	//-----------------------1-----------------------------------------------------------------------------
	public int getRealtorCnt(RealtorDTO realtorDTO) {
		int realtorCnt = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.getRealtorCnt"
				, realtorDTO
		);
		return realtorCnt;
	}

	
	//-----------------------1-----------------------------------------------------------------------------
	public int getMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
		int getMiddleRoomCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getMiddleRoomCnt"
				, sellroomSearchDTO
		);
		return getMiddleRoomCnt;
	}
	//-----------------------1-----------------------------------------------------------------------------
	public int getBigRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
		int getBigRoomCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getBigRoomCnt"
				, sellroomSearchDTO
		);
		return getBigRoomCnt;
	}
	//-----------------------1-----------------------------------------------------------------------------
	
	public List<Map<String,String>> getAddrList(SellroomSearchDTO sellroomSearchDTO){
		List<Map<String,String>> addrList = this.sqlSession.selectList(
			"com.naver.erp.RealtorDAO.getAddrList"
			,sellroomSearchDTO
		);
		return addrList;
				
	}
	
	//---------------------------2-------------------------------------------------------------------------
	public int deleteRealtor(RealtorDTO realtorDTO) {
		int deleteRealtorCnt = this.sqlSession.delete("com.naver.erp.RealtorDAO.deleteRealtor"
				, realtorDTO);
		return deleteRealtorCnt;
	}

	
	
	
	
	//---------------------------------------------------------------------------------------------------- 아이디 중복 체크
	public int getIdCnt(RealtorDTO realtorDTO) {
		
		int getIdCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getIdCnt"
				, realtorDTO
		);
		return getIdCnt;
	}
	
	
	//---------------------------------------------------------------------------------------------------- 
			public int updateCheck(SellroomSearchDTO sellroomSearchDTO) {
				int updateCheck = this.sqlSession.update(
						"com.naver.erp.RealtorDAO.updateCheck"
						, sellroomSearchDTO);
				return updateCheck;
			}
	
	
	//---------------------------------------------------------------------------------------------------- 중개사무소명 중복확인
	/*
	public int realtorOfficeNameCnt(RealtorDTO realtorDTO) {
		int realtorOfficeNameCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.realtorOfficeNameCnt"
				, realtorDTO
		);
		return realtorOfficeNameCnt;
	}
	*/
	
	
	
	
	
	
	
	//---------------------------------------------------------------------------------------------------- 중개등록번호 중복확인
	/*
	public int getRealtorNumCnt(RealtorDTO realtorDTO) {
		int getIdCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getRealtorNumCnt"
				, realtorDTO
		);
		return getIdCnt;
	}
	*/
	
	
	//---------------------------------------------------------------------------------------------------- 사업자등록번호 중복확인
	/*
	public int getRealtorBusinessCntCnt(RealtorDTO realtorDTO) {
		int getBusinessCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getBusinessCnt"
				, realtorDTO
		);
		return getBusinessCnt;
	}*/
	
	
	
//wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	//---------------------------------------------------------------------------------------------------- 공인중개사 정보 입력
	public int insertRealtorInfo(RealtorDTO realtorDTO) {
		int insertResult = this.sqlSession.insert(
				"com.naver.erp.RealtorDAO.insertRealtorInfo"
				, realtorDTO
		);
		return insertResult;
	}
	//---------------------------------------------------------------------------------------------------- 공인중개사 권한 입력
	public int insertAuthority(RealtorDTO realtorDTO) {
		int insertResult = this.sqlSession.insert(
				"com.naver.erp.RealtorDAO.insertAuthority"
				, realtorDTO
		);
		return insertResult;
	}
	//---------------------------------------------------------------------------------------------------- 중개사무소명 입력
	public int insertOffice(RealtorDTO realtorDTO) {
		int insertResult = this.sqlSession.insert(
				"com.naver.erp.RealtorDAO.insertOffice"
				, realtorDTO
		);
		return insertResult;
	}
	//---------------------------------------------------------------------------------------------------- 중개사무소 주소 입력
	public int insertOfficeAddr(RealtorDTO realtorDTO) {
		int insertResult = this.sqlSession.insert(
				"com.naver.erp.RealtorDAO.insertOfficeAddr"
				, realtorDTO
		);
		return insertResult;
	}
	//---------------------------------------------------------------------------------------------------- 프로필사진 입력
	public int insertImage(RealtorDTO realtorDTO) {
		int insertResult = this.sqlSession.insert(
				"com.naver.erp.RealtorDAO.insertImage"
				, realtorDTO
		);
		return insertResult;
	}	
	//---------------------------------------------------------------------------------------------------- 가입경로 입력
	public int insertRoute(RealtorDTO realtorDTO) {
		int insertResult = this.sqlSession.insert(
				"com.naver.erp.RealtorDAO.insertRoute"
				, realtorDTO
		);
		return insertResult;
	}
	//---------------------------------------------------------------------------------------------------- 프로필사진 중복확인
	public int getRealtorImageCnt(RealtorDTO realtorDTO) {
		int getRealtorImageCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getRealtorImageCnt"
				, realtorDTO
		);
		return getRealtorImageCnt;
	}

	//wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	
	//---------------------------------------------------------------------------------------------------- getPwdProcCnt DB Connection
	//password get and proc part
	public int getPwdProcCnt(RealtorDTO realtorDTO) {
		int getPwdProc = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getPwdProcCnt"
				, realtorDTO
		);
		return getPwdProc;
	}

	
	
	
	
	//----------------------------------------------------------------------------------------------------
	public int getPwdCnt(RealtorDTO realtorDTO) {
		int pwdCnt = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.getPwdCnt", realtorDTO);
		return pwdCnt;
	}
	
	

	//---------------------------------------------------------------------------------------------------- getRealtorDTO DB Connection
	public RealtorDTO getRealtorDTO(int r_no) {
		RealtorDTO realtorDTO = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getRealtorDTO"
				, r_no
		);
		return realtorDTO;
	}
	
	
	//---------------------------------------------------------------------------------------------------- realtorUpdateRegCnt DB Connection
	public int realtorUpdateRegCnt(RealtorDTO realtorDTO) {
		int realtorUpdateReg = this.sqlSession.update(
				"com.naver.erp.RealtorDAO.realtorUpdateRegCnt"
				, realtorDTO
		);
		return realtorUpdateReg;
	}
	
	
	//---------------------------------------------------------------------------------------------------- realtorUpdateInfoCnt DB Connection
	public int realtorUpdateInfoCnt(RealtorDTO realtorDTO) {
		int realtorUpdateInfo = this.sqlSession.update(
				"com.naver.erp.RealtorDAO.realtorUpdateInfoCnt"
				, realtorDTO
		);
		return realtorUpdateInfo;
	}
	
	
	//---------------------------------------------------------------------------------------------------- realtorUpdateAddrCnt DB Connection
	public int realtorUpdateAddrCnt(RealtorDTO realtorDTO) {
		int realtroUpdateAddr = this.sqlSession.update(
				"com.naver.erp.RealtorDAO.realtorUpdateAddrCnt"
				, realtorDTO
		);
		return realtroUpdateAddr;
	}
	
	
	//---------------------------------------------------------------------------------------------------- realtorUpdateAuthCnt DB Connection
	public int realtorUpdateAuthCnt(RealtorDTO realtorDTO) {
		int realtorUpdateAuth = this.sqlSession.update(
				"com.naver.erp.RealtorDAO.realtorUpdateAuthCnt"
				, realtorDTO
		);
		return realtorUpdateAuth;
	}


	
	//----------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------------------
	@Override
	public int getEmptyRoomAllCnt(RealtorProductDTO realtorProductDTO) {
		int emptyRoomAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getEmptyRoomAllCnt"
				,realtorProductDTO
				);
		return emptyRoomAllCnt;
	}
	
	//----------------------------------------------------------------------------------------------------
	@Override
	public List<Map<String, String>> getEmptyRoomList(RealtorProductDTO realtorProductDTO) {
		List<Map<String, String>> emptyRoomList = this.sqlSession.selectList(
				"com.naver.erp.RealtorDAO.getEmptyRoomList"
				,realtorProductDTO
				);
		return emptyRoomList;
	}
	
	//----------------------------------------------------------------------------------------------------
	@Override
	public RealtorProductDTO getrealtorProductDTO(int sr_no) {
		RealtorProductDTO realtorProductDTO = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.getrealtorProductDTO", sr_no);
		return realtorProductDTO;
	}
	
	//----------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------------------
	@Override
	public int updateCheckOwnerCode(RealtorProductDTO realtorProductDTO) {
		int updateCheckOwnerCnt = this.sqlSession.update(
			"com.naver.erp.RealtorDAO.updateCheckOwnerCode"
			,realtorProductDTO
			);
		/*
		this.sqlSession.insert(
			"com.naver.erp.RealtorDAO.insertDataAssign"
			,realtorProductDTO
			);
		*/
		return updateCheckOwnerCnt;
	}
	
	//----------------------------------------------------------------------------------------------------
	// check_code : 1   >> check_code : 2 로 변경하는부분
	@Override
	public int updateCheckRegisterCode(RealtorProductDTO realtorProductDTO) {
		int updateCheckRegisterCnt = this.sqlSession.update(
				"com.naver.erp.RealtorDAO.updateCheckRegisterCode"
				,realtorProductDTO
				);
		this.sqlSession.insert(
				"com.naver.erp.RealtorDAO.insertDataAssign"
				,realtorProductDTO
				);
		
		return updateCheckRegisterCnt;
	}
	
	
	//----------------------------------------------------------------------------------------------------
	
	
	//----------------------------------------------------------------------------------------------------
//	public int getR_no(String r_id) {
//		int getR_no = this.sqlSession.selectOne(
//			"com.naver.erp.RealtorDAO.getR_no"
//			,r_id
//			);
//		return getR_no;
//	}
	
	public RealtorMenuInfoDTO getInfo(String r_id) {
		RealtorMenuInfoDTO realtorMenuInfoDTO = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getInfo"
				,r_id
				);
		return realtorMenuInfoDTO;
	}
	
	
	
	public int getRealtorSaleRoomAllCnt(RealtorSearchDTO realtorSearchDTO) {
		
		int realtorSaleRoomAllCnt = this.sqlSession.selectOne(
				"com.naver.erp.RealtorDAO.getEmptyRoomAllCnt"
				, realtorSearchDTO
				);
		return realtorSaleRoomAllCnt;
	}
	
	public List<Map<String, String>> getRealtorSalRoomList(){
		List<Map<String, String>> getRealtorSalRoomList = this.sqlSession.selectList("com.naver.erp.RealtorDAO.getRealtorSalRoomList");

		return getRealtorSalRoomList;
	}
	
	public List<Map<String,String>> getRateOfSalesList(int r_no){
		List<Map<String,String>> getRateOfSalesList = this.sqlSession.selectList("com.naver.erp.RealtorDAO.getRateOfSalesList", r_no);
		return getRateOfSalesList;
	}
	
	
	public List<Map<String,String>> getSalesByRegionList(int r_no){
		List<Map<String,String>> getSalesByRegionList = this.sqlSession.selectList("com.naver.erp.RealtorDAO.getSalesByRegionList", r_no);
		return getSalesByRegionList;
	}

	
	public String getAuthority(int r_no) {
		String authority = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.getAuthority",r_no);
		return authority;
	}
	
	
	public int getRealtorNumCnt(RealtorDTO realtorDTO) {
		int realtorNumCnt = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.getRealtorNumCnt", realtorDTO);
		System.out.println(" realtorNumCnt in DAO >> " + realtorNumCnt );
		return realtorNumCnt;
	}
	
	public int getBusinessNumCnt(RealtorDTO realtorDTO) {
		int businessNumCnt = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.getBusinessNumCnt", realtorDTO);
		System.out.println(" businessNumCnt in DAO >> " + businessNumCnt );
		return businessNumCnt;
	}
	
	
	
	//----------------------------------------------------------------------------------------------------
	//------------------잊어버리셨나요?---------------------
	
	public String realtorIdCnt(RealtorDTO realtorDTO) {
		String realtorIdCnt = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.realtorIdCnt", realtorDTO);
		return realtorIdCnt;
	}
	
	
	public String realtorPwdGet(RealtorDTO realtorDTO) {
		String realtorPwdGet = this.sqlSession.selectOne("com.naver.erp.RealtorDAO.realtorPwdGet", realtorDTO);
		return realtorPwdGet;
	}
	
	
	public int updateCheck_codeOf2(RealtorProductDTO realtorProductDTO) {
		int Check_codeOf2 = this.sqlSession.update("com.naver.erp.RealtorDAO.updateCheck_codeOf2", realtorProductDTO);
		return Check_codeOf2;
	}
	
	
	
	
	
}
	
	
	
	
	



	
	

