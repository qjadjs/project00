package com.globalin.domain;

public class Criteria {

	private int pageNum, amount;

	private String type, keyword;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword + "]";
	}

	public String[] getTypeArr() {
		String[] result = {};
		if (type == null) {
		} else {
			result = type.split("");
		}
		return result;
	}

}
