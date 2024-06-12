package com.greencycle.my.sharing.web;

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
import com.greencycle.my.sell.vo.SellVO;
import com.greencycle.my.sharing.service.SharingService;
import com.greencycle.my.sharing.vo.SharingSearchVO;
import com.greencycle.my.sharing.vo.SharingVO;

@Controller
public class SharingController {
	@Autowired
	SharingService sharingService;
	
	@RequestMapping("/sharingView")
    public String sharingView(Model model, HttpSession session, @ModelAttribute("searchVO") SharingSearchVO searchVO) {
        List<SharingVO> sharingList = sharingService.getSharingsList(searchVO);
        model.addAttribute("sharingList", sharingList);
        return "board/sharingView";
    }
	
	 @RequestMapping("/sharingWrite")
	 public String sharingWrite() {
	     return "board/sharingWrite";
	 }
	 @PostMapping("/sharingWriteDo")
	    public String sharingWriteDo(@ModelAttribute SharingVO sharingVO, 
	                                @RequestParam("file") MultipartFile file, 
	                                HttpSession session) throws IOException {
	        // 웹 접근 가능한 경로 설정
	        String webPath = "/resources/sharing/";
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
	            sharingVO.setSharingsImage(webPath + fileName);

	            // 세션에서 로그인 사용자 정보 가져오기
	            MemberVO loginUser = (MemberVO) session.getAttribute("login");
	            // 로그인 사용자의 ID를 RecipeVO에 설정
	            if (loginUser != null) {
	            	sharingVO.setUserId(loginUser.getUserId());
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
	        	sharingService.insertSharing(sharingVO);
	            return "redirect:/sharingView";
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 예외 처리 필요
	            return "errorPage";
	        }
	        
	    }
	 @RequestMapping("/sharingDetail")
		public String sharingDetail(int sharingsNo, Model model) throws Exception {
			System.out.println(sharingsNo);
			SharingVO vo = sharingService.getSharing(sharingsNo);
			model.addAttribute("sharing", vo);
			
			return "board/sharingDetail";
		}
	// 게시글 수정 뷰이동
	    @RequestMapping(value="/sharingEdit", method=RequestMethod.POST)
		public String sharingEdit(int sharingsNo, Model model) throws Exception {
			System.out.println(sharingsNo);
			SharingVO vo = sharingService.getSharing(sharingsNo);
			model.addAttribute("sharing", vo);
			
			return "board/sharingEdit";
		}
	 // 게시글 수정
	    @PostMapping("/sharingEditDo")
	    public String sharingEdit(@ModelAttribute SharingVO sharingVO, 
	                             @RequestParam("file") MultipartFile file, 
	                             HttpSession session) throws IOException {
	        // 웹 접근 가능한 경로 설정
	        String webPath = "/resources/sharing/";
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
	           
	            sharingVO.setSharingsImage(webPath + fileName);

	            // 세션에서 로그인 사용자 정보 가져오기
	            MemberVO loginUser = (MemberVO) session.getAttribute("login");
	            // 로그인 사용자의 ID를 RecipeVO에 설정
	            if (loginUser != null) {
	                sharingVO.setUserId(loginUser.getUserId());
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 업로드 실패 시 예외 처리 필요
	            return "errorPage";
	        }

	        try {
	            // recipeVO에 저장된 이미지 경로를 바탕으로 서비스 호출
	            sharingService.updateSharing(sharingVO);
	            return "redirect:/sharingView";
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 예외 처리 필요
	            return "errorPage";
	        }
	    }
	  //게시글 삭제
		@RequestMapping(value="/sharingDel", method=RequestMethod.POST)
		public String sharingDel(int sharingsNo) throws Exception {
			sharingService.deleteSharing(sharingsNo);
			return "redirect:/sharingView";
		}
		

}
