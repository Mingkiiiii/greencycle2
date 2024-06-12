package com.greencycle.my.noticeqna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.noticeqna.vo.NoticeQnaSearchVO;
import com.greencycle.my.noticeqna.vo.NoticeQnaVO;

@Mapper
public interface NoticeQnaDao {
	// 게시글 조회
	public List<NoticeQnaVO> getFaqList(NoticeQnaSearchVO searchVO);
	
	// 게시글 전체 건수
	public int getTotalRowCount(NoticeQnaSearchVO searchVO);
		
	// 게시글 등록
	public int writeFaq (NoticeQnaVO vo);
	// 게시글 상세조회
	public NoticeQnaVO getFaq(int faqNo);
	// 게시글 수정
	public int updateFaq(NoticeQnaVO vo);
	// 게시글 삭제
	public int deleteFaq(int faqNo);
	
}
