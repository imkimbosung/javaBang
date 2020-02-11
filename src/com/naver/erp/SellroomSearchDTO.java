package com.naver.erp;

public class SellroomSearchDTO {
	private int sr_no = 0;
	private int r_no = 0;
	private int s_no = 0;
	private String r_id;
	private String sr_mainaddr;
	private String sr_addrflow;
	private String sr_roomsize;
	private String sr_builddate;
	private String s_id;
	private String s_pwd;
	private String s_name;
	private String s_ad;
	private String sr_addr;
	private String as_date;
	private int check_code = 0;

	private int selectPageNo = 1;
	private int rowCntPerPage = 15;
	private String[] readcnt;
	private String[] date;
	private String keyword;

	public int getSr_no() {
		return sr_no;
	}

	public void setSr_no(int sr_no) {
		this.sr_no = sr_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getSr_mainaddr() {
		return sr_mainaddr;
	}

	public void setSr_mainaddr(String sr_mainaddr) {
		this.sr_mainaddr = sr_mainaddr;
	}

	public String getSr_addrflow() {
		return sr_addrflow;
	}

	public void setSr_addrflow(String sr_addrflow) {
		this.sr_addrflow = sr_addrflow;
	}

	public String getSr_roomsize() {
		return sr_roomsize;
	}

	public void setSr_roomsize(String sr_roomsize) {
		this.sr_roomsize = sr_roomsize;
	}

	public String getSr_builddate() {
		return sr_builddate;
	}

	public void setSr_builddate(String sr_builddate) {
		this.sr_builddate = sr_builddate;
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

	public String getS_ad() {
		return s_ad;
	}

	public void setS_ad(String s_ad) {
		this.s_ad = s_ad;
	}

	public String getSr_addr() {
		return sr_addr;
	}

	public void setSr_addr(String sr_addr) {
		this.sr_addr = sr_addr;
	}

	public String getAs_date() {
		return as_date;
	}

	public void setAs_date(String as_date) {
		this.as_date = as_date;
	}

	public int getCheck_code() {
		return check_code;
	}

	public void setCheck_code(int check_code) {
		this.check_code = check_code;
	}

	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}

	public int getRowCntPerPage() {
		return rowCntPerPage;
	}

	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}

	public String[] getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(String[] readcnt) {
		this.readcnt = readcnt;
	}

	public String[] getDate() {
		return date;
	}

	public void setDate(String[] date) {
		this.date = date;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
