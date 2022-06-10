package com.globalin.domain;

public class Criteria {

	private int pageNum, amount, btype;

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
		this.btype = 0;
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

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", btype=" + btype + ", type=" + type
				+ ", keyword=" + keyword + "]";
	}

	public String[] getTypeArr() {
		String[] result = {};
		if (type == null) {
		} else {
			// btype 1 == > 정치 (P)

		}
		return result;
	}

}
