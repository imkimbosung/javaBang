package com.naver.erp;

public class MasterCheckcodeDTO {
	private String checkCode;
	private String inputMsg = "empty";
	private String startDate = "2020-01-01";
	private String endDate = "2020-01-01";

	

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public String getInputMsg() {
		return inputMsg;
	}

	public void setInputMsg(String inputMsg) {
		this.inputMsg = inputMsg;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
