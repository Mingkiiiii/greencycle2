package com.greencycle.my.sell.vo;

public class SellVO {
	private Integer salesNo;
	private String salesPrice;
	private String salesName;
	private String salesContent;
	private String salesAddr;
	private String salesImage;
	private String salesStatus;
	private String userId;
	private String userNick;
	private String salesDate;
	private String salesCategory;
	public Integer getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(Integer salesNo) {
		this.salesNo = salesNo;
	}
	public String getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(String salesPrice) {
		this.salesPrice = salesPrice;
	}
	public String getSalesName() {
		return salesName;
	}
	public void setSalesName(String salesName) {
		this.salesName = salesName;
	}
	public String getSalesContent() {
		return salesContent;
	}
	public void setSalesContent(String salesContent) {
		this.salesContent = salesContent;
	}
	public String getSalesAddr() {
		return salesAddr;
	}
	public void setSalesAddr(String salesAddr) {
		this.salesAddr = salesAddr;
	}
	public String getSalesImage() {
		return salesImage;
	}
	public void setSalesImage(String salesImage) {
		this.salesImage = salesImage;
	}
	public String getSalesStatus() {
		return salesStatus;
	}
	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
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
	public String getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}
	public String getSalesCategory() {
		return salesCategory;
	}
	public void setSalesCategory(String salesCategory) {
		this.salesCategory = salesCategory;
	}
	@Override
	public String toString() {
		return "SellVO [salesNo=" + salesNo + ", salesPrice=" + salesPrice + ", salesName=" + salesName
				+ ", salesContent=" + salesContent + ", salesAddr=" + salesAddr + ", salesImage=" + salesImage
				+ ", salesStatus=" + salesStatus + ", userId=" + userId + ", userNick=" + userNick + ", salesDate="
				+ salesDate + ", salesCategory=" + salesCategory + "]";
	}
	
	
	
}
