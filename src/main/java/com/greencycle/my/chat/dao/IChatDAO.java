package com.greencycle.my.chat.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.greencycle.my.chat.vo.ChatVO;

@Mapper
public interface IChatDAO {
	// 채팅 조회
	public List<ChatVO> getRoomList();
	// 전체 채팅방 리스트
	public List<ChatVO> getRoomList(String userId); // 메서드 시그니처 변경

	// 채팅 조회
		public List<ChatVO> getRoomList2();
		// 전체 채팅방 리스트
		public List<ChatVO> getRoomList2(ChatVO vo); // 메서드 시그니처 변경
	
	// 채팅방 만들기
	public int createRoom(ChatVO vo);
	
	// 특정 채팅방의 채팅 내역 조회
	public ArrayList<ChatVO> getChat(ChatVO vo);
	
	//채팅
	public int insertChat(ChatVO vo);

	
	
	
}
