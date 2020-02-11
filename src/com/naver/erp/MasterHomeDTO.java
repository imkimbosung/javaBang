package com.naver.erp;

public class MasterHomeDTO {
	private int roomCount;
	private int clientCount;
	private int rentCount;
	private int visitCount;
	private int visitToday;
	private int visitYesterday;

	
	public int getRoomCount() {
		return roomCount;
	}

	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}

	public int getClientCount() {
		return clientCount;
	}

	public void setClientCount(int clientCount) {
		this.clientCount = clientCount;
	}

	public int getRentCount() {
		return rentCount;
	}

	public void setRentCount(int rentCount) {
		this.rentCount = rentCount;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public int getVisitToday() {
		return visitToday;
	}

	public void setVisitToday(int visitToday) {
		this.visitToday = visitToday;
	}

	public int getVisitYesterday() {
		return visitYesterday;
	}

	public void setVisitYesterday(int visitYesterday) {
		this.visitYesterday = visitYesterday;
	}

	
	
}
