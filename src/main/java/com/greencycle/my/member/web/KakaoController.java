package com.greencycle.my.member.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greencycle.my.member.service.KakaoService;
import com.greencycle.my.member.service.MemberService;
import com.greencycle.my.member.vo.MemberVO;


@Controller
public class KakaoController {
   
   @Autowired
   private KakaoService kakaoService;
   
   @Autowired
   private MemberService memberService;
   
   @RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
   public String kakaoLogin(MemberVO vo, HttpSession session, @RequestParam(value = "code", required = false) String code) throws Exception {
      System.out.println("카카오 체크");
      System.out.println("#########" + code);
      String access_Token = kakaoService.getAccessToken(code);
   
      System.out.println("###access_Token#### : " + access_Token);

      // API 호출 부분 추가
      String apiUrl = "https://kapi.kakao.com/v2/user/me";
      try {
          // HTTP 연결 설정
          URL url = new URL(apiUrl);
          HttpURLConnection conn = (HttpURLConnection) url.openConnection();
          conn.setRequestMethod("POST");
          conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
          // HTTP 요청 헤더에 액세스 토큰 추가
          conn.setRequestProperty("Authorization", "Bearer " + access_Token);

          // 응답 코드 확인
          int responseCode = conn.getResponseCode();
          if (responseCode == HttpURLConnection.HTTP_OK) {
              // 응답 읽기
              BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
              String inputLine;
              StringBuffer response = new StringBuffer();
              while ((inputLine = in.readLine()) != null) {
                  response.append(inputLine);
              }
              in.close();
              
              // 응답 출력
              System.out.println("API 응답: " + response.toString());
              
              // JSON 파싱
              ObjectMapper mapper = new ObjectMapper();
              JsonNode rootNode = mapper.readTree(response.toString());

              // 필요한 정보 추출
              String nickname = rootNode.path("properties").path("nickname").asText();
              String email = rootNode.path("kakao_account").path("email").asText();
              String thumbnailImageUrl = rootNode.path("kakao_account").path("profile").path("thumbnail_image_url").asText();

              // 추출된 정보 출력
              System.out.println("nickname: " + nickname);
              System.out.println("email: " + email);
              System.out.println("thumbnail_image_url: " + thumbnailImageUrl);
              
              // MemberVO 객체에 이메일 값을 설정
              vo.setUserId(email);
             

              // DB에서 이메일과 일치하는 멤버가 있는지 확인하여 로그인 처리
              MemberVO loggedInMember = memberService.loginMember2(vo);
              System.out.println(email);
              System.out.println(loggedInMember);
              if (loggedInMember != null) {
                  session.setAttribute("login", loggedInMember);
                  System.out.println("로그인 성공: " + loggedInMember.getUserName() + "(" + loggedInMember.getUserId() + ")");
                  // 로그인 성공 시 로직 추가
                  return "redirect:/";
              } else {
                  System.out.println("로그인 실패: 회원 정보가 존재하지 않습니다.");
                  // 로그인 실패 시 로직 추가
              }
              
          } else {
              // 오류 발생
              BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
              String line;
              while ((line = reader.readLine()) != null) {
                  System.out.println(line);
              }
              reader.close();
              System.out.println("API 호출 실패: " + responseCode);
          }
      } catch (IOException e) {
          e.printStackTrace();
      }
      
      return "home";
   }
}
