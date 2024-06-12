package com.greencycle.my.chat.web;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greencycle.my.chat.service.ChatBoardService;
import com.greencycle.my.chat.vo.ChatVO;
import com.greencycle.my.member.vo.MemberVO;



@Controller
public class ChatController {   
	
		@Autowired
		ChatBoardService chatBoardService;
	    
		@RequestMapping("/chat")
		public String chatListView(Model model, HttpSession session) {
		    // 세션에서 로그인 정보를 가져옴
		    MemberVO sessionLogin = (MemberVO) session.getAttribute("login");
		    
		    // 만약 로그인 정보가 null이라면 로그인 페이지로 이동
		    if (sessionLogin == null) {
		        return "redirect:/login"; // 로그인 페이지로 리다이렉트
		    }
		    
		    // 세션에서 userId 값을 가져옴
		    String userId = sessionLogin.getUserId(); // 적절한 메서드를 사용하여 userId를 가져와야 함
		    
		    // 전체 채팅방 리스트를 가져오는데 userId 값을 전달하여 필터링
		    List<ChatVO> roomList = chatBoardService.getRoomList(userId);
		    
		    // 모델에 전달
		    model.addAttribute("roomList", roomList);
		    
		    return "chat";
		}
		@PostMapping("/chatMake")
		public String chatMake(@ModelAttribute ChatVO chatVO, HttpSession session) throws IOException {
		    // 세션에서 로그인 사용자 정보 가져오기
		    MemberVO loginUser = (MemberVO) session.getAttribute("login");
		    // 로그인 사용자의 ID를 ChatVO에 설정
		    if (loginUser != null) {
		        chatVO.setUserId(loginUser.getUserId());
		    } else {
		        // 세션이 없거나 로그인 정보가 없는 경우 처리할 내용을 여기에 추가하십시오.
		        return "redirect:/loginView"; // 예: 로그인 페이지로 리다이렉트
		    }

		    try {
		        // salesNo 값을 roomNo로 설정
		        chatVO.setRoomNo(chatVO.getRoomNo());
		        chatVO.setBuyerId(chatVO.getUserId());
		        
		        // chatVO에 저장된 정보로 서비스 호출
		        chatBoardService.createRoom(chatVO);
		        return "redirect:/chat";
		    } catch (Exception e) {
		        e.printStackTrace();
		        // 예외 처리 필요
		        return "redirect:/chat";
		    }
		}
		@ResponseBody
		@RequestMapping("/chatDetail")
		public ArrayList<ChatVO> chatDetail(ChatVO vo, Model model, HttpSession session) throws Exception {
			List<ChatVO> room = chatBoardService.getRoomList2(vo);
		    model.addAttribute("room", room);

		    // 채팅 메시지 리스트를 가져옴
		    ArrayList<ChatVO> chat = chatBoardService.getChat(vo);
		    model.addAttribute("chat", chat);
		    return chat;
		}

		
		@MessageMapping("/hello/{roomNo}")
		@SendTo("/subscribe/chat/{roomNo}")
		public ChatVO broadcastiong(ChatVO chat) {
			System.out.println("======================================");
			System.out.println(chat);
			chatBoardService.insertChat(chat);
			return chat;
		}
	






	    
	    
	    
	    
	    

	   
	    
	    
	    
}



