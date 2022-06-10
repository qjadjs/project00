package com.globalin.domain;

import java.util.Date;

public class BoardVO {

	private int bno, replyCnt, viewCnt, likeCnt, dislikeCnt, btype, selectCnt, select_a, select_b;
	private String title, content1, content2, content3, content4, writer, userId;
	private Date regDate, updateDate;
	private UserVO userVO;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getDislikeCnt() {
		return dislikeCnt;
	}

	public void setDislikeCnt(int dislikeCnt) {
		this.dislikeCnt = dislikeCnt;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public String getContent3() {
		return content3;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}

	public String getContent4() {
		return content4;
	}

	public void setContent4(String content4) {
		this.content4 = content4;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public int getSelectCnt() {
		return selectCnt;
	}

	public void setSelectCnt(int selectCnt) {
		this.selectCnt = selectCnt;
	}

	public int getSelect_a() {
		return select_a;
	}

	public void setSelect_a(int select_a) {
		this.select_a = select_a;
	}

	public int getSelect_b() {
		return select_b;
	}

	public void setSelect_b(int select_b) {
		this.select_b = select_b;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", replyCnt=" + replyCnt + ", viewCnt=" + viewCnt + ", likeCnt=" + likeCnt
				+ ", dislikeCnt=" + dislikeCnt + ", btype=" + btype + ", selectCnt=" + selectCnt + ", select_a="
				+ select_a + ", select_b=" + select_b + ", title=" + title + ", content1=" + content1 + ", content2="
				+ content2 + ", content3=" + content3 + ", content4=" + content4 + ", writer=" + writer + ", userId="
				+ userId + ", regDate=" + regDate + ", updateDate=" + updateDate + ", userVO=" + userVO + "]";
	}

}