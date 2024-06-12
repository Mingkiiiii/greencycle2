package com.greencycle.my.noticeqna.vo;

public class NoticeQnaVO {
	private Integer faqNo;
    private String faqTitle;
    private String faqContent;
	private String userId;
	private String userNick;
	private String faqDate;
	public Integer getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(Integer faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(String faqDate) {
		this.faqDate = faqDate;
	}
	@Override
	public String toString() {
		return "NoticeQnaVO [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", userId="
				+ userId + ", userNick=" + userNick + ", faqDate=" + faqDate + "]";
	}
	
	
}
