package com.globalin.domain;

import java.util.Date;

public class ReplyVO {

	//regroup 그룹 번호 (모댓글과 그곳에 속한 답글은 같은 그룹을 가진다)
	//reorder 그룹 내 댓글 순서 (오랜된 글 ~최신글 오름차순)
	//redepth 그룹 내 댓글 깊이 (댓글인지 대댓글인지)
	
	private int rno, bno, regroup, reorder, redepth;
	private String reply, replyer, userId;
	private Date replyDate, updateDate;
	private UserVO userVO;
	private BoardVO boardVO;
	
	public int getRegroup() {
		return regroup;
	}
	public void setRegroup(int regroup) {
		this.regroup = regroup;
	}
	public int getReorder() {
		return reorder;
	}
	public void setReorder(int reorder) {
		this.reorder = reorder;
	}
	public int getRedepth() {
		return redepth;
	}
	public void setRedepth(int redepth) {
		this.redepth = redepth;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
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
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", regroup=" + regroup + ", reorder=" + reorder + ", redepth="
				+ redepth + ", reply=" + reply + ", replyer=" + replyer + ", userId=" + userId + ", replyDate="
				+ replyDate + ", updateDate=" + updateDate + ", userVO=" + userVO + ", boardVO=" + boardVO + "]";
	}
	
}
