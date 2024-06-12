package com.greencycle.my.sell.vo;

import com.greencycle.my.commons.vo.PagingVO;

// SellSearchVO 클래스는 PagingVO를 상속받아 페이징 기능을 제공하며, 검색 조건을 담는 VO 클래스입니다.
public class SellSearchVO extends PagingVO {
    
    // 검색어를 저장하는 변수
    private String searchWord;

    // 검색 타입을 저장하는 변수 (예: 제목, 내용 등)
    private String searchType;

    // 검색 카테고리를 저장하는 변수 (예: 전자제품, 의류 등)
    private String searchCategory;

    // searchWord의 getter 메소드
    public String getSearchWord() {
        return searchWord;
    }

    // searchWord의 setter 메소드
    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    // searchType의 getter 메소드
    public String getSearchType() {
        return searchType;
    }

    // searchType의 setter 메소드
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    // searchCategory의 getter 메소드
    public String getSearchCategory() {
        return searchCategory;
    }

    // searchCategory의 setter 메소드
    public void setSearchCategory(String searchCategory) {
        this.searchCategory = searchCategory;
    }

    // 객체의 현재 상태를 문자열로 반환하는 toString 메소드
    @Override
    public String toString() {
        return "SellSearchVO [searchWord=" + searchWord + ", searchType=" + searchType + ", searchCategory="
                + searchCategory + "]";
    }
}