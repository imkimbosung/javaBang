package com.naver.erp;

public class MasterRentCompanyListDTO {

	private int selectProductPageNoCompany = 1;
	private int rowCntProductPerPageCompany = 5;

	public int getSelectProductPageNoCompany() {
		return selectProductPageNoCompany;
	}

	public void setSelectProductPageNoCompany(int selectProductPageNoCompany) {
		this.selectProductPageNoCompany = selectProductPageNoCompany;
	}

	public int getRowCntProductPerPageCompany() {
		return rowCntProductPerPageCompany;
	}

	public void setRowCntProductPerPageCompany(int rowCntProductPerPageCompany) {
		this.rowCntProductPerPageCompany = rowCntProductPerPageCompany;
	}

}
