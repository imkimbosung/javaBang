package com.naver.erp;

import java.util.*;

public class MasterSellerCodeDTO {
	private String[] selectColumn; // roomtype
	private String[] tableName; // 선택한 테이블명
	private String[] columnName; // 선택한 칼럼명
	private String[] columnCodeName; // 선택한 테이블의 코드 칼럼명
	private int[] checkNum; // 선택한 칼럼 개수

	private String insertRoomtype; // room 추가할 값
	private String insertElvAvailable; // elv 추가할 값
	private String insertHcAvailable; // hc 추가할 값

	public String[] getSelectColumn() {
		return selectColumn;
	}

	public void setSelectColumn(String[] selectColumn) {
		this.selectColumn = selectColumn;
	}

	public String[] getTableName() {
		return tableName;
	}

	public void setTableName(String[] tableName) {
		this.tableName = tableName;
	}

	public String[] getColumnName() {
		return columnName;
	}

	public void setColumnName(String[] columnName) {
		this.columnName = columnName;
	}

	public String[] getColumnCodeName() {
		return columnCodeName;
	}

	public void setColumnCodeName(String[] columnCodeName) {
		this.columnCodeName = columnCodeName;
	}

	public int[] getCheckNum() {
		return checkNum;
	}

	public void setCheckNum(int[] checkNum) {
		this.checkNum = checkNum;
	}

	public String getInsertRoomtype() {
		return insertRoomtype;
	}

	public void setInsertRoomtype(String insertRoomtype) {
		this.insertRoomtype = insertRoomtype;
	}

	public String getInsertElvAvailable() {
		return insertElvAvailable;
	}

	public void setInsertElvAvailable(String insertElvAvailable) {
		this.insertElvAvailable = insertElvAvailable;
	}

	public String getInsertHcAvailable() {
		return insertHcAvailable;
	}

	public void setInsertHcAvailable(String insertHcAvailable) {
		this.insertHcAvailable = insertHcAvailable;
	}

//	public String[] getRoomtype() {
//		return roomtype;
//	}
//
//	public void setRoomtype(String[] roomtype) {
//		this.roomtype = roomtype;
//	}

}
