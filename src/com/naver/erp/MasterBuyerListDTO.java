package com.naver.erp;

public class MasterBuyerListDTO {
	private int adTrueCnt = 0;
	private int adFalseCnt = 0;

	private int selectPageNoBuyer = 1;
	private int rowCntPerPageBuyer = 5;


	public int getSelectPageNoBuyer() {
		return selectPageNoBuyer;
	}

	public void setSelectPageNoBuyer(int selectPageNoBuyer) {
		this.selectPageNoBuyer = selectPageNoBuyer;
	}

	public int getRowCntPerPageBuyer() {
		return rowCntPerPageBuyer;
	}

	public void setRowCntPerPageBuyer(int rowCntPerPageBuyer) {
		this.rowCntPerPageBuyer = rowCntPerPageBuyer;
	}

	public int getAdTrueCnt() {
		return adTrueCnt;
	}

	public void setAdTrueCnt(int adTrueCnt) {
		this.adTrueCnt = adTrueCnt;
	}

	public int getAdFalseCnt() {
		return adFalseCnt;
	}

	public void setAdFalseCnt(int adFalseCnt) {
		this.adFalseCnt = adFalseCnt;
	}

}
