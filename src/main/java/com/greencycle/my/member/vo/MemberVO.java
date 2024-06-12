package com.greencycle.my.member.vo;

/**
 *
 * Class Name : MemberVO Author : Mingki Created Date: 2024. 5. 9. Version: 1.0
 * Purpose: Description:
 *
 **/
public class MemberVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userNick;
	private String userProfile;
	private String joinDate;
	private String userAddr;
	private String userSubaddr;
	private String userPhone;
	private String isAdmin;
	private String userDetailaddr;
	private String userPost;
	private String userPoint;
	private String userBanned;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserSubaddr() {
		return userSubaddr;
	}
	public void setUserSubaddr(String userSubaddr) {
		this.userSubaddr = userSubaddr;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getUserDetailaddr() {
		return userDetailaddr;
	}
	public void setUserDetailaddr(String userDetailaddr) {
		this.userDetailaddr = userDetailaddr;
	}
	public String getUserPost() {
		return userPost;
	}
	public void setUserPost(String userPost) {
		this.userPost = userPost;
	}
	public String getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(String userPoint) {
		this.userPoint = userPoint;
	}
	public String getUserBanned() {
		return userBanned;
	}
	public void setUserBanned(String userBanned) {
		this.userBanned = userBanned;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userNick=" + userNick
				+ ", userProfile=" + userProfile + ", joinDate=" + joinDate + ", userAddr=" + userAddr
				+ ", userSubaddr=" + userSubaddr + ", userPhone=" + userPhone + ", isAdmin=" + isAdmin
				+ ", userDetailaddr=" + userDetailaddr + ", userPost=" + userPost + ", userPoint=" + userPoint
				+ ", userBanned=" + userBanned + "]";
	}

	

}