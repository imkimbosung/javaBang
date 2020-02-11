package com.naver.erp;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	private RentalDAO rentalDAO;
	
	public int insertrentalCompany(RentalCompanyDTO rentalCompanyDTO)
	{
		int rt_idcnt=this.rentalDAO.selectrentalCompany(rentalCompanyDTO);
		if(rt_idcnt==1) {return -1;}
		int rentalCompanycnt=this.rentalDAO.insertrentalCompany(rentalCompanyDTO);
		int rentalroutecnt=this.rentalDAO.insertrentalRoute(rentalCompanyDTO);
		return rentalCompanycnt;
	}
	
	public int getrentalCompany(RentalCompanyDTO rentalCompanyDTO)
	{
		int getIdcnt=this.rentalDAO.getIdcnt(rentalCompanyDTO);
		if(getIdcnt==0) {return -1;}
		int getPwdcnt=this.rentalDAO.getPwdcnt(rentalCompanyDTO);
		if(getPwdcnt==0) {return -2;}
		int getIdPwdcnt=this.rentalDAO.getIdPwd(rentalCompanyDTO);
		return getIdPwdcnt;
	}
	
	public RentalCompanyDTO getRt_no(RentalCompanyDTO rentalCompanyDTO)
	{
		RentalCompanyDTO rt_no=this.rentalDAO.getRt_no(rentalCompanyDTO);
		return rt_no;
	}
	

	public int insertrentalProduct(RentalProductDTO rentalProductDTO)
	{
		int insertrentalProductcnt=this.rentalDAO.insertrentalProduct(rentalProductDTO);
		int insertrentalContentcnt=this.rentalDAO.insertrentalContent(rentalProductDTO);
		int insertCodetRentalProduct=this.rentalDAO.insertCodetRentalProduct(rentalProductDTO);
		return insertrentalProductcnt;
	}
	
	public int updaterentalProduct(RentalProductDTO rentalProductDTO)
	{
		int updaterentalProductcnt=this.rentalDAO.updaterentalProduct(rentalProductDTO);
		int updaterentalContentcnt=this.rentalDAO.updaterentalContent(rentalProductDTO);
		int updateCodetRentalProduct=this.rentalDAO.updateCodetRentalProduct(rentalProductDTO);
		return updaterentalProductcnt;
	}
	
	public List<Map<String,String>> getProductList()
	{
		List<Map<String,String>> ProductList=this.rentalDAO.getProductList();
		return ProductList;
	}
	

	public List<Map<String,String>> getInsertProductList(String rt_no)
	{
		List<Map<String,String>> insertProductList=this.rentalDAO.getInsertProductList(rt_no);
		return insertProductList;
	}
	
	public RentalProductDTO upProductList(int rp_no)
	{
		RentalProductDTO upProductList=this.rentalDAO.upProductList(rp_no);
		return upProductList;
	}
	
	public List<Map<String,String>> getrentalProductList( )
	{
		//System.out.println(rentalProductSerachDTO.getRental_product_code());
		List<Map<String,String>> rentalProductList  = this.rentalDAO.getrentalProductList();
		return rentalProductList;
	}
	
	public List<Map<String,String>> getrentalProductList2(List<String> rental_product_code)
	{
		//System.out.println(rentalProductSerachDTO.getRental_product_code());
		List<Map<String,String>> rentalProductList  = this.rentalDAO.getrentalProductList2(rental_product_code);
		return rentalProductList;
	}
	
	public RentalProductDTO getrentalContent(RentalProductDTO rentalProductDTO)
	{
		RentalProductDTO rentalContent=this.rentalDAO.getrentalContent(rentalProductDTO);
		return rentalContent;
	}
	
	public int insertSubscription(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		int countcnt=this.rentalDAO.updateSubscription(rentalSubscriptionDTO);
		if(countcnt==0) {return -3;}
		int subscriptioncnt=this.rentalDAO.insertSubscription(rentalSubscriptionDTO);
		int RentalTermcnt=this.rentalDAO.insertRentalTerm(rentalSubscriptionDTO);
		if(RentalTermcnt==0) {return -2;}
		return subscriptioncnt;
	}
	
	public List<Map<String,String>> getrentalSubList(RentalProductSerachDTO rentalProductSerachDTO)
	{
		List<Map<String,String>> rentalSubList=this.rentalDAO.getrentalSubList(rentalProductSerachDTO);
		return rentalSubList;
	}
	
	public List<Map<String,String>> getrentalASList(int rt_no)
	{
		List<Map<String,String>> rentalASList=this.rentalDAO.getrentalASList(rt_no);
		return rentalASList;
	}
	
	public int rentalASCompanyProc(RentalASDTO rentalASDTO)
	{
		int rentalASCompanyCnt=this.rentalDAO.rentalASCompanyProc(rentalASDTO);
		return rentalASCompanyCnt;
	}
	
	public int updateSubJubsu(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		int Jubsucnt=this.rentalDAO.selectSubJubsu(rentalSubscriptionDTO);
		if(Jubsucnt==1) {return -1;}
		int subJubsucnt=this.rentalDAO.updateSubJubsu(rentalSubscriptionDTO);
		
		return subJubsucnt;
	}
	
	public List<Map<String,String>> getBuyerRentalSubList(int b_no)
	{
		List<Map<String,String>> buyerRentalSubList=this.rentalDAO.getBuyerRentalSubList(b_no);
		return buyerRentalSubList;
	}
	
	public List<Map<String,String>> getBuyerrentalASList(int b_no)
	{
		List<Map<String,String>> buyerrentalASList=this.rentalDAO.getBuyerrentalASList(b_no);
		return buyerrentalASList;
	}
	
	public int getBuyerAScnt(RentalASDTO rentalASDTO)
	{
		int AScnt=this.rentalDAO.selectAS(rentalASDTO);
		if(AScnt==1) {return -1;}
		int getBuyerAScnt=this.rentalDAO.getBuyerAScnt(rentalASDTO);
		
		return getBuyerAScnt;
	}
	
	public int rentalProductListCnt(RentalProductSerachDTO rentalProductSerachDTO)
	{
		int rentalProductListCnt=this.rentalDAO.rentalProductListCnt(rentalProductSerachDTO);
		return rentalProductListCnt;
	}
	

	public RentalASDTO getrentalASContent(int ru_no)
	{
		RentalASDTO rentalASContent  = this.rentalDAO.getrentalASContent(ru_no);
		return rentalASContent;
	}
	
	public List<Map<String, String>> getaircnt(RentalChartsDTO rentalChartsDTO)
	{
		List<Map<String, String>> getaircnt  = this.rentalDAO.getaircnt(rentalChartsDTO);
		return getaircnt;
	}
	
	

	public List<Map<String,String>> getproductList(RentalChartsDTO rentalChartsDTO)
	{
		List<Map<String,String>> productList=this.rentalDAO.getproductList(rentalChartsDTO);
		return productList;
	}
	
	public String rentalId(RentalCompanyDTO rentalCompanyDTO)
	{
		String rentalId = this.rentalDAO.rentalId(rentalCompanyDTO);
		return rentalId;
	}
	
	public String rentalPwd(RentalCompanyDTO rentalCompanyDTO)
	{
		String rentalPwd = this.rentalDAO.rentalPwd(rentalCompanyDTO);
		return rentalPwd;
	}
	
	public int getBuyerReviewcnt(RentalReviewDTO rentalReviewDTO)
	{
		int getBuyerReviewcnt = this.rentalDAO.getBuyerReviewcnt(rentalReviewDTO);
		return getBuyerReviewcnt;
	}
	
	public int getBuyerReReviewcnt(RentalReviewDTO rentalReviewDTO)
	{
		int getBuyerReReviewcnt = this.rentalDAO.getBuyerReReviewcnt(rentalReviewDTO);
		return getBuyerReReviewcnt;
	}


	public List<Map<String,String>> getrentalTerm()
	{
		List<Map<String,String>> rentalTerm = this.rentalDAO.getrentalTerm();
		return rentalTerm;
	}

	
	

	public List<Map<String, String>> getProduct()
	{
		List<Map<String,String>> product = this.rentalDAO.getProduct();
		return product;
	}
	

	public int insertImageName(RentalProductDTO rentalProductDTO)
	{
		int saveImageCnt = this.rentalDAO.insertImageName(rentalProductDTO);
		return saveImageCnt;
	}
	

	public List<Map<String,String>> getrentalImg(int rp_no)
	{
		List<Map<String,String>> rentalImg = this.rentalDAO.getrentalImg(rp_no);
		return rentalImg;
	}
}
