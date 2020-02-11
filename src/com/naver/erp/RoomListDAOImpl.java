package com.naver.erp;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomListDAOImpl implements RoomListDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	public RoomListDTO getRoomContent(int sr_no){

		
		RoomListDTO roomContent=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getRoomContent"
				,sr_no
				);
		return roomContent;
	}
	
	
	
	public List<Map<String,String>> getRoomserachList(RoomSerachDTO roomSerachDTO)
	{
		List<Map<String,String>> roomList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getRoomserachList"
				,roomSerachDTO
				);
		
		return roomList;
	}


	public List<Map<String,String>> getsellerList(RoomSerachDTO roomSerachDTO)
	{
		List<Map<String,String>> sellerList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getsellerList"
				,roomSerachDTO
				);
		
		return sellerList;
	}
	public int selectlike(BuyerLikeRoomDTO buyerLikeRoomDTO)
	{
		//System.out.println("dao호출");
		int likecheck=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.selectlike"
				,buyerLikeRoomDTO
				);
		return likecheck;
	}
	
	public int insertlike(BuyerLikeRoomDTO buyerLikeRoomDTO)
	{
		//System.out.println("dao호출");
		int likecnt=this.sqlSession.insert(
				"com.naver.erp.RoomListDAO.insertlike"
				,buyerLikeRoomDTO
				);
		return likecnt;
	}
	
	public List<Map<String,String>> getlikeroomList(int b_no)
	{
		
		List<Map<String,String>> likeroomList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getlikeroomList"
				,b_no
				);
		
		return likeroomList;
	}
	
	public int deletelike(BuyerLikeRoomDTO buyerLikeRoomDTO)
	{
		//System.out.println("dao호출");
		int likedelcnt=this.sqlSession.delete(
				"com.naver.erp.RoomListDAO.deletelike"
				,buyerLikeRoomDTO
				);
		return likedelcnt;
	}
	
	public List<Map<String,String>> getoptionList(int sr_no)
	{
		List<Map<String,String>> optionList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getoptionList"
				,sr_no
				);
		return optionList;
	}
	
	public List<Map<String,String>> getimageList(int sr_no)
	{
		List<Map<String,String>> imageList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getimageList"
				,sr_no
				);
		return imageList;
	}
	
	public List<Map<String,String>> getrentalList()
	{
		List<Map<String,String>> rentalList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getrentalList"
				
				);
		return rentalList;
	}
	

	public List<Map<String,String>> getselltypeList()
	{
		List<Map<String,String>> serachList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getselltypeList"
				
				);
		return serachList;
	}
	
	public List<Map<String,String>> getroomtypeList()
	{
		List<Map<String,String>> getroomtypeList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getroomtypeList"
				
				);
		return getroomtypeList;
	}
	
	
	
	
	
	//------------추가-------------
	
	public int getBuyerReviewcnt(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		int getBuyerRealtorReviewcnt=this.sqlSession.insert(
				"com.naver.erp.RoomListDAO.getBuyerRealtorReviewcnt"
				,buyerRealtorScoreDTO
				);
		return getBuyerRealtorReviewcnt;
	}
	
	public int getBuyerReReviewcnt(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		int getBuyerRealtorReReviewcnt=this.sqlSession.update(
				"com.naver.erp.RoomListDAO.getBuyerRealtorReReviewcnt"
				,buyerRealtorScoreDTO
				);
		return getBuyerRealtorReReviewcnt;
	}
	
	
	public BuyerRealtorScoreDTO getBuyerRealtorScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO){

		
		BuyerRealtorScoreDTO getBuyerRealtorScore=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getBuyerRealtorScore"
				,buyerRealtorScoreDTO
				);
		return getBuyerRealtorScore;
	}
	
	
	
	public BuyerRealtorScoreDTO getBuyerAvgScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO){
		BuyerRealtorScoreDTO getBuyerAvgScore=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getBuyerAvgScore"
				,buyerRealtorScoreDTO
				);
		return getBuyerAvgScore;
	}
	
	public RentalProductDTO getFirstAir()
	{
		RentalProductDTO firstAir=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstAir"
				);
		return firstAir;
	}
	
	public RentalProductDTO getFirstWater()
	{
		RentalProductDTO firstWater=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstWater"
				);
		return firstWater;
	}
	
	public RentalProductDTO getFirstGas()
	{
		RentalProductDTO firstGas=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstGas"
				);
		return firstGas;
	}
	
	public RentalProductDTO getFirstTv()
	{
		RentalProductDTO firstTv=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstTv"
				);
		return firstTv;
	}

	public RentalProductDTO getFirstMicro()
	{
		RentalProductDTO firstMicro=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstMicro"
				);
		return firstMicro;
	}

	public RentalProductDTO getFirstWasher()
	{
		RentalProductDTO firstWasher=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstWasher"
				);
		return firstWasher;
	}

	public RentalProductDTO getFirstAircon()
	{
		RentalProductDTO firstAircon=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstAircon"
				);
		return firstAircon;
	}

	public RentalProductDTO getFirstFrig()
	{
		RentalProductDTO firstFrig=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstFrig"
				);
		return firstFrig;
	}

	public RentalProductDTO getFirstCucu()
	{
		RentalProductDTO firstCucu=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstCucu"
				);
		return firstCucu;
	}

	public RentalProductDTO getFirstPrint()
	{
		RentalProductDTO firstPrint=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstPrint"
				);
		return firstPrint;
	}
	
	public RentalProductDTO getFirstBed()
	{
		RentalProductDTO firstBed=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstBed"
				);
		return firstBed;
	}

	public RentalProductDTO getFirstVide()
	{
		RentalProductDTO firstVide=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstVide"
				);
		return firstVide;
	}

	public RentalProductDTO getFirstStyler()
	{
		RentalProductDTO firstStyler=this.sqlSession.selectOne(
				"com.naver.erp.RoomListDAO.getFirstStyler"
				);
		return firstStyler;
	}
	

	public List<Map<String,String>> getRoomOptionList()
	{
		List<Map<String,String>> roomoptionList=this.sqlSession.selectList(
				"com.naver.erp.RoomListDAO.getRoomOptionList"
				);
		return roomoptionList;
	}
	

}
