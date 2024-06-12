package com.greencycle.my.cs.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.greencycle.my.commons.service.CodeService;
import com.greencycle.my.commons.vo.CodeVO;
import com.greencycle.my.cs.service.CsService;
import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.member.vo.MemberVO;

@Controller
public class CsController {
	
	@Autowired
	CsService csService; // CsService 객체를 주입받음
	
	@Autowired
    CodeService codeService; // CodeService 객체를 주입받음
	
	// 모델에 코드 목록을 추가하는 메서드
    @ModelAttribute("comList")
    public List<CodeVO> getCodeList(){
        // 코드 서비스를 통해 코드 목록을 가져와서 반환
        return codeService.getCodeList("BC00");
    }
	
    // 게시글 리스트를 조회하는 메서드
    @RequestMapping("/csView")
    public String csView(Model model, HttpSession session, @ModelAttribute("searchVO") CsSearchVO searchVO) {
        // 검색 조건에 맞는 게시글 목록을 CsService를 통해 가져옴
    	List<CsVO> csView = csService.getCsList(searchVO);
        // 모델에 게시글 목록을 추가하여 View로 전달
    	model.addAttribute("csView", csView);
        // 게시글 목록을 보여줄 View 이름 반환
        return "board/csView";
    }
    
    // 게시글 작성 화면으로 이동하는 메서드
    @RequestMapping("/csWriteView")
    public String csWriteView(HttpSession session) {
        // 로그인 여부 확인 후 로그인이 되어 있지 않으면 로그인 화면으로 리다이렉트
        if (session.getAttribute("login") == null) {
            return "redirect:/loginView";
        }
        return "board/csWriteView";
    }
    
    // 게시글 작성을 처리하는 메서드
    @RequestMapping("/csWriteDo")
    public String csWriteDo(HttpSession session, CsVO cs) throws Exception {
        // 현재 로그인된 사용자 정보를 가져와서 게시글 작성자로 설정
        MemberVO vo = (MemberVO) session.getAttribute("login");
        cs.setUserId(vo.getUserId());
        // 게시글을 작성하고 게시판 목록 화면으로 리다이렉트
        csService.cswrite(cs);
        return "redirect:/csView";
    }
    
    @RequestMapping("/csDetailView")
	public String csDetailView(int csNo, Model model) throws Exception {
		System.out.println(csNo);
		CsVO vo = csService.getCs(csNo);
//		List<ReplyVO> replyList = boardService.getReplyList(boardNo); //댓글
		model.addAttribute("cs", vo);
//		model.addAttribute("replyList", replyList); //댓글
		return "board/csDetailView";
	}
    
 // 게시글 수정 화면으로 이동하는 메서드입니다.
 		@RequestMapping(value="/csEditView", method=RequestMethod.POST)
 		public String csEditView(int csNo, Model model) throws Exception {
 			System.out.println(csNo);
 		    // 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가합니다.
 		    CsVO cs = csService.getCs(csNo);
 		    model.addAttribute("cs", cs); // 모델에 게시글 정보를 추가합니다.
 		    return "board/csEditView"; // 게시글 수정 화면의 뷰 이름을 반환합니다.
 		}	
 		
 		
 		//게시글 수정
	    @PostMapping("/csEditDo")
	    public String csEditDo(CsVO csvo) throws Exception {
	    	
	    	csService.updateCs(csvo);
            return "redirect:/csView";
	    		
	    }
	    
	 // 게시글 삭제
	    @RequestMapping(value="/csDel", method=RequestMethod.POST)
		public String csDel(int csNo, Model model) throws Exception {
		    // 게시글 번호를 이용하여 해당 게시글 정보를 가져와서 모델에 추가합니다.
		    csService.delCs(csNo);
		    return "redirect:/csView"; // 수정된 게시글 화면으로 이동하기 위해 boardView로 리다이렉트합니다.
		}
}