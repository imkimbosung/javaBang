package com.naver.erp;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAOImpl implements SellerDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// =====================================================================================
	public int insertSellRoom(SellerRoomDTO sellerRoomDTO) {
		int sellRoomRegCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoom", sellerRoomDTO);

		return sellRoomRegCnt;
	}

	// select
	public int seletSr_no(SellerRoomDTO sellerRoomDTO) {
		int selectSr_noCnt = sqlSession.selectOne("com.naver.erp.SellerDAO.seletSr_no", sellerRoomDTO);

		return selectSr_noCnt;
	}

	// TYPE_SELL_ROOM
	public int insertTypeSellRoom(SellerRoomDTO sellerRoomDTO) {
		int typeSellRoomCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertTypeSellRoom", sellerRoomDTO);

		return typeSellRoomCnt;
	}

	// SELL_ROOM_PET_AVAILABILITY
	public int insertSellRoomPetAvail(SellerRoomDTO sellerRoomDTO) {
		int sellRoomPetAvailCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomPetAvail", sellerRoomDTO);

		return sellRoomPetAvailCnt;
	}

	// SELL_ROOM_PARKING_AVAILABILITY
	public int insertSellRoomParkAvail(SellerRoomDTO sellerRoomDTO) {
		int sellRoomParkAvailCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomParkAvail", sellerRoomDTO);

		return sellRoomParkAvailCnt;
	}

	// SELL_ROOM_HC_TYPE
	public int insertSellRoomHCTypeAvail(SellerRoomDTO sellerRoomDTO) {
		int sellRoomHCTypeAvailCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomHCTypeAvail",
				sellerRoomDTO);

		return sellRoomHCTypeAvailCnt;
	}

	// SELL_ROOM_MANAGE_FEE
	public int insertSellRoomManageFeeYN(SellerRoomDTO sellerRoomDTO) {
		int sellRoomManageFeeYNCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomManageFeeYN",
				sellerRoomDTO);

		return sellRoomManageFeeYNCnt;
	}

	// SELL_ROOM_ELV
	public int insertSellRoomElvYN(SellerRoomDTO sellerRoomDTO) {
		int sellRoomElvYNCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomElvYN", sellerRoomDTO);

		return sellRoomElvYNCnt;
	}

	// SELL_ROOM_LIVE_IN_TYPE
	public int insertSellRoomLiveInType(SellerRoomDTO sellerRoomDTO) {
		int sellRoomLiveInTypeCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomLiveInType",
				sellerRoomDTO);

		return sellRoomLiveInTypeCnt;
	}

	// SELL_ROOM_OPTION_TYPE
	public int insertSellRoomOptionType(SellerRoomDTO sellerRoomDTO) {
		int sellRoomOptionTypeCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomOptionType",
				sellerRoomDTO);

		return sellRoomOptionTypeCnt;
	}

	// sellRoomSellTypeRegCnt
	public int insertSellRoomSellType(SellerRoomDTO sellerRoomDTO) {
		int sellRoomSellTypeCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomSellType", sellerRoomDTO);

		return sellRoomSellTypeCnt;
	}

	public int insertSellRoomOptionSelect(SellerRoomDTO sellerRoomDTO) {
		int sellRoomOptionSelectCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomOptionSelect",
				sellerRoomDTO);

		return sellRoomOptionSelectCnt;
	}

	// =====================================================================================
	// =====================================================================================
	public int insertSellRoomAddr(SellerRoomDTO sellerRoomDTO) {
		int SellRoomAddrCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSellRoomAddr", sellerRoomDTO);

		return SellRoomAddrCnt;
	}

	// =====================================================================================
	// ONE_ROOM_PRICE, JEONSE_PRICE, SALE_PRICE �뜲�씠�꽣 ���옣�쓣 �쐞�븳 �냽�꽦蹂��닔 �꽑�뼵
	public int insertSalePrice(SellerRoomDTO sellerRoomDTO) {
		int SalePriceCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertSalePrice", sellerRoomDTO);
		// ownerCheckCode insert
		this.sqlSession.insert("com.naver.erp.SellerDAO.insertCheckCode", sellerRoomDTO);

		return SalePriceCnt;
	}

	public int insertJeonsePrice(SellerRoomDTO sellerRoomDTO) {
		int JeonsePriceCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertJeonsePrice", sellerRoomDTO);
		// ownerCheckCode insert
		this.sqlSession.insert("com.naver.erp.SellerDAO.insertCheckCode", sellerRoomDTO);

		return JeonsePriceCnt;
	}

	public int insertOneRoomPrice(SellerRoomDTO sellerRoomDTO) {
		int OneRoomPriceCnt = sqlSession.insert("com.naver.erp.SellerDAO.insertOneRoomPrice", sellerRoomDTO);
		// ownerCheckCode insert
		this.sqlSession.insert("com.naver.erp.SellerDAO.insertCheckCode", sellerRoomDTO);

		return OneRoomPriceCnt;
	}

	// =====================================================================================
	// =====================================================================================
	public int insertCheck(SellerRoomDTO sellerRoomDTO) {
//		System.out.println("<SellerDAOimpl> 占쎌깈�빊占�  >> "+ sellerRoomDTO.getType_room());
		int checkRoomCnt = this.sqlSession.insert("com.naver.erp.SellerDAO.insertCheck", sellerRoomDTO);
		return checkRoomCnt;
	}

	// =====================================================================================
	// =====================================================================================
	@Override
	public int getEmptyRoomAllCnt(SellerRoomSearchDTO sellerRoomSearchDTO) {
		int emptyRoomAllCnt = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getEmptyRoomAllCnt",
				sellerRoomSearchDTO);

		return emptyRoomAllCnt;
	}

	@Override
	public List<Map<String, String>> getEmptyRoomList(SellerRoomSearchDTO sellerRoomSearchDTO) {
		List<Map<String, String>> emptyRoomList = this.sqlSession.selectList("com.naver.erp.SellerDAO.getEmptyRoomList",
				sellerRoomSearchDTO);

		return emptyRoomList;
	}

	@Override
	public SellerInfoDTO getSellerInfoDTO(int sr_no) {
		SellerInfoDTO sellerInfoDTO = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getSellerInfoDTO", sr_no);

		return sellerInfoDTO;
	}

	@Override
	public int getEmptyListCnt(SellerInfoDTO sellerInfoDTO) {
		int emptyListCnt = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getEmptyListCnt", sellerInfoDTO);

		return emptyListCnt;
	}

	@Override
	public int getPwdCnt(SellerInfoDTO sellerInfoDTO) {
		int pwdCnt = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getPwdCnt", sellerInfoDTO);
		return pwdCnt;
	}

	@Override
	public int updateList(SellerInfoDTO sellerInfoDTO) {
		int updateRoomTypeCnt = this.sqlSession.update("com.naver.erp.SellerDAO.updateRoomType", sellerInfoDTO);
		int updateOptionTypeCnt = this.sqlSession.update("com.naver.erp.SellerDAO.updateOptionType", sellerInfoDTO);

		// delete option select
		this.sqlSession.delete("com.naver.erp.SellerDAO.deleteOptionSelected", sellerInfoDTO);

		// insert option select
		this.sqlSession.insert("com.naver.erp.SellerDAO.insertOptionSelected", sellerInfoDTO);

		int updateCnt = updateRoomTypeCnt + updateOptionTypeCnt;
		return updateCnt;
	}

	@Override
	public int deleteList(SellerInfoDTO sellerInfoDTO) {
		int deleteListCnt = this.sqlSession.delete("com.naver.erp.SellerDAO.deleteList", sellerInfoDTO);

		return deleteListCnt;
	}

	@Override
	public int getS_no(String s_id) {
		int s_no = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getS_no", s_id);
		return s_no;
	}

	public String getS_name(SellerDTO sellerDTO) {
		String s_name = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getS_name", sellerDTO);
		return s_name;
	}

	@Override
	public int insertImageName(SellerRoomDTO sellerRoomDTO) {
		int saveImageCnt = this.sqlSession.insert("com.naver.erp.SellerDAO.insertImageName", sellerRoomDTO);

		return saveImageCnt;
	}

	@Override
	public int getEmptyUpdateListCnt(SellerInfoDTO sellerInfoDTO) {
		int EmptyUpdateListCnt = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getEmptyUpdateListCnt",
				sellerInfoDTO);

		return EmptyUpdateListCnt;
	}

	// 마지막 판매완료 코딩
	@Override
	public int updateConfirmCode(SellerInfoDTO sellerInfoDTO) {
		int updateConfirmCodeCnt = this.sqlSession.update("com.naver.erp.SellerDAO.updateConfirmCode", sellerInfoDTO);

		this.sqlSession.update("com.naver.erp.SellerDAO.updateConfirmDate", sellerInfoDTO);

		return updateConfirmCodeCnt;
	}

	public List<Map<String, String>> getRoomTypeCode(int sr_no) {
		List<Map<String, String>> roomTypeCode = this.sqlSession.selectList("com.naver.erp.SellerDAO.getRoomTypeCode",
				sr_no);

		return roomTypeCode;
	}

	public List<Map<String, String>> getOptionTypeCode(int sr_no) {
		List<Map<String, String>> optionTypeCode = this.sqlSession
				.selectList("com.naver.erp.SellerDAO.getOptionTypeCode", sr_no);

		return optionTypeCode;
	}

	public List<Map<String, String>> getOptionSelectCode(int sr_no) {
		List<Map<String, String>> optionSelectCode = this.sqlSession
				.selectList("com.naver.erp.SellerDAO.getOptionSelectCode", sr_no);

		return optionSelectCode;
	}

	public String getS_name(SellerRoomSearchDTO sellerRoomSearchDTO) {
		String s_name = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getS_name1", sellerRoomSearchDTO);
		return s_name;
	}

	public List<Map<String, String>> getRoomTypeCode() {
		List<Map<String, String>> roomTypeCode = this.sqlSession.selectList("com.naver.erp.SellerDAO.getRoomTypeCode1");

		return roomTypeCode;
	}

	public List<Map<String, String>> getSellTypeCode() {
		List<Map<String, String>> sellTypeCode = this.sqlSession.selectList("com.naver.erp.SellerDAO.getSellTypeCode");

		return sellTypeCode;
	}

	public List<Map<String, String>> getOptionTypeCode() {
		List<Map<String, String>> optionTypeCode = this.sqlSession.selectList("com.naver.erp.SellerDAO.getOptionType");

		return optionTypeCode;
	}

	public List<Map<String, String>> getOptionSelectCode() {
		List<Map<String, String>> optionSelectCode = this.sqlSession
				.selectList("com.naver.erp.SellerDAO.getOptionSelectCode1");

		return optionSelectCode;
	}

	public List<Map<String, String>> getPetAvailableCode() {
		List<Map<String, String>> petAvailableCode = this.sqlSession
				.selectList("com.naver.erp.SellerDAO.getPetAvailableCode");

		return petAvailableCode;
	}

	public List<Map<String, String>> getElvCode() {
		List<Map<String, String>> codeElv = this.sqlSession.selectList("com.naver.erp.SellerDAO.getElvCode");

		return codeElv;
	}

	public List<Map<String, String>> getHcTypeCode() {
		List<Map<String, String>> codeHcType = this.sqlSession.selectList("com.naver.erp.SellerDAO.getHcTypeCode");

		return codeHcType;
	}

	public List<Map<String, String>> getLiveInTypeCode() {
		List<Map<String, String>> codeLiveInType = this.sqlSession
				.selectList("com.naver.erp.SellerDAO.getLiveInTypeCode");

		return codeLiveInType;
	}

	public List<Map<String, String>> getManageFeeCode() {
		List<Map<String, String>> codeManageFee = this.sqlSession
				.selectList("com.naver.erp.SellerDAO.getManageFeeCode");

		return codeManageFee;
	}

	public List<Map<String, String>> getParkingAvailableCode() {
		List<Map<String, String>> codeParkingAvailable = this.sqlSession
				.selectList("com.naver.erp.SellerDAO.getParkingAvailableCode");

		return codeParkingAvailable;
	}

	public String getSellerId(SellerSignupDTO sellerSignupDTO) {
		String sellerId = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getSellerId", sellerSignupDTO);

		return sellerId;
	}

	public String getSellerPwdCnt(SellerSignupDTO sellerSignupDTO) {
		String sellerPwdCnt = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getSellerPwdCnt", sellerSignupDTO);

		return sellerPwdCnt;
	}

	public SellerDTO getSellerDTO(String s_id) {
		SellerDTO sellerDTO = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getSellerDTO", s_id);

		return sellerDTO;
	}

	public int getSellerPwdCheck(SellerDTO sellerDTO) {
		int sellerPwdCheck = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getSellerPwdCheck", sellerDTO);

		return sellerPwdCheck;

	}

	public int updateSeller(SellerDTO sellerDTO) {
		int sellerUpDelCnt = this.sqlSession.update("com.naver.erp.SellerDAO.updateSeller", sellerDTO);

		return sellerUpDelCnt;
	}

	public int getSellerCnt(SellerDTO sellerDTO) {
		int sellerCnt = this.sqlSession.selectOne("com.naver.erp.SellerDAO.getSellerCnt", sellerDTO);

		return sellerCnt;
	}

	public int deleteSeller(SellerDTO sellerDTO) {
		int deleteSellerCnt = this.sqlSession.delete("com.naver.erp.SellerDAO.deleteSeller", sellerDTO);

		return deleteSellerCnt;
	}

	public List<Map<String, String>> topRealtorList() {
		List<Map<String, String>> topRealtorList = this.sqlSession.selectList("com.naver.erp.SellerDAO.topRealtorList");
		return topRealtorList;
	}
	
	
	public List<Map<String, String>> getAverageSalePrice(SellerRoomDTO sellerRoomDTO){
		List<Map<String, String>> averageSalePrice =  this.sqlSession.selectList("com.naver.erp.SellerDAO.getAverageSalePrice", sellerRoomDTO);
		return averageSalePrice;
	}
	
	public List<Map<String, String>> getAverageJeonsePrice(SellerRoomDTO sellerRoomDTO){
		List<Map<String, String>> averageJeonsePrice =  this.sqlSession.selectList("com.naver.erp.SellerDAO.getAverageJeonsePrice", sellerRoomDTO);
		return averageJeonsePrice;
	}
	
	public List<Map<String, String>> getAverageOneRoomPrice(SellerRoomDTO sellerRoomDTO){
		List<Map<String, String>> averageOneRoomPrice =  this.sqlSession.selectList("com.naver.erp.SellerDAO.getAverageOneRoomPrice", sellerRoomDTO);
		return averageOneRoomPrice;
	}

}