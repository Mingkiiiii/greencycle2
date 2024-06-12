package com.greencycle.my.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


import com.greencycle.my.board.service.QnaBoardService;
import com.greencycle.my.board.service.SharingStuffService;
import com.greencycle.my.board.service.SellBoardService;



@Controller
//@RequestMapping("/board")
public class BoardController {
    
//    @GetMapping("/home")
//    public String boardHome() {
//        // 게시판 홈 페이지의 로직
//        return "boardHome";
//    }
    
	@RequestMapping("/about")
    public String about() {
        // about.jsp로 이동
        return "about";
	}    
    
    //인증게시판
    @RequestMapping("/user_board")
    public String user_board() {
        return "board/user_board";

    }
    

    @Autowired
    QnaBoardService qnaBoardService;
    
    
    @RequestMapping("/qna")
    public String Qna() {
        return "board/qna";
    }
   
    @RequestMapping("/boardWriteView")
    public String BoardWriteService() {
        
    	return "board/boardWriteView";
    }
    
    // 나눔게시판
    
    @Autowired
    SharingStuffService sharingStuffService;
    
    
    @RequestMapping("/sharing_board")
    public String SharingStuffService() {
        
    	return "board/sharing_board";
    }
       
    //판매 게시판
    
    @Autowired
    SellBoardService sellBoardService;
    
    @RequestMapping("/sell_board")
    public String SellBoardService() {
        
    	return "board/sell_board";
    }

}