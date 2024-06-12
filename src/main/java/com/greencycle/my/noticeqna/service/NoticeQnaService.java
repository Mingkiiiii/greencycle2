package com.greencycle.my.noticeqna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.noticeqna.dao.NoticeQnaDao;
import com.greencycle.my.noticeqna.vo.NoticeQnaSearchVO;
import com.greencycle.my.noticeqna.vo.NoticeQnaVO;


@Service
public class NoticeQnaService {
	
	@Autowired
	NoticeQnaDao dao;
	
	public List<NoticeQnaVO> getFaqList(NoticeQnaSearchVO searchVO) {
		// 검색 조건에 따른 전체 건수를 조회
		int total = dao.getTotalRowCount(searchVO);
		// 전체 건수를 PaginVO에 설정
		searchVO.setTotalRowCount(total); 
		// 페이지 설정을 위한 메서드 호출
		searchVO.pageSetting();
        return dao.getFaqList(searchVO);
    }
	

	//게시글 등록
	public void writeFaq(NoticeQnaVO vo) throws Exception {
		int result = dao.writeFaq(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	public NoticeQnaVO getFaq(int faqNo) throws Exception {
		NoticeQnaVO result = dao.getFaq(faqNo);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	// 게시글 수정
	public void updateFaq(NoticeQnaVO vo) throws Exception {
		int result = dao.updateFaq(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	// 게시글 삭제
	public void deleteFaq(int faqNo) throws Exception {
		int result = dao.deleteFaq(faqNo);
		if(result == 0) {
			throw new Exception();
		}
	}
}

