package com.naver.erp;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RealtorServiceImpl implements RealtorService {

	
	@Autowired
	private RealtorDAO realtorDAO;

	
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------------------
	
	

	

	//----------------------------------------------------------------------------------------------------
	public List<Map<String, String>> getRoomList(RealtorProductDTO realtorProductDTO) {
		List<Map<String, String>> roomList = this.realtorDAO.getRoomList(realtorProductDTO);
		return roomList;
	}
	
	
	//----------------------------------------------------------------------------------------------------
	public int getRoomListAllCnt(SellroomSearchDTO sellroomSearchDTO) {
		int roomListAllCnt = this.realtorDAO.getRoomListAllCnt(sellroomSearchDTO);
		return roomListAllCnt;
	}
	
	//----------------------------------------------------------------------------------------------------
		public int getSmallMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
			int roomListAllCnt = this.realtorDAO.getSmallMiddleRoomCnt(sellroomSearchDTO);
			return roomListAllCnt;
		}
		
		
	//----------------------------------------------------------------------------------------------------
		public int getSmallRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
			int roomListAllCnt = this.realtorDAO.getSmallRoomCnt(sellroomSearchDTO);
			return roomListAllCnt;
		}

	
	//----------------------------------------------------------------------------------------------------
	public int insertRealtor(RealtorDTO realtorDTO) {

			
				//-------중개사무소명이 중복
				//int realtorOfficeNameCnt = this.realtorDAO.realtorOfficeNameCnt(realtorDTO);
			
				//-------중개등록번호가 중복
				//int idCnt = this.realtorDAO.getRealtorNumCnt(realtorDTO);
						
				//-------사업자 등록번호가 중복
				//int businessCnt = this.realtorDAO.getRealtorBusinessCntCnt(realtorDTO);
				
				
				//-------프로필사진이 중복
				int getRealtorImageCnt = this.realtorDAO.getRealtorImageCnt(realtorDTO);

				//-------공인중개사 정보 입력
				int realtorRegCnt = this.realtorDAO.insertRealtorInfo(realtorDTO);

				
				//-------공인중개사권한 입력
				int authorityRegCnt = this.realtorDAO.insertAuthority(realtorDTO);
				
				
				//-------공인중개소명 입력
				int officeRegCnt = this.realtorDAO.insertOffice(realtorDTO);
				
				//-------공인중개소 주소 입력
				int officeAddrRegCnt = this.realtorDAO.insertOfficeAddr(realtorDTO);
				
				//-------공인중개소 프로필이미지 입력
				int imageRegCnt = this.realtorDAO.insertImage(realtorDTO);
				if (imageRegCnt == 0) {
					return -4;
				}
				
				//-------공인중개소 가입 경로 입력
				int routeRegCnt = this.realtorDAO.insertRoute(realtorDTO);
				if (routeRegCnt == 0) {
					return -5;
				}
				
				
				//-------최종적인 결과값 return
				return realtorRegCnt;
				
				
			}

	
	
	//----------------------------------------------------------------------------------------------------
	public int realtorIdCheck(RealtorDTO realtorDTO) {
		
		
		// 아이디 중복 체크
		int getidCnt = this.realtorDAO.getIdCnt(realtorDTO);
		if (getidCnt != 0) {
			return -1;
		}
		
		//-------최종적인 결과값 return
		return getidCnt;
		
		
	}
	//----------------------------------------------------------------------------------------------------
	
	public int getMiddleRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
		int roomListAllCnt = this.realtorDAO.getMiddleRoomCnt(sellroomSearchDTO);
		return roomListAllCnt;
	}
	//----------------------------------------------------------------------------------------------------
	public int getBigRoomCnt(SellroomSearchDTO sellroomSearchDTO) {
		int roomListAllCnt = this.realtorDAO.getBigRoomCnt(sellroomSearchDTO);
		return roomListAllCnt;
	}
	
	//----------------------------------------------------------------------------------------------------
	public List<Map<String, String>> getAddrList(SellroomSearchDTO sellroomSearchDTO) {
		List<Map<String, String>> addrList = this.realtorDAO.getAddrList(sellroomSearchDTO);
		return addrList;
	}
	
	

	//----------------------------------------------------------------------------------------------------
	public int deleteRealtor(RealtorDTO realtorDTO) {

		//----------------------------------------------------
		int realtorCnt = this.realtorDAO.getRealtorCnt(realtorDTO);
		if (realtorCnt == 0) {
			return -1;
		}

		
		//---------------------------------------------------------
		int pwdCnt = this.realtorDAO.getPwdCnt(realtorDTO);
		if (pwdCnt == 0) {
			return -2;
		}

		
		//----------------------------------------------------
		int deleteCnt = this.realtorDAO.deleteRealtor(realtorDTO);
		
		return deleteCnt;
	}
	
	
	//----------------------------------------------------------------------------------------------------
	public int realtorPwdCnt(RealtorDTO realtorDTO) {
		int pwdCnt = this.realtorDAO.getPwdCnt(realtorDTO);
		if (pwdCnt == 0) {
			System.out.println(pwdCnt);
			return -2;
		}
		return pwdCnt;

	}
	
	
	
	
	
	
	
	
	
	
	//----------------------------------------------------------------------------------------------------
	// password get and proc part
	public int getPwdProc(RealtorDTO realtorDTO) {
		int confirmPwdCnt = this.realtorDAO.getPwdProcCnt(realtorDTO);
		return confirmPwdCnt;
	}

	
	
	//----------------------------------------------------------------------------------------------------
	// member imformation get
	public RealtorDTO getRealtorDTO(int r_no) {
		RealtorDTO realtorDTO = this.realtorDAO.getRealtorDTO(r_no);
		return realtorDTO;
	}

	
	
	//----------------------------------------------------------------------------------------------------
	public int updateRealtor(RealtorDTO realtorDTO) {

		/*
		 * System.out.println(" realtorDTO " + realtorDTO.getR_no());
		 * System.out.println(" realtorDTO " + realtorDTO.getRi_name());
		 * System.out.println(" realtorDTO " + realtorDTO.getR_phone());
		 * System.out.println(" realtorDTO " + realtorDTO.getRi_officename());
		 * System.out.println(" realtorDTO " + realtorDTO.getR_pwd());
		 * System.out.println(" realtorDTO " + realtorDTO.getRi_addr());
		 * System.out.println(" realtorDTO " + realtorDTO.getRi_detail_addr());
		 * System.out.println(" realtorDTO " + realtorDTO.getRi_realtor_num());
		 * System.out.println(" realtorDTO " + realtorDTO.getAuthority_code());
		 * System.out.println(" realtorDTO " + realtorDTO.getRi_main_phone());
		 */

		int updateRealtorCnt = this.realtorDAO.realtorUpdateRegCnt(realtorDTO);
		if (updateRealtorCnt == 0) {
			return -1;
		}
		
		int updateInfoCnt = this.realtorDAO.realtorUpdateInfoCnt(realtorDTO);
		if (updateInfoCnt == 0) {
			return -2;
		}
		
		int updateAddrCnt = this.realtorDAO.realtorUpdateAddrCnt(realtorDTO);
		if (updateAddrCnt == 0) {
			return -3;
		}
		
		int updateAuthCnt = this.realtorDAO.realtorUpdateAuthCnt(realtorDTO);
		if (updateAuthCnt == 0) {
			return -4;
		}

		
		/*
		 * System.out.println(" updateRealtorCnt >>>> " + updateRealtorCnt);
		 * System.out.println(" updateInfoCnt >>>> " + updateInfoCnt);
		 * System.out.println(" updateAddrCnt >>>> " + updateAddrCnt);
		 * System.out.println(" updateAuthCnt >>>> " + updateAuthCnt);
		 */
		return updateAuthCnt;
	}
	
	
	public int updateCheck(SellroomSearchDTO sellroomSearchDTO) {
		int CheckCnt = this.realtorDAO.updateCheck(sellroomSearchDTO);
		if(CheckCnt==0) {return -1;}
		return CheckCnt;
	}
	//----------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------------------
	
	// for.공실목록 업로드
		@Override
		public int getEmptyRoomAllCnt(RealtorProductDTO realtorProductDTO) {
			int emptyRoomAllCnt = this.realtorDAO.getEmptyRoomAllCnt(realtorProductDTO);
			return emptyRoomAllCnt;
		}
		
		//----------------------------------------------------------------------------------------------------
		@Override
		public List<Map<String, String>> getEmptyRoomList(RealtorProductDTO realtorProductDTO) {
			List<Map<String, String>> emptyRoomList = this.realtorDAO.getEmptyRoomList(realtorProductDTO);
			return emptyRoomList;
		}
		
		
		//----------------------------------------------------------------------------------------------------
		@Override
		public RealtorProductDTO getrealtorProductDTO(int sr_no) {
			RealtorProductDTO realtorProductDTO = this.realtorDAO.getrealtorProductDTO(sr_no);
			return realtorProductDTO;
		}
		
		
		//----------------------------------------------------------------------------------------------------
		@Override
		public int updateCheckOwnerCode(RealtorProductDTO realtorProductDTO) {
			int emptyRoomAllCnt = this.realtorDAO.getEmptyRoomAllCnt(realtorProductDTO);
			if(emptyRoomAllCnt==0) {return -1;}
			int CheckCnt = this.realtorDAO.updateCheckOwnerCode(realtorProductDTO);
			return CheckCnt;
		}
		
		
		//----------------------------------------------------------------------------------------------------
		@Override
		public int updateCheckRegisterCode(RealtorProductDTO realtorProductDTO) {
			int emptyRoomAllCnt = this.realtorDAO.getEmptyRoomAllCnt(realtorProductDTO);
			if(emptyRoomAllCnt==0) {return -1;}
			int RegCnt = this.realtorDAO.updateCheckRegisterCode(realtorProductDTO);
			return RegCnt;
		}	
		
		
		//----------------------------------------------------------------------------------------------------
		//=========================================================================================================================================2020.01.08_wonhyeok
		public int getRealtorSaleRoomAllCnt(RealtorSearchDTO realtorSearchDTO) {
			int realtorSaleRoomAllCnt = this.realtorDAO.getRealtorSaleRoomAllCnt(realtorSearchDTO);
			return realtorSaleRoomAllCnt;
		}
		
		public List<Map<String, String>> getRealtorSalRoomList() {
			List<Map<String, String>> realtorSaleRoomList = this.realtorDAO.getRealtorSalRoomList();

			return realtorSaleRoomList;
		}
		
		public List<Map<String,String>> getRateOfSalesList(int r_no){
			List<Map<String,String>> rateOfSalesList = this.realtorDAO.getRateOfSalesList(r_no);
			return rateOfSalesList;
		}
		
		public List<Map<String,String>> getSalesByRegionList(int r_no){
			List<Map<String,String>> salesByRegionList = this.realtorDAO.getSalesByRegionList(r_no);
			return salesByRegionList;
		}
		
		/*
		public List<Map<String,String>> getRateOfSalesList(){
			List<Map<String,String>> rateOfSalesList = this.realtorDAO.getRateOfSalesList();
			return rateOfSalesList;
		}
		*/
		
		//=========================================================================================================================================2020.01.08_wonhyeok

		public RealtorMenuInfoDTO getInfo(String r_id) {
			RealtorMenuInfoDTO realtorMenuInfoDTO = this.realtorDAO.getInfo(r_id);
			return realtorMenuInfoDTO;
		}
		
		public String getAuthority(int r_no) {
			String authority = this.realtorDAO.getAuthority(r_no);
			return authority;
		}
		
		// =============================================================================
		// $.ajax - realtorNumProc.do in proRegisterJoin2
		// =============================================================================
		public int getRealtorNumCnt(RealtorDTO realtorDTO) {
			int realtorNumCnt = this.realtorDAO.getRealtorNumCnt(realtorDTO);
			System.out.println(" realtorNumCnt  >>" + realtorNumCnt);
			return realtorNumCnt;
		}
		
		public int getBusinessNumCnt(RealtorDTO realtorDTO) {
			int businessNumCnt = this.realtorDAO.getBusinessNumCnt(realtorDTO);
			System.out.println(" realtorNumCnt  >>" + businessNumCnt);
			return businessNumCnt;
		}
		
		//------------------잊어버리셨나요?---------------------
		public String realtorIdCnt(RealtorDTO realtorDTO) {
			String realtorIdCnt = this.realtorDAO.realtorIdCnt(realtorDTO);
			return realtorIdCnt;
		}
		
		
		public String realtorPwdGet(RealtorDTO realtorDTO) {
			String realtorPwdGet = this.realtorDAO.realtorPwdGet(realtorDTO);
			return realtorPwdGet;
		}
		
		
		// =============================================================================
		// $.ajax - managementHouseProc_code2.do in managementHouse.jsp
		// =============================================================================
		public int updateCheck_codeOf2(RealtorProductDTO realtorProductDTO) {
			int Check_codeOf2 = this.realtorDAO.updateCheck_codeOf2(realtorProductDTO);
			return Check_codeOf2;
		}
		
	
}







