package com.naver.erp;

public class SellerInfoDTO {
	
	private String s_name;
	private String s_pwd;

	private int sr_no = 0;

	private int roomtype_code;
	private String sr_roomtype;

	private int selltype_code;
	private String sr_selltype;
	private String monthly_rent;
	private String deposit;
	private String price_jeonse;
	private String price_sale;
	
	private int[] select_option;
	private String selected_option;

	private String sr_main_addr;
	private String sr_addr_detail;

	private int option_code;
	private String sr_optiontype;

	private int check_owner_code =0;

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_pwd() {
		return s_pwd;
	}

	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}

	public int getSr_no() {
		return sr_no;
	}

	public void setSr_no(int sr_no) {
		this.sr_no = sr_no;
	}

	public int getRoomtype_code() {
		return roomtype_code;
	}

	public void setRoomtype_code(int roomtype_code) {
		this.roomtype_code = roomtype_code;
	}

	public String getSr_roomtype() {
		return sr_roomtype;
	}

	public void setSr_roomtype(String sr_roomtype) {
		this.sr_roomtype = sr_roomtype;
	}

	public int getSelltype_code() {
		return selltype_code;
	}

	public void setSelltype_code(int selltype_code) {
		this.selltype_code = selltype_code;
	}

	public String getSr_selltype() {
		return sr_selltype;
	}

	public void setSr_selltype(String sr_selltype) {
		this.sr_selltype = sr_selltype;
	}

	public String getMonthly_rent() {
		return monthly_rent;
	}

	public void setMonthly_rent(String monthly_rent) {
		this.monthly_rent = monthly_rent;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getPrice_jeonse() {
		return price_jeonse;
	}

	public void setPrice_jeonse(String price_jeonse) {
		this.price_jeonse = price_jeonse;
	}

	public String getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(String price_sale) {
		this.price_sale = price_sale;
	}

	public int[] getSelect_option() {
		return select_option;
	}

	public void setSelect_option(int[] select_option) {
		this.select_option = select_option;
	}

	public String getSelected_option() {
		return selected_option;
	}

	public void setSelected_option(String selected_option) {
		this.selected_option = selected_option;
	}

	public String getSr_main_addr() {
		return sr_main_addr;
	}

	public void setSr_main_addr(String sr_main_addr) {
		this.sr_main_addr = sr_main_addr;
	}

	public String getSr_addr_detail() {
		return sr_addr_detail;
	}

	public void setSr_addr_detail(String sr_addr_detail) {
		this.sr_addr_detail = sr_addr_detail;
	}

	public int getOption_code() {
		return option_code;
	}

	public void setOption_code(int option_code) {
		this.option_code = option_code;
	}

	public String getSr_optiontype() {
		return sr_optiontype;
	}

	public void setSr_optiontype(String sr_optiontype) {
		this.sr_optiontype = sr_optiontype;
	}

	public int getCheck_owner_code() {
		return check_owner_code;
	}

	public void setCheck_owner_code(int check_owner_code) {
		this.check_owner_code = check_owner_code;
	}

	
	
}