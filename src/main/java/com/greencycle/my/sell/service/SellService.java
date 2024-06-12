package com.greencycle.my.sell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.sell.dao.SellDAO;
import com.greencycle.my.sell.vo.SellSearchVO;
import com.greencycle.my.sell.vo.SellVO;

@Service
public class SellService {
	@Autowired
	SellDAO dao;
	
	// 게시글 목록을 가져오는 메서드
		public List<SellVO> getSellList(SellSearchVO searchVO){
			// 검색 조건에 따른 전체 건수를 조회
			int total = dao.getTotalRowCount(searchVO);
			// 전체 건수를 PaginVO에 설정
			searchVO.setTotalRowCount(total); // 수정된 부분
			// 페이지 설정을 위한 메서드 호출
			searchVO.pageSetting();
			// 게시글 목록을 조회하여 반환
			return dao.getSellsList(searchVO);
		}
		
		
	
	
	/*
	 * public List<SellVO> getSellList() { return dao.getSellList(); }
	 */
	public void insertSell(SellVO vo) throws Exception {
        int result = dao.insertSell(vo);
        if(result == 0) {
            throw new Exception();
        }
    }
	public SellVO getSell(int salesNo) throws Exception {
		SellVO result = dao.getSell(salesNo);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	 // 게시글 수정
 	public void updateSell(SellVO vo) throws Exception {
 		int result = dao.updateSell(vo);
 		if(result == 0) {
 			throw new Exception();
 		}
 	}
 // 게시글 삭제
  	public void deleteSell(int salesNo) throws Exception {
  		int result = dao.deleteSell(salesNo);
  		if(result == 0) {
  			throw new Exception();
  		}
  	}
	
}
