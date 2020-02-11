package com.naver.erp;

import org.springframework.web.multipart.MultipartFile;

public class RealtorDTO {
	private int r_no;
	private String r_id;
	private String r_pwd;
	private String r_name;
	private String r_phone;

	private String authority;
	private String route;
	private String ri_officename;
	private String ri_realtor_num;

	private String ri_business_num;
	private String ri_name;
	private String ri_main_phone;
	private String ri_addr;

	private String ri_detail_addr;
	private String image_name;

	private String check_type;
	private int s_no;

	private int check_code;
	private int ri_no;
	private int route_code;
	private int authority_code;

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_pwd() {
		return r_pwd;
	}

	public void setR_pwd(String r_pwd) {
		this.r_pwd = r_pwd;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_phone() {
		return r_phone;
	}

	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getRi_officename() {
		return ri_officename;
	}

	public void setRi_officename(String ri_officename) {
		this.ri_officename = ri_officename;
	}

	public String getRi_realtor_num() {
		return ri_realtor_num;
	}

	public void setRi_realtor_num(String ri_realtor_num) {
		this.ri_realtor_num = ri_realtor_num;
	}

	public String getRi_business_num() {
		return ri_business_num;
	}

	public void setRi_business_num(String ri_business_num) {
		this.ri_business_num = ri_business_num;
	}

	public String getRi_name() {
		return ri_name;
	}

	public void setRi_name(String ri_name) {
		this.ri_name = ri_name;
	}

	public String getRi_main_phone() {
		return ri_main_phone;
	}

	public void setRi_main_phone(String ri_main_phone) {
		this.ri_main_phone = ri_main_phone;
	}

	public String getRi_addr() {
		return ri_addr;
	}

	public void setRi_addr(String ri_addr) {
		this.ri_addr = ri_addr;
	}

	public String getRi_detail_addr() {
		return ri_detail_addr;
	}

	public void setRi_detail_addr(String ri_detail_addr) {
		this.ri_detail_addr = ri_detail_addr;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getCheck_type() {
		return check_type;
	}

	public void setCheck_type(String check_type) {
		this.check_type = check_type;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getCheck_code() {
		return check_code;
	}

	public void setCheck_code(int check_code) {
		this.check_code = check_code;
	}

	public int getRi_no() {
		return ri_no;
	}

	public void setRi_no(int ri_no) {
		this.ri_no = ri_no;
	}

	public int getRoute_code() {
		return route_code;
	}

	public void setRoute_code(int route_code) {
		this.route_code = route_code;
	}

	public int getAuthority_code() {
		return authority_code;
	}

	public void setAuthority_code(int authority_code) {
		this.authority_code = authority_code;
	}

//	public MultipartFile getImage_name() {
//		return image_name;
//	}
//
//	public void setImage_name(MultipartFile image_name) {
//		this.image_name = image_name;
//	}

}
