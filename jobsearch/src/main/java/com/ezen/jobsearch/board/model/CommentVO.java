package com.ezen.jobsearch.board.model;

import java.sql.Timestamp;

public class CommentVO {

	private int commentSeq;
	private String commentDesc;
	private Timestamp regDate;
	private int refBoardseq;
	private int refMemberseq;
	
	public int getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	public String getCommentDesc() {
		return commentDesc;
	}
	public void setCommentDesc(String commentDesc) {
		this.commentDesc = commentDesc;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getRefBoardseq() {
		return refBoardseq;
	}
	public void setRefBoardseq(int refBoardseq) {
		this.refBoardseq = refBoardseq;
	}
	public int getRefMemberseq() {
		return refMemberseq;
	}
	public void setRefMemberseq(int refMemberseq) {
		this.refMemberseq = refMemberseq;
	}
	
	@Override
	public String toString() {
		return "CommentVO [commentSeq=" + commentSeq + ", commentDesc=" + commentDesc + ", regDate=" + regDate
				+ ", refBoardseq=" + refBoardseq + ", refMemberseq=" + refMemberseq + "]";
	}
	
	
	
	
	
	
}
