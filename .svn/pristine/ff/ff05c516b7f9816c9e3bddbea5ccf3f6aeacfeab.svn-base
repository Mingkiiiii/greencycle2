package com.greencycle.my.commons.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.greencycle.my.commons.service.MailService;
import com.greencycle.my.commons.vo.MailVO;

@Controller
@EnableAsync  // 비동기 기능을 활성화 (복잡한 스레드 관리 없이 비동기 쉽게 처리) 
public class MailController {
	
	@Autowired
	private MailService mailService;
	
    @RequestMapping(value = "/sendMailDo", method = RequestMethod.POST)
    public String sendMailDo(MailVO mailVO, RedirectAttributes re) throws UnsupportedEncodingException {
        System.out.println(mailVO);
        List<String> arr = mailVO.getEmail();
        for(String email : arr) {
            mailService.sendMail(email, mailVO.getTitle(), mailVO.getContent());
        }
        re.addFlashAttribute("msg", "메일이 전송되었습니다.");
        return "redirect:/admin";
    }
    
    @PostMapping("/sendEmail")
    public ResponseEntity<?> sendEmail(@RequestParam("email") String email, HttpSession session) {
        System.out.println(email);
        Map<String, Object> map = new HashMap<>();
        if(email.equals("")) {
            map.put("code", "N");
            map.put("msg", "메일 입력은 필수 입니다.");
        } else {
            String randomCode = generateRandomCode();
            // Store the code in session
            session.setAttribute("randomCode", randomCode);

            String subject = "회원가입 코드";
            String content = "greencycle에  가입해주셔서 감사합니다.\n회원가입을 위한 코드는 " + randomCode + " 입니다.";
            try {
                mailService.sendMail(email, subject, content);
                map.put("code", "Y");
                map.put("msg", "이메일이 성공적으로 전송되었습니다.");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                map.put("code", "N");
                map.put("msg", "이메일 전송 중 오류가 발생하였습니다.");
            }
        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
    private String generateRandomCode() {
        Random random = new Random();
        int randomCode = 100000 + random.nextInt(900000);
        return Integer.toString(randomCode);
    }
    
    @PostMapping("/verifyCode")
    public ResponseEntity<?> verifyCode(@RequestParam("code") String userCode, HttpSession session) {
        String storedCode = (String) session.getAttribute("randomCode"); // Correct retrieval from session

        if (userCode != null && userCode.equals(storedCode)) {
            return ResponseEntity.ok(Map.of("code", "Y", "msg", "인증번호가 정확합니다."));
        } else {
            return ResponseEntity.ok(Map.of("code", "N", "msg", "인증번호가 일치하지 않습니다."));
        }
    }
    
}