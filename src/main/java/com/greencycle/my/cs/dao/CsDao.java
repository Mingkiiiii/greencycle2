package com.greencycle.my.cs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;

@Mapper
public interface CsDao {

	// 게시글 전체 건수
	public int getTotalRowCount(CsSearchVO searchVo);
	
	// 전체 건수 조회
	public List<CsVO> getCsList(CsSearchVO searchVO);
	
	// 게시글 상세조회
	public CsVO getCs(int vo);
	
	// 게시글 비밀번호
	public CsVO getCss(CsVO vo);
	
	// 게시글 등록
	public int cswrite(CsVO cs);
	
	// 게시글 수정하기
	public int updateCs(CsVO cs);
	
	// 게시글 삭제하기
	public int delCs(int csNo);
}
