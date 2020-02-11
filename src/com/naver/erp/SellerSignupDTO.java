package com.naver.erp;

public class SellerSignupDTO {
	private String s_no;
	private String s_id;
	private String s_pwd;
	private String s_name;
	private String s_jumin;
	private String s_jumin1;
	private String s_jumin2;
	private int route_code = 0;

	public String getS_no() {
		return s_no;
	}

	public void setS_no(String s_no) {
		this.s_no = s_no;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_pwd() {
		return s_pwd;
	}

	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_jumin() {
		return s_jumin;
	}

	public void setS_jumin(String s_jumin) {
		this.s_jumin = s_jumin;
	}

	public String getS_jumin1() {
		return s_jumin1;
	}

	public void setS_jumin1(String s_jumin1) {
		this.s_jumin1 = s_jumin1;
	}

	public String getS_jumin2() {
		return s_jumin2;
	}

	public void setS_jumin2(String s_jumin2) {
		this.s_jumin2 = s_jumin2;
	}

	public int getRoute_code() {
		return route_code;
	}

	public void setRoute_code(int route_code) {
		this.route_code = route_code;
	}
}