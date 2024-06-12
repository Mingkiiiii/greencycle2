package com.greencycle.my.member.vo;

public class KakaoUserVO{
    public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getThumbnailImage() {
      return thumbnailImage;
   }
   public void setThumbnailImage(String thumbnailImage) {
      this.thumbnailImage = thumbnailImage;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   private String nickname;
    private String thumbnailImage;
    private String email;

    // Getters and Setters
}
