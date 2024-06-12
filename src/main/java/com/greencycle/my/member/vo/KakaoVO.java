package com.greencycle.my.member.vo;

public class KakaoVO {
	   
	   private String kakao_user_id;
	   private String nickname;
	   private String email; // 추가: 이메일 정보를 저장하기 위한 필드
	   
	   public String getKakao_user_id() {
	      return kakao_user_id;
	   }
	   
	   public void setKakao_user_id(String kakao_user_id) {
	      this.kakao_user_id = kakao_user_id;
	   }
	   
	   public String getNickname() {
	      return nickname;
	   }
	   
	   public void setNickname(String nickname) {
	      this.nickname = nickname;
	   }
	   
	   public String getEmail() { // 추가: 이메일 정보 반환 메서드
	      return email;
	   }
	   
	   public void setEmail(String email) { // 추가: 이메일 정보 설정 메서드
	      this.email = email;
	   }
	   
	   @Override
	   public String toString() {
	      return "KakaoVO [kakao_user_id=" + kakao_user_id + ", nickname=" + nickname + ", email=" + email + "]";
	   }
	}