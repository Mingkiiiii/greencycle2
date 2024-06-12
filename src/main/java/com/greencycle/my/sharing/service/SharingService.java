package com.greencycle.my.sharing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greencycle.my.sell.dao.SellDAO;
import com.greencycle.my.sell.vo.SellVO;
import com.greencycle.my.sharing.dao.SharingDAO;
import com.greencycle.my.sharing.vo.SharingSearchVO;
import com.greencycle.my.sharing.vo.SharingVO;

@Service // Spring 서비스 클래스임을 나타내는 어노테이션
public class SharingService {

    @Autowired // SharingDAO를 자동으로 주입
    SharingDAO dao;

    // 게시글 리스트를 가져오는 메소드
    public List<SharingVO> getSharingsList(SharingSearchVO searchVO) {
        int total = dao.getTotalRowCount(searchVO); // 검색 조건에 맞는 총 행 수를 가져옴
        searchVO.setTotalRowCount(total); // 검색 조건 객체에 총 행 수를 설정
        searchVO.pageSetting(); // 페이지 설정 메소드 호출
        return dao.getSharingsList(searchVO); // 검색 조건에 맞는 게시글 리스트를 가져옴
    }

    // 게시글을 삽입하는 메소드
    public void insertSharing(SharingVO vo) throws Exception {
        int result = dao.insertSharing(vo); // 게시글 삽입 결과를 가져옴
        if (result == 0) { // 삽입이 실패한 경우
            throw new Exception(); // 예외를 던짐
        }
    }

    // 특정 게시글을 가져오는 메소드
    public SharingVO getSharing(int sharingsNo) throws Exception {
        SharingVO result = dao.getSharing(sharingsNo); // 게시글 번호로 게시글을 가져옴
        if (result == null) { // 게시글이 없는 경우
            throw new Exception(); // 예외를 던짐
        }
        return result; // 게시글을 반환
    }

    // 게시글을 수정하는 메소드
    public void updateSharing(SharingVO vo) throws Exception {
        int result = dao.updateSharing(vo); // 게시글 수정 결과를 가져옴
        if (result == 0) { // 수정이 실패한 경우
            throw new Exception(); // 예외를 던짐
        }
    }

    // 게시글을 삭제하는 메소드
    public void deleteSharing(int sharingsNo) throws Exception {
        int result = dao.deleteSharing(sharingsNo); // 게시글 삭제 결과를 가져옴
        if (result == 0) { // 삭제가 실패한 경우
            throw new Exception(); // 예외를 던짐
        }
    }
}