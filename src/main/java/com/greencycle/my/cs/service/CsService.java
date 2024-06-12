package com.greencycle.my.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greencycle.my.cs.dao.CsDao;
import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;

@Service
public class CsService {

	@Autowired
	CsDao dao;	
	
	// 게시글 목록을 가져오는 메서드
	public List<CsVO> getCsList(CsSearchVO searchVO){
		// 검색 조건에 따른 전체 건수를 조회
		int total = dao.getTotalRowCount(searchVO);
		// 전체 건수를 PaginVO에 설정
		searchVO.setTotalRowCount(total); // 수정된 부분
		// 페이지 설정을 위한 메서드 호출
		searchVO.pageSetting();
		// 게시글 목록을 조회하여 반환
		return dao.getCsList(searchVO);
	}
	
	
	public boolean checkBoardPassword(CsVO vo) {
	    // 주어진 CsVO 객체에 있는 게시글 번호를 사용하여 데이터베이스에서 해당 게시글을 검색합니다.
	    CsVO board = dao.getCss(vo);

	    // 검색된 게시글 정보를 콘솔에 출력합니다. (디버깅용)
	    System.out.println(board);

	    // 검색된 게시글이 존재하고, 해당 게시글의 비밀번호가 null이 아닌 경우를 확인합니다.
	    if (board != null && board.getCsPw() != null) {
	        // 검색된 게시글의 비밀번호와 입력된 비밀번호를 비교하여 일치 여부를 반환합니다.
	        return board.getCsPw().equals(vo.getCsPw());
	    }
	    // 검색된 게시글이 없거나 비밀번호가 null인 경우에는 false를 반환합니다.
	    return false;
	}
	
	
	// 게시글을 등록하는 메서드
			public void cswrite(CsVO cs) throws Exception {
				// dao 객체를 사용하여 게시글을 등록하고 그 결과를 확인
				int result = dao.cswrite(cs);
				// 만약 등록 결과가 실패(0)이면 예외를 발생시킴
				if(result == 0) {
					throw new Exception();
				}
			}
			
			public CsVO getCs(int csNo) throws Exception {
				CsVO result = dao.getCs(csNo);
				if(result == null) {
					throw new Exception();
				}
				return result;
			}
			
			
			public CsVO getCss(CsVO csvo) throws Exception {
				CsVO result = dao.getCss(csvo);
				if(result == null) {
					throw new Exception();
				}
				return result;
			}
			
			// 게시글을 수정하는 메서드입니다.
					public void updateCs(CsVO cs) throws Exception {
						   // DAO 객체를 사용하여 게시글을 수정하고 그 결과를 확인합니다.
						   int result = dao.updateCs(cs);
						   // 만약 수정 결과가 실패(0)이면 예외를 발생시킵니다.
						   if(result == 0) {
						       throw new Exception();
						    }
						}	
					
					// 게시글 삭제
					public void delCs(int csNo) throws Exception {
						int result = dao.delCs(csNo);
						// 만약 수정 결과가 실패(0)이면 예외를 발생시킵니다.
						if(result == 0) {
							throw new Exception();
						}
					}			
}
