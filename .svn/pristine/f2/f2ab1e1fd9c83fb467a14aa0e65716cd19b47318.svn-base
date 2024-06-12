package com.greencycle.my.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.MediaType;

import com.greencycle.my.member.service.MemberService;
import com.greencycle.my.member.vo.MemberVO;



import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.MediaType;

import com.greencycle.my.cs.vo.CsSearchVO;
import com.greencycle.my.cs.vo.CsVO;
import com.greencycle.my.member.service.MemberService;
import com.greencycle.my.member.vo.MemberSearchVO;
import com.greencycle.my.member.vo.MemberVO;

@Controller
public class MemberController {
    
    @Autowired
    MemberService memberService;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @RequestMapping("/registView")
    public String registView() {
        return "member/registView";
    }
    
    @RequestMapping("/registDo")
    public String registDo(HttpServletRequest request
            , MemberVO member, RedirectAttributes re) {
        member.setUserPw(passwordEncoder.encode(request.getParameter("userPw")));
        System.out.println(member);
        try {
            memberService.registMember(member);
        } catch (Exception e) {
            e.printStackTrace();
            return "errorView";
        }
        re.addFlashAttribute("msg", "회원가입이 정상적으로 처리 되었습니다.");
        return "redirect:/";
    }
    
    @RequestMapping("/loginView")
    public String loginView(HttpServletRequest req, Model model) {
        String reqURL = req.getHeader("Referer");
        model.addAttribute("fromURL", reqURL);
        return "member/loginView";
    }
    
    @RequestMapping("/loginDo")
    public String loginDo(MemberVO vo, HttpSession session, boolean remember, String fromUrl, RedirectAttributes re, HttpServletResponse resp) {
    	MemberVO login = memberService.loginMember(vo);
        if(login == null) {
        	System.out.println("dd");
            re.addFlashAttribute("msg", "아이디/비번을 확인해 주세요.");
            return "redirect:/loginView";
        }
        
        boolean match = passwordEncoder.matches(vo.getUserPw(), login.getUserPw());
        if(!match) {
            re.addFlashAttribute("msg", "비번을 확인해 주세요.");
            return "redirect:/loginView";
        }
        MemberVO loginNo = memberService.loginNo(vo);
     // 정지된 계정인 경우
        if("Y".equals(loginNo.getUserBanned())) {
            re.addFlashAttribute("msg", "해당 아이디는 정지된 계정입니다.");
            return "redirect:/loginView";
        }else {
        	session.setAttribute("login", login);
        }

        

        // 세션에 저장된 정보 확인
        MemberVO sessionLogin = (MemberVO) session.getAttribute("login");
        System.out.println("Logged in user: " + sessionLogin);
        re.addFlashAttribute("msg", "로그인 되셨습니다.");
        return "redirect:/";
    }

  

    
    
    
    @RequestMapping("/logoutDo")
    public String logoutDo (HttpSession session, RedirectAttributes re) {
        session.invalidate();
        re.addFlashAttribute("msg", "로그아웃 되셨습니다.");
        return "redirect:/";
    }
    
    @RequestMapping("/mypageView")
	public String mypageView(HttpSession session, Model model) {
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "mypage/mypageView";
	}
    
    @RequestMapping("/updateDo")
	public String updateMember(MemberVO vo, HttpSession session, RedirectAttributes re) {
	    try {
	    	
	    	MemberVO login = (MemberVO) session.getAttribute("login");
	        memberService.updateMember(vo);
	        login.setUserNick(vo.getUserNick());
	        session.setAttribute("login", login);
	        re.addFlashAttribute("msg", "수정되었습니다.");
	    } catch (Exception e) {
	        re.addFlashAttribute("msg", "수정실패 ! 다시 시도해 주세요.");
	    }
	    return "redirect:/mypageView";
	}
    
    @PostMapping("/files/upload")
    public ResponseEntity<?> uploadFiles(
            @RequestParam("uploadImage") MultipartFile uploadImage
            ,HttpSession session) throws Exception {
        String webPath = "/resources/mypage/";
        String folderPath = session.getServletContext().getRealPath(webPath);
        MemberVO login = (MemberVO) session.getAttribute("login");
        String imgPath=
                memberService.uploadProfile(login, folderPath, webPath, uploadImage);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("message","success");
        map.put("imgPath", imgPath);
        
        return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
        
    }
    
//    @ResponseBody
//    @GetMapping("/checkExistingId")
//    public  ResponseEntity<?> checkExistingId(@RequestParam("memId") String memId) {
//        boolean existingId = memberService.checkExistingId(memId);
//        Map<String, Object> map = new HashMap<String, Object>();
//        
//        if (existingId) {
////            return new ResponseEntity<>("이미 존재하는 아이디입니다.", HttpStatus.BAD_REQUEST);
//        	map.put("msg", "이미 존재하는 아이디입니다.");
//        } else {
////            return new ResponseEntity<>("아이디 사용 가능", HttpStatus.OK);
//        	map.put("msg", "아이디 사용 가능.");
//        }
//        return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
//    }
    
//    checkExistingEmail
    
    @ResponseBody
    @GetMapping("/checkExistingEmail")
    public  ResponseEntity<?> checkExistingEmail(@RequestParam("userId") String userId) {
        boolean existingId = memberService.checkExistingEmail(userId);
        Map<String, Object> map = new HashMap<String, Object>();
        
        if (existingId) {
//            return new ResponseEntity<>("이미 존재하는 아이디입니다.", HttpStatus.BAD_REQUEST);
        	map.put("msg", "이미 존재하는 이메일입니다.");
        } else {
//            return new ResponseEntity<>("아이디 사용 가능", HttpStatus.OK);
        	map.put("msg", "이메일 사용 가능.");
        }
        return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
    }
   
    @ResponseBody
    @GetMapping("/checkMemberIdByEmail")
    public ResponseEntity<?> checkMemberIdByEmail(MemberVO vo) {
        
    	System.out.println(vo);
    	String memberId = memberService.checkExistingIdByEmail(vo);
        Map<String, Object> map = new HashMap<String, Object>();

        if (memberId != null) {
            map.put("msg", "ID는 " + memberId);
        } else {
            map.put("msg", "존재하지 않는 이메일입니다.");
        }
        return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
    }
    
    @ResponseBody
    @PostMapping("/changeEmail")
    public ResponseEntity<?> changeEmail(@RequestParam("newEmail") String newEmail, HttpSession session) {
        // 현재 로그인한 사용자 정보 가져오기
        MemberVO login = (MemberVO) session.getAttribute("login");
        
        // 새 이메일을 사용자 정보에 업데이트
//        login.setMemEmail(newEmail);
        
        // 이메일 변경을 위한 서비스 메서드 호출
        boolean success = memberService.updateUserEmail(login);
        
        // 변경 결과에 따라 응답 생성
        Map<String, Object> map = new HashMap<>();
        if (success) {
            map.put("success", true);
        } else {
            map.put("success", false);
        }
        return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
    }
    
    
    
    @PostMapping("/updateUsersGrades")
    public ResponseEntity<String> updateUsersGrades(@RequestBody List<Map<String, Object>> changes) {
        try {
            boolean success = memberService.updateUsersGrades(changes);
            if (success) {
                return ResponseEntity.ok("회원 등급 업데이트가 성공적으로 처리되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("회원 등급 업데이트에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("회원 등급 업데이트 중 오류가 발생하였습니다.");
        }
    }
    

    
    
    @RequestMapping("/memdataView")
    public String memdataView(Model model, HttpSession session, @ModelAttribute("searchVO") MemberSearchVO searchVO) {
        // DB에서 모든 회원 정보를 조회하는 메서드 호출
        List<MemberVO> memberList = memberService.getAllUsers(searchVO);
        // 조회된 회원 정보를 모델에 담아서 전달
        model.addAttribute("memberList", memberList);
        return "member/memdataView";
    }
    
    
	/*
	 * @RequestMapping("/memdataView") public String memdataView(Model model) { //
	 * DB에서 모든 회원 정보를 조회하는 메서드 호출 List<MemberVO> memberList =
	 * memberService.getAllUsers(); // 조회된 회원 정보를 모델에 담아서 전달
	 * model.addAttribute("memberList", memberList); return "member/memdataView"; }
	 */
	
	@RequestMapping("/memberSearch")
	 public String memberSearch() {
	     return "member/memberSearch";
	 }
    
	/*
	 * @RequestMapping("/users") public String memberdataView(Model model) { // 회원
	 * 목록을 가져와서 모델에 추가 List<MemberVO> memberList = memberService.getAllUsers(null);
	 * model.addAttribute("memberList", memberList); return "member/memdataView"; }
	 */
    
    
    }
    