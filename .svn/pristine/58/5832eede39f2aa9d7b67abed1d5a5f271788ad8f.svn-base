package com.greencycle.my.sell.web;

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


import com.greencycle.my.member.vo.MemberVO;
import com.greencycle.my.sell.service.SellService;
import com.greencycle.my.sell.vo.SellSearchVO;
import com.greencycle.my.sell.vo.SellVO;

@Controller
public class SellController {
	@Autowired
	SellService sellService;
	
	@RequestMapping("/sellView")
    public String sellView(Model model, HttpSession session, @ModelAttribute("searchVO") SellSearchVO searchVO) {
        List<SellVO> sellList = sellService.getSellList(searchVO);
        model.addAttribute("sellList", sellList);
        return "board/sellView";
    }

	
	 @RequestMapping("/sellWrite")
	 public String sellWrite() {
	     return "board/sellWrite";
	 }
	 @PostMapping("/sellWriteDo")
	    public String sellWriteDo(@ModelAttribute SellVO sellVO, 
	                                @RequestParam("file") MultipartFile file, 
	                                HttpSession session) throws IOException {
	        // 웹 접근 가능한 경로 설정
	        String webPath = "/resources/sell/";
	        // 서버 저장 폴더 경로
	        String folderPath = session.getServletContext().getRealPath(webPath);

	        // 파일이 업로드될 실제 경로
	        File folder = new File(folderPath);
	        if (!folder.exists()) {
	            folder.mkdirs(); // 폴더가 존재하지 않으면 생성
	        }

	        // 파일 이름 설정
	        String fileName = file.getOriginalFilename();
	        String filePath = folderPath + File.separator + fileName;

	        // 파일 업로드
	        try {
	            file.transferTo(new File(filePath));
	            // 파일 경로를 RecipeVO에 저장
	            sellVO.setSalesImage(webPath + fileName);

	            // 세션에서 로그인 사용자 정보 가져오기
	            MemberVO loginUser = (MemberVO) session.getAttribute("login");
	            // 로그인 사용자의 ID를 RecipeVO에 설정
	            if (loginUser != null) {
	                sellVO.setUserId(loginUser.getUserId());
	            } else {
	                // 세션이 없거나 로그인 정보가 없는 경우 처리할 내용을 여기에 추가하십시오.
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 업로드 실패 시 예외 처리 필요
	            return "errorPage";
	        }

	        try {
	            // recipeVO에 저장된 이미지 경로를 바탕으로 서비스 호출
	            sellService.insertSell(sellVO);
	            return "redirect:/sellView";
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 예외 처리 필요
	            return "errorPage";
	        }
	        
	    }
	 @RequestMapping("/sellDetail")
		public String sellDetail(int salesNo, Model model) throws Exception {
			System.out.println(salesNo);
			SellVO vo = sellService.getSell(salesNo);
			model.addAttribute("sell", vo);
			
			return "board/sellDetail";
		}
	// 게시글 수정 뷰이동
	    @RequestMapping(value="/sellEdit", method=RequestMethod.POST)
		public String sellEdit(int salesNo, Model model) throws Exception {
			System.out.println(salesNo);
			SellVO vo = sellService.getSell(salesNo);
			model.addAttribute("sell", vo);
			
			return "board/sellEdit";
		}
	 // 게시글 수정
	    @PostMapping("/sellEditDo")
	    public String sellEdit(@ModelAttribute SellVO sellVO, 
	                             @RequestParam("file") MultipartFile file, 
	                             HttpSession session) throws IOException {
	        // 웹 접근 가능한 경로 설정
	        String webPath = "/resources/sell/";
	        // 서버 저장 폴더 경로
	        String folderPath = session.getServletContext().getRealPath(webPath);

	        // 파일이 업로드될 실제 경로
	        File folder = new File(folderPath);
	        if (!folder.exists()) {
	            folder.mkdirs(); // 폴더가 존재하지 않으면 생성
	        }

	        // 파일 이름 설정
	        String fileName = file.getOriginalFilename();
	        String filePath = folderPath + File.separator + fileName;

	        // 파일 업로드
	        try {
	            file.transferTo(new File(filePath));
	           
	            sellVO.setSalesImage(webPath + fileName);

	            // 세션에서 로그인 사용자 정보 가져오기
	            MemberVO loginUser = (MemberVO) session.getAttribute("login");
	            // 로그인 사용자의 ID를 RecipeVO에 설정
	            if (loginUser != null) {
	                sellVO.setUserId(loginUser.getUserId());
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 업로드 실패 시 예외 처리 필요
	            return "errorPage";
	        }

	        try {
	            // recipeVO에 저장된 이미지 경로를 바탕으로 서비스 호출
	            sellService.updateSell(sellVO);
	            return "redirect:/sellView";
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 예외 처리 필요
	            return "errorPage";
	        }
	    }
	  //게시글 삭제
		@RequestMapping(value="/sellDel", method=RequestMethod.POST)
		public String sellDel(int salesNo) throws Exception {
			sellService.deleteSell(salesNo);
			return "redirect:/sellView";
		}
		
		
		
		
		

}
