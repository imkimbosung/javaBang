package com.naver.erp;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoomListServiceImpl implements RoomListService{
	
	@Autowired
	private RoomListDAO roomListDAO;
	
	
	public RoomListDTO getRoomContent(int sr_no){
		
		RoomListDTO roomContent=this.roomListDAO.getRoomContent(sr_no);
		return roomContent;
	}

	
	public List<Map<String,String>> getRoomserachList(RoomSerachDTO roomSerachDTO)
	{
		List<Map<String,String>> roomList=this.roomListDAO.getRoomserachList(roomSerachDTO);
		return roomList;
	}


	public List<Map<String,String>> getsellerList(RoomSerachDTO roomSerachDTO)
	{
		List<Map<String,String>> sellerList=this.roomListDAO.getsellerList(roomSerachDTO);
		return sellerList;
	} 
	
	public int insertlike(BuyerLikeRoomDTO buyerLikeRoomDTO)
	{
		int likecheck=this.roomListDAO.selectlike(buyerLikeRoomDTO);
		if(likecheck!=0) {return -2;}
		int likecnt=this.roomListDAO.insertlike(buyerLikeRoomDTO);
		return likecnt;
	}

	public List<Map<String,String>> getlikeroomList(int b_no)
	{
		
		List<Map<String,String>> likeroomList=this.roomListDAO.getlikeroomList(b_no);
		return likeroomList;
	}
	
	public int deletelike(BuyerLikeRoomDTO buyerLikeRoomDTO)
	{
		int likedelcnt=this.roomListDAO.deletelike(buyerLikeRoomDTO);
		return likedelcnt;
	}
	
	public List<Map<String,String>> getoptionList(int sr_no)
	{
		List<Map<String,String>> optionList=this.roomListDAO.getoptionList(sr_no);
		return optionList;
	}
	
	public List<Map<String,String>> getimageList(int sr_no)
	{
		List<Map<String,String>> imageList=this.roomListDAO.getimageList(sr_no);
		return imageList;
	}
	

	public List<Map<String,String>> getrentalList()
	{
		List<Map<String,String>> rentalList=this.roomListDAO.getrentalList();
		return rentalList;
	}
	

	public List<Map<String,String>> getselltypeList()
	{
		List<Map<String,String>> serachList=this.roomListDAO.getselltypeList();
		return serachList;
	}
	
	public List<Map<String,String>> getroomtypeList()
	{
		List<Map<String,String>> getroomtypeList=this.roomListDAO.getroomtypeList();
		return getroomtypeList;
	}
	
	
	
	//----------추가-------------
	
	public int getBuyerReviewcnt(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		int getBuyerReviewcnt = this.roomListDAO.getBuyerReviewcnt(buyerRealtorScoreDTO);
		return getBuyerReviewcnt;
	}
	
	public int getBuyerReReviewcnt(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		int getBuyerReReviewcnt = this.roomListDAO.getBuyerReReviewcnt(buyerRealtorScoreDTO);
		return getBuyerReReviewcnt;
	}
	
	
	public BuyerRealtorScoreDTO getBuyerRealtorScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		BuyerRealtorScoreDTO getBuyerRealtorScore=this.roomListDAO.getBuyerRealtorScore(buyerRealtorScoreDTO);
		return getBuyerRealtorScore;
	}
	
	public BuyerRealtorScoreDTO getBuyerAvgScore(BuyerRealtorScoreDTO buyerRealtorScoreDTO)
	{
		BuyerRealtorScoreDTO getBuyerAvgScore=this.roomListDAO.getBuyerAvgScore(buyerRealtorScoreDTO);
		return getBuyerAvgScore;
	}
	
	public RentalProductDTO getFirstAir()
	{
		RentalProductDTO firstAir=this.roomListDAO.getFirstAir();
		return firstAir;
	}
	
	public RentalProductDTO getFirstWater()
	{
		RentalProductDTO firstWater=this.roomListDAO.getFirstWater();
		return firstWater;
	}
	
	public RentalProductDTO getFirstGas()
	{
		RentalProductDTO firstGas=this.roomListDAO.getFirstGas();
		return firstGas;
	}
	
	public RentalProductDTO getFirstTv()
	{
		RentalProductDTO firstTv=this.roomListDAO.getFirstTv();
		return firstTv;
	}

	public RentalProductDTO getFirstMicro()
	{
		RentalProductDTO firstMicro=this.roomListDAO.getFirstMicro();
		return firstMicro;
	}

	public RentalProductDTO getFirstWasher()
	{
		RentalProductDTO firstAircon=this.roomListDAO.getFirstWasher();
		return firstAircon;
	}

	public RentalProductDTO getFirstAircon()
	{
		RentalProductDTO firstAircon=this.roomListDAO.getFirstAircon();
		return firstAircon;
	}

	public RentalProductDTO getFirstFrig()
	{
		RentalProductDTO firstFrig=this.roomListDAO.getFirstFrig();
		return firstFrig;
	}

	public RentalProductDTO getFirstCucu()
	{
		RentalProductDTO firstCucu=this.roomListDAO.getFirstCucu();
		return firstCucu;
	}

	public RentalProductDTO getFirstPrint()
	{
		RentalProductDTO firstPrint=this.roomListDAO.getFirstPrint();
		return firstPrint;
	}

	public RentalProductDTO getFirstBed()
	{
		RentalProductDTO firstBed=this.roomListDAO.getFirstBed();
		return firstBed;
	}

	public RentalProductDTO getFirstVide()
	{
		RentalProductDTO firstVide=this.roomListDAO.getFirstVide();
		return firstVide;
	}

	public RentalProductDTO getFirstStyler()
	{
		RentalProductDTO firstStyler=this.roomListDAO.getFirstStyler();
		return firstStyler;
	}
	

	public List<Map<String,String>> getRoomOptionList()
	{
		List<Map<String,String>> roomoptionList=this.roomListDAO.getRoomOptionList();
		return roomoptionList;
	}
}
















