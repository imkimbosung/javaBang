package com.naver.erp;

import java.util.*;

import javax.servlet.http.HttpSession;

public interface RentalService {

	
	int insertrentalCompany(RentalCompanyDTO rentalCompanyDTO);
	
	int getrentalCompany(RentalCompanyDTO rentalCompanyDTO);
	
	
	RentalCompanyDTO getRt_no(RentalCompanyDTO rentalCompanyDTO);
	
	int insertrentalProduct(RentalProductDTO rentalProductDTO);
	int updaterentalProduct(RentalProductDTO rentalProductDTO);
	
	List<Map<String,String>> getProductList();
	
	List<Map<String,String>> getInsertProductList(String rt_no);
	
	RentalProductDTO upProductList(int rp_no);
	List<Map<String,String>> getrentalProductList2(List<String> rental_product_code);
	List<Map<String,String>> getrentalProductList( );
	
	RentalProductDTO getrentalContent(RentalProductDTO rentalProductDTO);
	
	int insertSubscription(RentalSubscriptionDTO rentalSubscriptionDTO);
	
	int updateSubJubsu(RentalSubscriptionDTO rentalSubscriptionDTO);
	
	List<Map<String,String>> getrentalSubList(RentalProductSerachDTO rentalProductSerachDTO);
	
	List<Map<String,String>> getrentalASList(int rt_no);

	int rentalASCompanyProc(RentalASDTO rentalASDTO);
	
	List<Map<String,String>> getBuyerRentalSubList(int b_no);
	
	List<Map<String,String>> getBuyerrentalASList(int b_no);
	
	int getBuyerAScnt(RentalASDTO rentalASDTO);
	int rentalProductListCnt(RentalProductSerachDTO rentalProductSerachDTO);
	
	RentalASDTO getrentalASContent(int ru_no);
	
	List<Map<String, String>> getaircnt(RentalChartsDTO rentalChartsDTO);
	
	
	List<Map<String,String>> getproductList(RentalChartsDTO rentalChartsDTO);
	
	String rentalId(RentalCompanyDTO rentalCompanyDTO);
	String rentalPwd(RentalCompanyDTO rentalCompanyDTO);
	
	int getBuyerReviewcnt(RentalReviewDTO rentalReviewDTO);
	int getBuyerReReviewcnt(RentalReviewDTO rentalReviewDTO);
	

	List<Map<String,String>> getrentalTerm();

	int insertImageName(RentalProductDTO rentalProductDTO);
	
	List<Map<String, String>> getProduct();
	List<Map<String,String>> getrentalImg(int rp_no);
}
