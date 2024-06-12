package com.greencycle.my.member.service;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.mybatis.spring.annotation.MapperScan;


import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.greencycle.my.member.vo.KakaoVO;


@Service
@MapperScan("com.my.blog.kakao.mapper")

public class KakaoService {

    

    public String getAccessToken(String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
          sb.append("&client_id=8e69821150a659375715b3ac34422db0"); //본인이 발급받은 key
//            sb.append("&client_id=dad8ef1f4c4aea8866d525818473f7e1"); //어드민 키
            sb.append("&redirect_uri=http://192.168.0.34:9090/my/kakaoLogin"); // 본인이 설정한 주소
            sb.append("&code=" + authorize_code);
            System.out.println(sb);
            bw.write(sb.toString());
            bw.flush();
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            BufferedReader br;
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답일 때
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else { // 오류 응답일 때
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            String line;
            String result = "";
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            // JSON 파싱 부분 추가
            JsonElement element = JsonParser.parseString(result);
            if (element != null && element.isJsonObject()) {
                JsonObject jsonObject = element.getAsJsonObject();
                if (jsonObject.has("access_token")) {
                    access_Token = jsonObject.get("access_token").getAsString();
                }
                if (jsonObject.has("refresh_token")) {
                    refresh_Token = jsonObject.get("refresh_token").getAsString();
                }
            }
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }


    public HashMap<String, Object> getUserInfo(String access_Token) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답일 때
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String line;
                String result = "";
                while ((line = br.readLine()) != null) {
                    result += line;
                }
                
                //파씽한 부분
                System.out.println("response body : " + result);
                JsonElement element = JsonParser.parseString(result);

                JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
                JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

                String nickname = properties.getAsJsonObject().get("nickname").getAsString();
                String email = kakao_account.getAsJsonObject().get("email").getAsString();

                userInfo.put("nickname", nickname);
                userInfo.put("email", email);
                br.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
            
        }
        
        return userInfo;
    }

  
   
    public void saveKakaoUserInfo(HashMap<String, Object> userInfo) {
        KakaoVO kakaoUser = new KakaoVO();
        
        // 여기서 userInfo에서 "id" 키를 이용하여 Kakao ID를 가져와서 설정합니다.
        String kakaoId = (String) userInfo.get("id");
        kakaoUser.setKakao_user_id(kakaoId);
        
        // 카카오 사용자의 닉네임을 설정합니다.
        kakaoUser.setNickname((String) userInfo.get("nickname"));
        
        // 카카오 사용자의 이메일을 설정합니다.
        kakaoUser.setEmail((String) userInfo.get("email"));


    }
  
        
        
    }


        
//        // 이메일과 닉네임을 userInfo에서 가져와서 설정합니다.
//        kakaoUser.setEmail((String) userInfo.get("email"));
//        kakaoUser.setNickname((String) userInfo.get("nickname"));
//        
//        
//        // 여기서 userInfo에서 "id" 키를 이용하여 Kakao ID를 가져옵니다.
//        // Long 타입이므로 String으로 형변환하여 저장합니다.
//        Long kakaoId = (Long) userInfo.get("id");
//        kakaoUser.setKakaoUserId(String.valueOf(kakaoId));
//
//        
//        // 데이터베이스에 카카오 사용자 정보를 삽입합니다.
//        kakaoUserMapper.insertKakaoUser(kakaoUser);
//    }
//
//    
//    
