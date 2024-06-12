package com.greencycle.my.game.vo;

public class DamainfoVO {
    private String damainfoNo; // 다마고치 정보의 고유 식별자
    private Integer damainfoLevel; // 다마고치의 레벨
    private Integer damainfoHp; // 다마고치의 체력 (Health Points)
    private Integer damainfoClean; // 다마고치의 청결도
    private Integer damainfoFood; // 다마고치의 배고픔 정도
    private String damainfoType; // 다마고치의 상태 타입 (예: 'death' 등)
    private Integer damainfoHappniess; // 다마고치의 행복도
    private Integer damainfoExp; // 다마고치의 경험치
    private String userId; // 사용자 ID
    private String userPoint; // 사용자 포인트 (타입을 String으로 변경)
    private String damainfoChar; // 다마고치의 캐릭터 타입
    private String damainfoName; // 다마고치의 이름
    private Integer damainfoIll; // 다마고치의 질병 상태

    // Getter와 Setter 메서드
    public String getDamainfoNo() {
        return damainfoNo;
    }

    public void setDamainfoNo(String damainfoNo) {
        this.damainfoNo = damainfoNo;
    }

    public Integer getDamainfoLevel() {
        return damainfoLevel;
    }

    public void setDamainfoLevel(Integer damainfoLevel) {
        this.damainfoLevel = damainfoLevel;
    }

    public Integer getDamainfoHp() {
        return damainfoHp;
    }

    public void setDamainfoHp(Integer damainfoHp) {
        this.damainfoHp = damainfoHp;
    }

    public Integer getDamainfoClean() {
        return damainfoClean;
    }

    public void setDamainfoClean(Integer damainfoClean) {
        this.damainfoClean = damainfoClean;
    }

    public Integer getDamainfoFood() {
        return damainfoFood;
    }

    public void setDamainfoFood(Integer damainfoFood) {
        this.damainfoFood = damainfoFood;
    }

    public String getDamainfoType() {
        return damainfoType;
    }

    public void setDamainfoType(String damainfoType) {
        this.damainfoType = damainfoType;
    }

    public Integer getDamainfoHappniess() {
        return damainfoHappniess;
    }

    public void setDamainfoHappniess(Integer damainfoHappniess) {
        this.damainfoHappniess = damainfoHappniess;
    }

    public Integer getDamainfoExp() {
        return damainfoExp;
    }

    public void setDamainfoExp(Integer damainfoExp) {
        this.damainfoExp = damainfoExp;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPoint() {
        return userPoint;
    }

    public void setUserPoint(String userPoint) {
        this.userPoint = userPoint;
    }

    public String getDamainfoChar() {
        return damainfoChar;
    }

    public void setDamainfoChar(String damainfoChar) {
        this.damainfoChar = damainfoChar;
    }

    public String getDamainfoName() {
        return damainfoName;
    }

    public void setDamainfoName(String damainfoName) {
        this.damainfoName = damainfoName;
    }

    public Integer getDamainfoIll() {
        return damainfoIll;
    }

    public void setDamainfoIll(Integer damainfoIll) {
        this.damainfoIll = damainfoIll;
    }

    @Override
    public String toString() {
        return "DamainfoVO [damainfoNo=" + damainfoNo + ", damainfoLevel=" + damainfoLevel + ", damainfoHp="
                + damainfoHp + ", damainfoClean=" + damainfoClean + ", damainfoFood=" + damainfoFood + ", damainfoType="
                + damainfoType + ", damainfoHappniess=" + damainfoHappniess + ", damainfoExp=" + damainfoExp
                + ", userId=" + userId + ", userPoint=" + userPoint + ", damainfoChar=" + damainfoChar
                + ", damainfoName=" + damainfoName + ", damainfoIll=" + damainfoIll + "]";
    }
}
