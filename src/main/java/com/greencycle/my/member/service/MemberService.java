package com.greencycle.my.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.member.dao.IMemberDAO;
import com.greencycle.my.member.vo.MemberSearchVO;
import com.greencycle.my.member.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private IMemberDAO dao;

	// 회원가입
	public void registMember(MemberVO vo) throws Exception {
		int result = dao.registMember(vo);
		if (result == 0) {
			throw new Exception();
		}
	}

	public MemberVO loginMember(MemberVO vo) {
		return dao.loginMember(vo);
	}
	
	public MemberVO loginNo(MemberVO vo) {
		return dao.loginMember(vo);
	}


//	// 회원 아이디 중복 여부 확인
//	public boolean checkExistingId(String userId) {
//		MemberVO member = dao.getMemberById(userId);
//		return member != null;
//	}

	
	public boolean checkExistingEmail(String userId) {
		MemberVO member = dao.getMemberById(userId);
		return member != null;
	}

	// 업데이트
	public void updateMember(MemberVO vo) throws Exception {
		int result = dao.updateMember(vo);
		if (result == 0) {
			throw new Exception();
		}
	}
	public String checkExistingIdByEmail(MemberVO vo) {
//	    if (vo.getMemEmail() != null && !vo.getMemEmail().isEmpty()) {
//	        return dao.checkMemberIdByEmail(vo);
//	    } else {
		return null; // 이메일이 null이거나 비어있는 경우 null 반환
//	    }
	}

	public String uploadProfile(MemberVO vo, String uploadDir, String webPath, MultipartFile file) throws Exception {
		String originFileName = file.getOriginalFilename();
		String storedFileName = UUID.randomUUID().toString() + "_" + originFileName;
		String dbFilePath = webPath + storedFileName;
		Path filePath = Paths.get(uploadDir, storedFileName);
		try {
			Files.copy(file.getInputStream(), filePath);
		} catch (IOException e) {
			throw new Exception("프로필 이미지를 저장하는데 실패했습니다.", e);
		}
		vo.setUserProfile(dbFilePath);
		int result = dao.profileUpload(vo);
		if (result == 0) {
			throw new Exception("프로필 이미지 경로를 DB에 저장하는데 실패했습니다.");
		}
		return dbFilePath;
		
	}

	public boolean updateUserEmail(MemberVO member) {
		try {
			int rowsAffected = dao.updateUserEmail(member);
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<MemberVO> getAllUsers(MemberSearchVO searchVO) {
		// 검색 조건에 따른 전체 회원 수를 조회
		int total = dao.getTotalRowCount(searchVO);
		// 조회된 전체 회원 수를 searchVO 객체에 설정
		searchVO.setTotalRowCount(total);
		// 페이지 설정을 위해 searchVO 객체의 pageSetting 메서드를 호출
		searchVO.pageSetting();
		// 검색 조건에 맞는 회원 목록을 조회하여 반환
		return dao.getAllUsers(searchVO);
	}


    
    
    
	/*
	 * public List<MemberVO> getAllUsers(MemberSearchVO searchVO) { return
	 * dao.getAllUsers(searchVO); }
	 */
   
    
    
    public boolean updateUsersGrades(List<Map<String, Object>> changes) {
    	System.out.println(changes);
        try {
            for (Map<String, Object> change : changes) {
                int rowsAffected = dao.updateUsersGrades(change);
                if (rowsAffected == 0) {
                    return false;
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    카카오로그인
	public MemberVO loginMember2(MemberVO vo) {
		return dao.loginMember2(vo);
	}



}
