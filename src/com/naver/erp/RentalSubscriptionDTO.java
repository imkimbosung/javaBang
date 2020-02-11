package com.naver.erp;

public class RentalSubscriptionDTO {
	private String b_no;
	private String rp_no;
	private String ru_no;
	private String rental_term_code;
	private String rental_start_date;
	
	
	
	public String getRental_start_date() {
		return rental_start_date;
	}
	public void setRental_start_date(String rental_start_date) {
		this.rental_start_date = rental_start_date;
	}
	public String getRu_no() {
		return ru_no;
	}
	public void setRu_no(String ru_no) {
		this.ru_no = ru_no;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getRp_no() {
		return rp_no;
	}
	public void setRp_no(String rp_no) {
		this.rp_no = rp_no;
	}
	public String getRental_term_code() {
		return rental_term_code;
	}
	public void setRental_term_code(String rental_term_code) {
		this.rental_term_code = rental_term_code;
	}
	
	
	
	
	

	
}
