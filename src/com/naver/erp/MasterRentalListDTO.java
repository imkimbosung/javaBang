package com.naver.erp;

public class MasterRentalListDTO {
	private int selectPageNoRental = 1;
	private int rowCntPerPageRental = 5;

	public int getSelectPageNoRental() {
		return selectPageNoRental;
	}

	public void setSelectPageNoRental(int selectPageNoRental) {
		this.selectPageNoRental = selectPageNoRental;
	}

	public int getRowCntPerPageRental() {
		return rowCntPerPageRental;
	}

	public void setRowCntPerPageRental(int rowCntPerPageRental) {
		this.rowCntPerPageRental = rowCntPerPageRental;
	}

}
