package com.greencycle.my.sell.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.sell.vo.SellSearchVO;
import com.greencycle.my.sell.vo.SellVO;

@Mapper
public interface SellDAO {
	
	// 게시글 전체 건수
	public int getTotalRowCount(SellSearchVO searchVo);
	
	// 전체 건수 조회
	public List<SellVO> getSellsList(SellSearchVO searchVO);
	// 게시글 조회
	public List<SellVO> getSellList(SellSearchVO searchVO);
		
	// 게시글 리스트
	public List<SellVO> getSellList(SellVO sellVO);
	// 게시글 리스트
		public List<SellVO> getSellList2(SellVO sellVO);
	// 게시글 작성
	public int insertSell(SellVO vo);
	// 게시글 조회
	public SellVO getSell(int salesNo);
	// 게시글 수정
	public int updateSell(SellVO vo);
	// 게시글 삭제
	public int deleteSell(int salesNo);
	
	
}