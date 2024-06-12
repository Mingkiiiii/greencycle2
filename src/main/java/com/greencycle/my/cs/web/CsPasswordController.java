package com.greencycle.my.cs.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greencycle.my.board.vo.PasswordResponse;
import com.greencycle.my.cs.service.CsService;
import com.greencycle.my.cs.vo.CsVO;

@Controller
public class CsPasswordController {
    
    @Autowired
    private CsService csService;

    // @ResponseBody 어노테이션: 메소드의 반환 값이 HTTP 응답 본문으로 직접 작성됨을 나타냄
    @ResponseBody
    @RequestMapping(value="/checkBoardPassword", method=RequestMethod.POST)
    public PasswordResponse checkBoardPassword(@RequestBody CsVO vo) {
        // @RequestBody 어노테이션: HTTP 요청 본문에서 데이터를 자바 객체로 변환하여 메소드 매개변수로 전달
        // CsVO 객체로 변환된 요청 데이터를 vo 매개변수로 받음

        // csService의 checkBoardPassword 메소드를 호출하여 게시글 비밀번호를 확인함
        boolean valid = csService.checkBoardPassword(vo);
        
        // PasswordResponse 객체를 생성하여 게시글 비밀번호 확인 결과를 담은 객체를 반환함
        return new PasswordResponse(valid);
    }
}