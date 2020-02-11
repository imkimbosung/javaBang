package com.naver.erp;

import java.util.List;
import java.util.Map;

public class MasterChartsDTO {

	private String yearVal = "2020";
	List<Map<String, String>> roomtypeGraph;
	
	
	public String getYearVal() {
		return yearVal;
	}
	public void setYearVal(String yearVal) {
		this.yearVal = yearVal;
	}
	public List<Map<String, String>> getRoomtypeGraph() {
		return roomtypeGraph;
	}
	public void setRoomtypeGraph(List<Map<String, String>> roomtypeGraph) {
		this.roomtypeGraph = roomtypeGraph;
	}


	
	

}
