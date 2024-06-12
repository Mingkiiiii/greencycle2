package com.greencycle.my.game.web;

import java.util.Map;
// 로그점검

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.greencycle.my.game.service.DamainfoService;
import com.greencycle.my.game.vo.DamainfoVO;
import com.greencycle.my.member.vo.MemberVO;

@Controller
public class DamainfoController {
	
	 private static final Logger logger = LoggerFactory.getLogger(DamainfoController.class);
    @Autowired
    DamainfoService damainfoService;

    // 다마고치 정보를 선택하고 보여주는 메서드
    @RequestMapping("/select")
    public String select(MemberVO vo, Integer damainfoNo, Model model, HttpSession session) throws Exception {
        MemberVO sessionLogin = (MemberVO) session.getAttribute("login");

        if (sessionLogin != null) {
            String userId = sessionLogin.getUserId();
            DamainfoVO damainfo = damainfoService.getDamainfo(userId);

            if (damainfoNo != null) {
                DamainfoVO dama = damainfoService.damainfoStatus(damainfoNo);
                model.addAttribute("dama", dama);
            }

            if (damainfo != null) {
                session.setAttribute("damainfoChar", damainfo.getDamainfoChar());
                model.addAttribute("damainfo", damainfo);
                return "game/gameMain";
            } else {
                return "game/characterSelect";
            }
        } else {
            return "game/characterSelect";
        }
    }

    // 다마고치 캐릭터를 선택하고 생성하는 메서드
    @RequestMapping("/gameMain")
    public String create(@RequestParam("selectedCharacter") String selectedCharacter, HttpSession session) throws Exception {
        MemberVO vo = (MemberVO) session.getAttribute("login");

        if (vo == null) {
            throw new NullPointerException("User is not logged in.");
        }
        if (selectedCharacter == null || selectedCharacter.isEmpty()) {
            throw new NullPointerException("Selected character is null or empty.");
        }

        DamainfoVO dama = new DamainfoVO();
        dama.setUserId(vo.getUserId());
        dama.setDamainfoChar(selectedCharacter);

        damainfoService.damainfoWrite(dama);
        session.setAttribute("damainfoChar", selectedCharacter);
        return "game/loadingPage"; // 변경된 경로
    }

    // 다마고치 재활용 페이지로 이동하는 메서드
    @RequestMapping("/recycling")
    public String recycling(HttpSession session, Model model) {
        MemberVO sessionLogin = (MemberVO) session.getAttribute("login");

        if (sessionLogin != null) {
            String userId = sessionLogin.getUserId();

            DamainfoVO damainfo = damainfoService.getDamainfo(userId);
            model.addAttribute("damainfo", damainfo);
        } else {
            return "redirect:/login";
        }

        return "game/recycling";
    }

    // 다마고치 상태를 업데이트하는 메서드
    @PostMapping("/updateStats")
    @ResponseBody
    public ResponseEntity<String> updateStats(HttpSession session,
                                              @RequestParam("hp") int hp,
                                              @RequestParam("happiness") int happiness,
                                              @RequestParam("ill") int ill,
                                              @RequestParam("clean") int clean,
                                              @RequestParam("food") int food
                                              ) {
        MemberVO sessionLogin = (MemberVO) session.getAttribute("login");

        if (sessionLogin == null) {
            return new ResponseEntity<>("User not logged in", HttpStatus.UNAUTHORIZED);
        }

        String userId = sessionLogin.getUserId();
        DamainfoVO damainfo = damainfoService.getDamainfo(userId);

        if (damainfo == null) {
            return new ResponseEntity<>("Damainfo not found", HttpStatus.NOT_FOUND);
        }

        damainfo.setDamainfoHp(hp);
        damainfo.setDamainfoHappniess(happiness);
        damainfo.setDamainfoClean(clean);
        damainfo.setDamainfoFood(food);
        damainfo.setDamainfoIll(ill);

        try {
            damainfoService.updateDamainfo(damainfo);
            return new ResponseEntity<>("Stats updated", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error updating stats", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 아이템을 구매하는 메서드
    @PostMapping("/purchaseItem")
    @ResponseBody
    public ResponseEntity<String> purchaseItem(HttpSession session, @RequestParam("item") String item, @RequestParam("price") int price, @RequestParam("hearts") int hearts) {
        MemberVO sessionLogin = (MemberVO) session.getAttribute("login");

        if (sessionLogin == null) {
            return new ResponseEntity<>("User not logged in", HttpStatus.UNAUTHORIZED);
        }

        String userId = sessionLogin.getUserId();
        DamainfoVO damainfo = damainfoService.getDamainfo(userId);

        if (damainfo == null) {
            return new ResponseEntity<>("Damainfo not found", HttpStatus.NOT_FOUND);
        }

        int currentPoints = Integer.parseInt(damainfo.getUserPoint().replace(",", ""));
        int updatedPoints = currentPoints - price;

        if (updatedPoints < 0) {
            return new ResponseEntity<>("Not enough points", HttpStatus.BAD_REQUEST);
        }

        int hp = 0;
        int happiness = 0;
        int clean = 0;
        int food = 0;
        int ill = 0;

        if (item.contains("Food")) {
            food = hearts;
        } else if (item.contains("Fun")) {
            happiness = hearts;
        } else if (item.contains("Medicine")) {
            ill = hearts;
        }

        try {
            damainfoService.decrementUserPoints(userId, price);
            damainfoService.incrementDamainfo(userId, hp, happiness, clean, food, ill);
            return new ResponseEntity<>("Item purchased successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error purchasing item", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    
    @PostMapping("/increaseUserPoint")
    @ResponseBody
    public ResponseEntity<String> increaseUserPoint(HttpSession session, @RequestBody Map<String, Integer> requestData) {
        MemberVO sessionLogin = (MemberVO) session.getAttribute("login");

        if (sessionLogin == null) {
            return new ResponseEntity<>("User not logged in", HttpStatus.UNAUTHORIZED);
        }

        String userId = sessionLogin.getUserId();
        int points = requestData.getOrDefault("points", 0);

        try {
            damainfoService.increaseUserPoints(userId, points);
            return new ResponseEntity<>("Points increased successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error increasing points: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }   
    
    
    

    @PostMapping("/resetTamagotchi")
    @ResponseBody
    public String resetTamagotchi(@RequestBody Map<String, String> payload) {
        String userId = payload.get("userId");
        logger.info("Received request to reset Tamagotchi for user: " + userId);
        try {
        	damainfoService.deleteTamagotchiByUserId(userId);
            logger.info("Successfully reset Tamagotchi for user: " + userId);
            return "Success";
        } catch (Exception e) {
            logger.error("Error resetting Tamagotchi for user: " + userId, e);
            return "Failure";
        }
    }
    
    
    
    

}
