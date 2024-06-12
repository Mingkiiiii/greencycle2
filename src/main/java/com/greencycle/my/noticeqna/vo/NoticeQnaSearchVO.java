package com.greencycle.my.noticeqna.vo;

import com.greencycle.my.commons.vo.PagingVO;

public class NoticeQnaSearchVO extends PagingVO{
	
	private String searchWord;
	private String searchType;
	private String searchCategory;
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	
	@Override
	public String toString() {
		return "NoticeQnaSearchVO [searchWord=" + searchWord + ", searchType=" + searchType + ", searchCategory="
				+ searchCategory + "]";
	}
	

}
