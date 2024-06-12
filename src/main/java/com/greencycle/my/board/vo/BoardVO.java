package com.greencycle.my.board.vo;

public class BoardVO {

	private int boardNo;
    private String boardTitle;
    private String boardPw;
    private String boardCate;
	private String memId;
	private String memNm;
	private String boardContent;
	private String boardDate;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardPw() {
		return boardPw;
	}
	public void setBoardPw(String boardPw) {
		this.boardPw = boardPw;
	}
	public String getBoardCate() {
		return boardCate;
	}
	public void setBoardCate(String boardCate) {
		this.boardCate = boardCate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardPw=" +  boardPw + ", boardCate=" +  boardCate +  ", memId=" + memId + ", memNm=" + memNm
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + "]";
	}

	
	
	
}
