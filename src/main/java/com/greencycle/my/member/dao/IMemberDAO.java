package com.greencycle.my.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.member.vo.MemberSearchVO;
import com.greencycle.my.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {

	// 회원가입
	public int registMember(MemberVO vo);

	// 회원 정보조회
	public MemberVO getMemberList(MemberVO vo);

	// 회원조회
	public MemberVO loginMember(MemberVO vo);
	
	// 회원조회
	public MemberVO loginNo(MemberVO vo);

	// 프로필 이미지 경로 저장
	public int profileUpload(MemberVO vo);

	// 회원 아이디로 회원 조회
	public MemberVO getMemberById(String userId);

	// 이메일로 회원 아이디 조회

	// 아이디 중복 확인
	// 이메일 중복 확인
	public boolean checkExistingEmail(String userId);

	// 이메일로 회원 조회
	List<String> getMemberByEmail(String email);

	public MemberVO getcheckExistingIdByEmail(String userId);

	public String getExistingIdByEmail(String userId);

	// 업데이트
	public int updateMember(MemberVO vo);

	// 이메일 변경
	public int updateUserEmail(MemberVO member);

	// 회원 전체 건수 조회
	public List<MemberVO> getAllUsers(MemberSearchVO searchVO);

	// 회원 전체 건수
	public int getTotalRowCount(MemberSearchVO searchVO);

	/*
	 * // 전체 건수 조회 public List<CsVO> getCsList(CsSearchVO searchVO);
	 */

	// 회원 등급 수정
	int updateUsersGrades(Map<String, Object> parameters);

	// 카카오로그인
	public MemberVO loginMember2(MemberVO vo);

}
