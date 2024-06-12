package com.greencycle.my.noticeqna.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.greencycle.my.commons.service.CodeService;
import com.greencycle.my.commons.vo.CodeVO;
import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.member.vo.MemberVO;
import com.greencycle.my.noticeqna.service.NoticeQnaService;
import com.greencycle.my.noticeqna.vo.NoticeQnaSearchVO;
import com.greencycle.my.noticeqna.vo.NoticeQnaVO;



@Controller
public class NoticeQnaController {
	
	@Autowired
    CodeService codeService; // CodeService 객체를 주입받음
	
	@Autowired
	NoticeQnaService noticeQnaService;
    
	@RequestMapping("/FAQ")
    public String faqView(Model model, HttpSession session, @ModelAttribute("searchVO") NoticeQnaSearchVO searchVO) {
        List<NoticeQnaVO> faqList = noticeQnaService.getFaqList(searchVO);
        model.addAttribute("faqList", faqList);
        return "board/notice_Qna";
    }
	
	/*
	 * // 모델에 코드 목록을 추가하는 메서드
	 * 
	 * @ModelAttribute("comList") public List<CodeVO> getCodeList(){ // 코드 서비스를 통해
	 * 코드 목록을 가져와서 반환 return codeService.getCodeList("BC00"); }
	 */
   
		
	
	@RequestMapping("/faqWriteView")
	public String faqWriteView(HttpSession session) {
		return "board/faqWriteView";
	}
	@RequestMapping("/faqWriteDo")
	public String faqWriteDo(HttpSession session, NoticeQnaVO faq) throws Exception {
		MemberVO vo = (MemberVO) session.getAttribute("login");
		faq.setUserId(vo.getUserId());
		noticeQnaService.writeFaq(faq);
		return "redirect:/FAQ";
		
	}

	@RequestMapping("/faqDetailView")
	public String faqDetailView(int faqNo, Model model) throws Exception {
		System.out.println(faqNo);
		NoticeQnaVO vo = noticeQnaService.getFaq(faqNo);
//		List<ReplyVO> replyList = boardService.getReplyList(boardNo); //댓글
		model.addAttribute("faq", vo);
//		model.addAttribute("replyList", replyList); //댓글
		
		return "board/faqDetailView";
	}
	@RequestMapping(value="/faqEditView", method=RequestMethod.POST)
	public String faqEditView(int faqNo, Model model) throws Exception {
		System.out.println(faqNo);
		NoticeQnaVO vo = noticeQnaService.getFaq(faqNo);
		model.addAttribute("faq", vo);
		
		return "board/faqEditView";
	}
	
	// 게시글 수정
	@RequestMapping(value="/faqEditDo")
	public String faqEditView(NoticeQnaVO vo, Model model) throws Exception {
		noticeQnaService.updateFaq(vo);
		return "redirect:/FAQ";
	}
	
	// 게시글 삭제
	@RequestMapping(value="/faqDel", method=RequestMethod.POST)
	public String faqDel(int faqNo) throws Exception {
		noticeQnaService.deleteFaq(faqNo);
		return "redirect:/FAQ";
	}
}
