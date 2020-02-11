package com.naver.erp;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RentalDAOImpl implements RentalDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	public int selectrentalCompany(RentalCompanyDTO rentalCompanyDTO)
	{
		//System.out.println("dao호출");
		int rentalCompanycnt=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.selectrentalCompany"
				,rentalCompanyDTO
				);
		return rentalCompanycnt;
	}
	
	public int insertrentalRoute(RentalCompanyDTO rentalCompanyDTO)
	{
	//	System.out.println("dao호출");
		int rentalCompanycnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertrentalRoute"
				,rentalCompanyDTO
				);
		return rentalCompanycnt;
	}
	
	public int insertrentalCompany(RentalCompanyDTO rentalCompanyDTO)
	{
	//	System.out.println("dao호출");
		int rentalCompanycnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertrentalCompany"
				,rentalCompanyDTO
				);
		return rentalCompanycnt;
	}
	
	public int getIdcnt(RentalCompanyDTO rentalCompanyDTO)
	{
		//System.out.println("dao호출");
		int getIdcnt=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.getIdcnt"
				,rentalCompanyDTO
				);
		return getIdcnt;
	}
	
	public int getPwdcnt(RentalCompanyDTO rentalCompanyDTO) 
	{
		//System.out.println("dao호출");
		int getPwdcnt=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.getPwdcnt"
				,rentalCompanyDTO
				);
		return getPwdcnt;
	}
	
	public int getIdPwd(RentalCompanyDTO rentalCompanyDTO)
	{
		//System.out.println("dao호출");
		int getIdPwdcnt=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.getIdPwd"
				,rentalCompanyDTO
				);
		return getIdPwdcnt;
	}
	
	public RentalCompanyDTO getRt_no(RentalCompanyDTO rentalCompanyDTO)
	{
		//System.out.println("dao호출");
		RentalCompanyDTO rt_no=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.getRt_no"
				,rentalCompanyDTO
				);
		return rt_no;
	}
	
	public int insertrentalProduct(RentalProductDTO rentalProductDTO)
	{
		//System.out.println("dao호출");
		int insertrentalProductcnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertrentalProduct"
				,rentalProductDTO
				);
		return insertrentalProductcnt;
	}
	
	public int insertrentalContent(RentalProductDTO rentalProductDTO)
	{
		//System.out.println("dao호출");
		int insertrentalContentcnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertrentalContent"
				,rentalProductDTO
				);
		return insertrentalContentcnt;
	}
	
	public int insertCodetRentalProduct(RentalProductDTO rentalProductDTO)
	{
		//System.out.println("dao호출");
		int insertrentalProductcnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertCodetRentalProduct"
				,rentalProductDTO
				);
		return insertrentalProductcnt;
	}
	
	public int updaterentalProduct(RentalProductDTO rentalProductDTO)
	{
		//System.out.println("dao호출");
		int updaterentalProductcnt=this.sqlSession.update(
				"com.naver.erp.RentalDAO.updaterentalProduct"
				,rentalProductDTO
				);
		return updaterentalProductcnt;
	}
	public int updateCodetRentalProduct(RentalProductDTO rentalProductDTO)
	{
		//System.out.println("dao호출");
		int updaterentalProductcnt=this.sqlSession.update(
				"com.naver.erp.RentalDAO.updateCodetRentalProduct"
				,rentalProductDTO
				);
		return updaterentalProductcnt;
	}
	
	public int updaterentalContent(RentalProductDTO rentalProductDTO)
	{
		//System.out.println("dao호출");
		int updaterentalContentcnt=this.sqlSession.update(
				"com.naver.erp.RentalDAO.updaterentalContent"
				,rentalProductDTO
				);
		return updaterentalContentcnt;
	}
	
	public List<Map<String,String>> getProductList()
	{
		//System.out.println("dao호출");
		List<Map<String,String>> ProductList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getProductList"
				);
		return ProductList;
	}
	
	public List<Map<String,String>> getInsertProductList(String rt_no)
	{
		//System.out.println("dao호출");
		List<Map<String,String>> insertProductList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getInsertProductList"
				,rt_no
				);
		return insertProductList;
	}
	
	public RentalProductDTO upProductList(int rp_no)
	{
		//System.out.println("dao호출");
		RentalProductDTO upProductList=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.upProductList"
				,rp_no
				);
		return upProductList;
	}
	
	public List<Map<String,String>> getrentalProductList( )
	{
		//System.out.println("dao호출");
		//System.out.println(rentalProductSerachDTO.getRental_product_code());
		List<Map<String,String>> rentalProductList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getrentalProductList"
				
				);
		return rentalProductList;
	}
	
	public List<Map<String,String>> getrentalProductList2(List<String> rental_product_code)
	{
		//System.out.println("dao호출");
		//System.out.println(rentalProductSerachDTO.getRental_product_code());
		List<Map<String,String>> rentalProductList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getrentalProductList2"
				,rental_product_code
				);
		return rentalProductList;
	}
	
	public RentalProductDTO getrentalContent(RentalProductDTO rentalProductDTO)
	{
		//System.out.println("dao호출");
		RentalProductDTO rentalContent=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.getrentalContent"
				,rentalProductDTO
				);
		return rentalContent;
	}
	public int updateSubscription(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		//System.out.println("dao호출");
		int countcnt=this.sqlSession.update(
				"com.naver.erp.RentalDAO.updateSubscription"
				,rentalSubscriptionDTO
				);
		return countcnt;
	}
	
	public int insertSubscription(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		//System.out.println("dao호출");
		int subscriptioncnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertSubscription"
				,rentalSubscriptionDTO
				);
		return subscriptioncnt;
	}
	
	public int insertRentalTerm(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		//System.out.println("dao호출");
		int RentalTermcnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertRentalTerm"
				,rentalSubscriptionDTO
				);
		return RentalTermcnt;
	}
	
	public List<Map<String,String>> getrentalSubList(RentalProductSerachDTO rentalProductSerachDTO)
	{
		//System.out.println("dao호출");
		List<Map<String,String>> rentalSubList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getrentalSubList"
				,rentalProductSerachDTO
				);
		return rentalSubList;
	}
	
	public List<Map<String,String>> getrentalASList(int rt_no)
	{
		//System.out.println("dao호출");
		List<Map<String,String>> rentalASList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getrentalASList"
				,rt_no
				);
		return rentalASList;
	}
	
	public int rentalASCompanyProc(RentalASDTO rentalASDTO)
	{
		//System.out.println("dao호출");
		int rentalASCompanyCnt=this.sqlSession.update(
				"com.naver.erp.RentalDAO.rentalASCompanyProc"
				,rentalASDTO
				);
		return rentalASCompanyCnt;
	}
	
	public int updateSubJubsu(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		//System.out.println("dao호출");
		int subJubsucnt=this.sqlSession.update(
				"com.naver.erp.RentalDAO.updateSubJubsu"
				,rentalSubscriptionDTO
				);
		return subJubsucnt;
	}
	

	public int selectSubJubsu(RentalSubscriptionDTO rentalSubscriptionDTO)
	{
		//System.out.println("dao호출");
		int Jubsucnt=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.selectSubJubsu"
				,rentalSubscriptionDTO
				);
		return Jubsucnt;
	}
	
	public List<Map<String,String>> getBuyerRentalSubList(int b_no)
	{
		//System.out.println("dao호출");
		List<Map<String,String>> buyerRentalSubList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getBuyerRentalSubList"
				,b_no
				);
		return buyerRentalSubList;
	}
	
	public List<Map<String,String>> getBuyerrentalASList(int b_no)
	{
		//System.out.println("dao호출");
		List<Map<String,String>> buyerrentalASList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getBuyerrentalASList"
				,b_no
				);
		return buyerrentalASList;
	}
	
	public int selectAS(RentalASDTO rentalASDTO)
	{
		//System.out.println("dao호출");
		int AScnt=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.selectAS"
				,rentalASDTO
				);
		return AScnt;
	}
	public int getBuyerAScnt(RentalASDTO rentalASDTO)
	{
		//System.out.println(rentalASDTO.getB_no());
		//System.out.println(rentalASDTO.getRu_no());
		int getBuyerAScnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.getBuyerAScnt"
				,rentalASDTO
				);
		return getBuyerAScnt;
	}
	
	public int rentalProductListCnt(RentalProductSerachDTO rentalProductSerachDTO) 
	{
		//System.out.println("dao호출");
		int rentalProductListCnt=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.rentalProductListCnt"
				,rentalProductSerachDTO
				);
		return rentalProductListCnt;
	}
	
	public RentalASDTO getrentalASContent(int ru_no)
	{
		//System.out.println("dao호출");
		RentalASDTO rentalASContent=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.getrentalASContent"
				,ru_no
				);
		return rentalASContent;
	}
	
	public List<Map<String, String>> getaircnt(RentalChartsDTO rentalChartsDTO)
	{
		List<Map<String, String>> aircnt=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getaircnt"
				,rentalChartsDTO
				);
		return aircnt;
	}
	
	
	public List<Map<String,String>> getproductList(RentalChartsDTO rentalChartsDTO)
	{
		List<Map<String,String>> productList=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getproductList"
				,rentalChartsDTO
				);
		return productList;
	}
	
	public String rentalId(RentalCompanyDTO rentalCompanyDTO)
	{
		String rentalId=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.rentalId"
				,rentalCompanyDTO
				);
		return rentalId;
	}
	
	public String rentalPwd(RentalCompanyDTO rentalCompanyDTO)
	{
		String rentalPwd=this.sqlSession.selectOne(
				"com.naver.erp.RentalDAO.rentalPwd"
				,rentalCompanyDTO
				);
		return rentalPwd;
	}
	
	public int getBuyerReviewcnt(RentalReviewDTO rentalReviewDTO)
	{
		int getBuyerReviewcnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.getBuyerReviewcnt"
				,rentalReviewDTO
				);
		return getBuyerReviewcnt;
	}
	
	public int getBuyerReReviewcnt(RentalReviewDTO rentalReviewDTO)
	{
		int getBuyerReReviewcnt=this.sqlSession.update(
				"com.naver.erp.RentalDAO.getBuyerReReviewcnt"
				,rentalReviewDTO
				);
		return getBuyerReReviewcnt;
	}


	

	public List<Map<String,String>> getrentalTerm()
	{
		List<Map<String,String>> rentalTerm=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getrentalTerm"
				);
		return rentalTerm;
	}
	
	
	
	public List<Map<String,String>> getProduct()
	{
		List<Map<String,String>> product=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getProduct"
				);
		return product;
	}


	public int insertImageName(RentalProductDTO rentalProductDTO)
	{
		int saveImageCnt=this.sqlSession.insert(
				"com.naver.erp.RentalDAO.insertImageName"
				,rentalProductDTO
				);
		return saveImageCnt;
	}
	

	public List<Map<String,String>> getrentalImg(int rp_no)
	{
		List<Map<String,String>> rentalImg=this.sqlSession.selectList(
				"com.naver.erp.RentalDAO.getrentalImg"
				,rp_no
				);
		return rentalImg;
	}
}
