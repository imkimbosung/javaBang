package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerDAO sellerDAO;

	public int insertSellRoom(SellerRoomDTO sellerRoomDTO) {

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
//	"wonhyeok's coding"
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		// Sell_Room 데이터 저장.
		int sellRoomRegCnt = this.sellerDAO.insertSellRoom(sellerRoomDTO);

		// select
		int sr_no = this.sellerDAO.seletSr_no(sellerRoomDTO);
		/*
		 * if(sr_no != 2 ) { return -1; }
		 */
		sellerRoomDTO.setSr_no(sr_no);

		// TYPE_SELL_ROOM 데이터 저장.
		int typeSellRoomRegCnt = this.sellerDAO.insertTypeSellRoom(sellerRoomDTO);
		// SELL_ROOM_PET_AVAILABILITY 데이터 저장.
		int sellRoomPetAvailRegCnt = this.sellerDAO.insertSellRoomPetAvail(sellerRoomDTO);
		// SELL_ROOM_PARKING_AVAILABILITY 데이터 저장.
		int sellRoomParkAvailRegCnt = this.sellerDAO.insertSellRoomParkAvail(sellerRoomDTO);
		// SELL_ROOM_HC_TYPE 데이터 저장.
		int sellRoomHCTypeRegCnt = this.sellerDAO.insertSellRoomHCTypeAvail(sellerRoomDTO);
		// SELL_ROOM_MANAGE_FEE 데이터 저장.
		int sellRoomManageFeeRegCnt = this.sellerDAO.insertSellRoomManageFeeYN(sellerRoomDTO);
		// SELL_ROOM_ELV 데이터 저장.
		int sellRoomElvRegCnt = this.sellerDAO.insertSellRoomElvYN(sellerRoomDTO);
		// SELL_ROOM_LIVE_IN_TYPE 데이터 저장.
		int sellRoomLiveInTypeRegCnt = this.sellerDAO.insertSellRoomLiveInType(sellerRoomDTO);
		// SELL_ROOM_OPTION_TYPE 데이터 저장.
		int sellRoomOptionTypeRegCnt = this.sellerDAO.insertSellRoomOptionType(sellerRoomDTO);
		// SELL_ROOM_SELL_TYPE 데이터 저장.
		int sellRoomSellTypeRegCnt = this.sellerDAO.insertSellRoomSellType(sellerRoomDTO);
		// SELL_ROOM_OPTION_SELECT 데이터 저장.
		int sellRoomOptionSelectRegCnt = this.sellerDAO.insertSellRoomOptionSelect(sellerRoomDTO);

		// SELL_ROOM_ADDR 데이터 저장하기 위한 속성변수 추가
		int sellRoomAddrRegCnt = this.sellerDAO.insertSellRoomAddr(sellerRoomDTO);

		/*
		 * int sellRoomDetailAddrRegCnt =
		 * this.sellerDAO.insertSellRoomDetailAddr(sellerRoomDTO); int
		 * sellRoomFloorRegCnt = this.sellerDAO.insertSellRoomFloor(sellerRoomDTO); int
		 * sellRoomZipCodeRegCnt = this.sellerDAO.insertSellRoomZipCode(sellerRoomDTO);
		 */

		// ONE_ROOM_PRICE, JEONSE_PRICE, SALE_PRICE 데이터 저장을 위한 속성변수 선언
		if (sellerRoomDTO.getPrice_sale() != null) {
			int salePriceRegCnt = this.sellerDAO.insertSalePrice(sellerRoomDTO);
		}

		if (sellerRoomDTO.getPrice_jeonse() != null) {
			int jeonsePriceRegCnt = this.sellerDAO.insertJeonsePrice(sellerRoomDTO);
		}
		if (sellerRoomDTO.getDeposit() != null && sellerRoomDTO.getMonthly_rent() != null) {
			int oneRoomPriceRegCnt = this.sellerDAO.insertOneRoomPrice(sellerRoomDTO);
		}

		return sellRoomRegCnt;
	}

	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// "소연's coding"
	// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	public int insertCheck(SellerRoomDTO sellerRoomDTO) {
//		System.out.println("<SellerServiceImpl> �샇異�");
		int checkRoomCnt = this.sellerDAO.insertCheck(sellerRoomDTO);
		return checkRoomCnt;
	}

	@Override
	public int getEmptyRoomAllCnt(SellerRoomSearchDTO sellerRoomSearchDTO) {
		int emptyRoomAllCnt = this.sellerDAO.getEmptyRoomAllCnt(sellerRoomSearchDTO);
		return emptyRoomAllCnt;
	}

	@Override
	public List<Map<String, String>> getEmptyRoomList(SellerRoomSearchDTO sellerRoomSearchDTO) {
		List<Map<String, String>> emptyRoomList = this.sellerDAO.getEmptyRoomList(sellerRoomSearchDTO);
		return emptyRoomList;
	}

	@Override
	public SellerInfoDTO getSellerInfoDTO(int sr_no) {

		SellerInfoDTO sellerInfoDTO = this.sellerDAO.getSellerInfoDTO(sr_no);

		return sellerInfoDTO;
	}

	@Override
	public int updateEmptyList(SellerInfoDTO sellerInfoDTO) {

		int emptyListCnt = this.sellerDAO.getEmptyListCnt(sellerInfoDTO);
		if (emptyListCnt == 0) {
			return -1;
		}

		int pwdCnt = this.sellerDAO.getPwdCnt(sellerInfoDTO);
		if (pwdCnt == 0) {
			return -2;
		}

		int updateCnt = this.sellerDAO.updateList(sellerInfoDTO);

		return updateCnt;
	}

	@Override
	public int deleteEmptyList(SellerInfoDTO sellerInfoDTO) {
		int emptyListCnt = this.sellerDAO.getEmptyListCnt(sellerInfoDTO);
		if (emptyListCnt == 0) {
			return -1;
		}

		int pwdCnt = this.sellerDAO.getPwdCnt(sellerInfoDTO);
		if (pwdCnt == 0) {
			return -2;
		}

		int deleteCnt = this.sellerDAO.deleteList(sellerInfoDTO);
		return deleteCnt;
	}

	@Override
	public int getS_no(String s_id) {
		int s_no = this.sellerDAO.getS_no(s_id);
		return s_no;
	}

	// 로그인 후 홈화면에 아이디가 뜨는것을 이름을 뜨도록 변경.
	public String getS_name(SellerDTO sellerDTO) {
		String s_name = this.sellerDAO.getS_name(sellerDTO);

		return s_name;
	}

	@Override
	public int insertImageName(SellerRoomDTO sellerRoomDTO) {
		int saveImageCnt = this.sellerDAO.insertImageName(sellerRoomDTO);

		return saveImageCnt;
	}

	@Override
	public int updateConfirmCode(SellerInfoDTO sellerInfoDTO) {

		int emptyUpdateListCnt = this.sellerDAO.getEmptyUpdateListCnt(sellerInfoDTO);
		if (emptyUpdateListCnt == 0) {
			return -1;
		}

		int updateConfirmCodeCnt = this.sellerDAO.updateConfirmCode(sellerInfoDTO);

		return updateConfirmCodeCnt;
	}

	public List<Map<String, String>> getSellTypeCode() {
		List<Map<String, String>> sellTypeCode = this.sellerDAO.getSellTypeCode();

		return sellTypeCode;
	}

	public List<Map<String, String>> getOptionTypeCode() {
		List<Map<String, String>> optionTypeCode = this.sellerDAO.getOptionTypeCode();

		return optionTypeCode;
	}

	public List<Map<String, String>> getRoomTypeCode() {
		List<Map<String, String>> roomTypeCode = this.sellerDAO.getRoomTypeCode();

		return roomTypeCode;
	}

//	ver.emptyUpdelForm---------------------------------------------------------------------
	public List<Map<String, String>> getRoomTypeCode(int sr_no) {
		List<Map<String, String>> roomTypeCode = this.sellerDAO.getRoomTypeCode(sr_no);

		return roomTypeCode;
	}

	public List<Map<String, String>> getOptionTypeCode(int sr_no) {
		List<Map<String, String>> optionTypeCode = this.sellerDAO.getOptionTypeCode(sr_no);

		return optionTypeCode;
	}

	public List<Map<String, String>> getOptionSelectCode(int sr_no) {
		List<Map<String, String>> optionSelectCode = this.sellerDAO.getOptionSelectCode(sr_no);

		return optionSelectCode;
	}
//-------------------------------------------------------------------------------------------

	public String getS_name(SellerRoomSearchDTO sellerRoomSearchDTO) {
		String s_name = this.sellerDAO.getS_name(sellerRoomSearchDTO);
		return s_name;
	}

	public List<Map<String, String>> getOptionSelectCode() {
		List<Map<String, String>> optionSelectCode = this.sellerDAO.getOptionSelectCode();

		return optionSelectCode;
	}

	public List<Map<String, String>> getPetAvailableCode() {
		List<Map<String, String>> petAvailableCode = this.sellerDAO.getPetAvailableCode();

		return petAvailableCode;
	}

	public List<Map<String, String>> getElvCode() {
		List<Map<String, String>> codeElv = this.sellerDAO.getElvCode();

		return codeElv;
	}

	public List<Map<String, String>> getHcTypeCode() {
		List<Map<String, String>> codeHcType = this.sellerDAO.getHcTypeCode();

		return codeHcType;
	}

	public List<Map<String, String>> getLiveInTypeCode() {
		List<Map<String, String>> codeLiveInType = this.sellerDAO.getLiveInTypeCode();

		return codeLiveInType;
	}

	public List<Map<String, String>> getManageFeeCode() {
		List<Map<String, String>> codeManageFee = this.sellerDAO.getManageFeeCode();

		return codeManageFee;
	}

	public List<Map<String, String>> getParkingAvailableCode() {
		List<Map<String, String>> codeParkingAvailable = this.sellerDAO.getParkingAvailableCode();

		return codeParkingAvailable;
	}

	public String getSellerId(SellerSignupDTO sellerSignupDTO) {
		String sellerId = this.sellerDAO.getSellerId(sellerSignupDTO);

		return sellerId;
	}

	public String getSellerPwdCnt(SellerSignupDTO sellerSignupDTO) {
		String sellerPwdCnt = this.sellerDAO.getSellerPwdCnt(sellerSignupDTO);

		return sellerPwdCnt;
	}

	public SellerDTO getSellerDTO(String s_id) {
		SellerDTO sellerDTO = this.sellerDAO.getSellerDTO(s_id);

		return sellerDTO;
	}

	public int getSellerPwdCheck(SellerDTO sellerDTO) {
		int sellerPwdCheck = this.sellerDAO.getSellerPwdCheck(sellerDTO);
		if (sellerPwdCheck == 0) {

			return -2;
		}

		return sellerPwdCheck;
	}

	public int updateSeller(SellerDTO sellerDTO) {
		int sellerUpDelCnt = this.sellerDAO.updateSeller(sellerDTO);
		if (sellerUpDelCnt == 0) {
			return -1;
		}

		return sellerUpDelCnt;
	}

	public int deleteSeller(SellerDTO sellerDTO) {
		int sellerCnt = this.sellerDAO.getSellerCnt(sellerDTO);
		if (sellerCnt == 0) {
			return -1;
		}

		int pwdCnt = this.sellerDAO.getSellerPwdCheck(sellerDTO);
		if (pwdCnt == 0) {
			return -2;
		}

		int deleteCnt = this.sellerDAO.deleteSeller(sellerDTO);
		return deleteCnt;
	}

	public List<Map<String, String>> topRealtorList() {
		List<Map<String, String>> topRealtorList = this.sellerDAO.topRealtorList();
		return topRealtorList;
	}

	
	
	
	public List<Map<String, String>> getAverageSalePrice(SellerRoomDTO sellerRoomDTO){
		List<Map<String, String>> averageSalePrice = this.sellerDAO.getAverageSalePrice(sellerRoomDTO);         
		return averageSalePrice;
	}
	
	public List<Map<String, String>> getAverageJeonsePrice(SellerRoomDTO sellerRoomDTO){
		List<Map<String, String>> averageJeonsePrice = this.sellerDAO.getAverageJeonsePrice(sellerRoomDTO);       		
		return averageJeonsePrice;
	}
	
	public List<Map<String, String>> getAverageOneRoomPrice(SellerRoomDTO sellerRoomDTO){
		List<Map<String, String>> averageOneRoomPrice = this.sellerDAO.getAverageOneRoomPrice(sellerRoomDTO);       		
		return averageOneRoomPrice;
	}
}
