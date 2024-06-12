package com.greencycle.my.chat.service;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.greencycle.my.board.dao.IBoardDAO;
import com.greencycle.my.chat.dao.IChatDAO;
import com.greencycle.my.chat.vo.ChatVO;


@Service
public class ChatBoardService {
	
	@Autowired
	IChatDAO dao;
	
	// 전체 채팅방 리스트 가져오기, userId를 사용하여 필터링
	public List<ChatVO> getRoomList(String userId) {
	    return dao.getRoomList(userId);
	}
	
	public List<ChatVO> getRoomList2(ChatVO vo) {
	    return dao.getRoomList2(vo);
	}
	//채팅방 생성
	public void createRoom(ChatVO vo) {
	 // 비밀번호를 DAO에 전달하기 위해 RoomVO 객체에 설정
		
		dao.createRoom(vo);
	}

		
	public ArrayList<ChatVO> getChat(ChatVO vo) throws Exception {
		ArrayList<ChatVO> result = dao.getChat(vo);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	public int insertChat(ChatVO vo) {
		return dao.insertChat(vo);
	}
		
		
	
		
}
