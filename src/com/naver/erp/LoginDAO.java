package com.naver.erp;
import java.util.Map;

public interface LoginDAO {
	
	// [로그인 아이디, 암호 존재  개수] 검색 메소드 선언
	int getBuyerCnt(Map<String, String> buyer_id_pwd);
	
	int getSellerCnt(Map<String, String> seller_id_pwd);
	
	int getRealtorCnt(Map<String, String> realtor_id_pwd); 
	
	// master 로그인 및 권한 가져오기
	int getMasterCnt(Map<String, String> master_id_pwd);
	String getMasterAuth(Map<String, String> master_id_pwd);
	
	int getIdCnt(BuyerSignupDTO buyerSignupDTO);
	int getSellerIdCnt(SellerSignupDTO sellerSignupDTO);
	
	
	int insertBuyerInfo(BuyerSignupDTO buyerSignupDTO);
	int insertSellerInfo(SellerSignupDTO sellerSignupDTO);
	
	int insertRoute(BuyerSignupDTO buyerSignupDTO);
	
	int getSellerRouteCnt(SellerSignupDTO sellerSignupDTO);
}
