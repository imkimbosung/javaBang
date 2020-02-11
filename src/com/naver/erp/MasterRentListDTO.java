package com.naver.erp;

public class MasterRentListDTO {
	private int selectProductPageNoProduct = 1;
	private int rowCntProductPerPageProduct = 5;

	public int getSelectProductPageNoProduct() {
		return selectProductPageNoProduct;
	}

	public void setSelectProductPageNoProduct(int selectProductPageNoProduct) {
		this.selectProductPageNoProduct = selectProductPageNoProduct;
	}

	public int getRowCntProductPerPageProduct() {
		return rowCntProductPerPageProduct;
	}

	public void setRowCntProductPerPageProduct(int rowCntProductPerPageProduct) {
		this.rowCntProductPerPageProduct = rowCntProductPerPageProduct;
	}

}
