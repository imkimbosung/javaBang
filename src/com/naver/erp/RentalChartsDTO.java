package com.naver.erp;

import java.util.List;
import java.util.Map;

public class RentalChartsDTO {
	private String year="2019";
	private String rt_no;
	

	private List<Map<String, String>> rental_product;
	
	
	
	
	public List<Map<String, String>> getRental_product() {
		return rental_product;
	}
	public void setRental_product(List<Map<String, String>> rental_product) {
		this.rental_product = rental_product;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getRt_no() {
		return rt_no;
	}
	public void setRt_no(String rt_no) {
		this.rt_no = rt_no;
	}
	
	

}
