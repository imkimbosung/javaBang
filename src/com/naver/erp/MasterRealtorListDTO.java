package com.naver.erp;

public class MasterRealtorListDTO {
	private int selectPageNoRealtor = 1;
	private int rowCntPerPageRealtor = 5;

	public int getSelectPageNoRealtor() {
		return selectPageNoRealtor;
	}

	public void setSelectPageNoRealtor(int selectPageNoRealtor) {
		this.selectPageNoRealtor = selectPageNoRealtor;
	}

	public int getRowCntPerPageRealtor() {
		return rowCntPerPageRealtor;
	}

	public void setRowCntPerPageRealtor(int rowCntPerPageRealtor) {
		this.rowCntPerPageRealtor = rowCntPerPageRealtor;
	}

}
