package com.naver.erp;

public class MasterSellerListDTO {
	private int selectPageNoSeller = 1;
	private int rowCntPerPageSeller = 5;

	public int getSelectPageNoSeller() {
		return selectPageNoSeller;
	}

	public void setSelectPageNoSeller(int selectPageNoSeller) {
		this.selectPageNoSeller = selectPageNoSeller;
	}

	public int getRowCntPerPageSeller() {
		return rowCntPerPageSeller;
	}

	public void setRowCntPerPageSeller(int rowCntPerPageSeller) {
		this.rowCntPerPageSeller = rowCntPerPageSeller;
	}

}
