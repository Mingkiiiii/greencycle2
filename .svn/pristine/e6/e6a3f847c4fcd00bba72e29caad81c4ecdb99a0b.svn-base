package com.greencycle.my.sharing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greencycle.my.sell.vo.SellVO;
import com.greencycle.my.sharing.vo.SharingSearchVO;
import com.greencycle.my.sharing.vo.SharingVO;

@Mapper
public interface SharingDAO {

	// 전체 건수 조회
	public int getTotalRowCount(SharingSearchVO searchVO);

	// 게시글 조회
	public List<SharingVO> getSharingsList(SharingSearchVO searchVO);

	// 게시글 작성
	public int insertSharing(SharingVO vo);

	// 게시글 조회
	public SharingVO getSharing(int sharingsNo);

	// 게시글 수정
	public int updateSharing(SharingVO vo);

	// 게시글 삭제
	public int deleteSharing(int sharingsNo);

}
