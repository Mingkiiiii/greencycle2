package com.greencycle.my;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.greencycle.my.sell.service.SellService;
import com.greencycle.my.sell.vo.SellSearchVO;
import com.greencycle.my.sell.vo.SellVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	SellService sellService;
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model, @ModelAttribute("searchVO") SellSearchVO searchVO) {
        logger.info("Welcome home! The client locale is {}.", locale);
        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        
        String formattedDate = dateFormat.format(date);
        List<SellVO> sellList = sellService.getSellList(searchVO);
        model.addAttribute("sellList", sellList);
        model.addAttribute("serverTime", formattedDate );
        
        return "home";
    }
    
    /**
     * Handles requests for the start page.
     */
    @RequestMapping(value = "/start", method = RequestMethod.GET)
    public String start() {
        return "game/start";
    }
    
//    분리수거 모델
    @RequestMapping("/recycle")
	public String recycle() {
		return "recycle/cycle";
	}
	@RequestMapping("/glass")
	public String glass() {
		return "recycle/glass";
	}
	@RequestMapping("/battery")
	public String battery() {
		return "recycle/battery";
	}
	@RequestMapping("/plasticbag")
	public String plasticbag() {
		return "recycle/plasticbag";
	}
	@RequestMapping("/can")
	public String can() {
		return "recycle/can";
	}
	@RequestMapping("/fluorescentlamp")
	public String fluorescentlamp() {
		return "recycle/fluorescentlamp";
	}
	@RequestMapping("/paper")
	public String paper() {
		return "recycle/paper";
	}
	@RequestMapping("/pet")
	public String pet() {
		return "recycle/pet";
	}
	@RequestMapping("/plastic")
	public String plastic() {
		return "recycle/plastic";
	}
	@RequestMapping("/styroform")
	public String styroform() {
		return "recycle/styroform";
	}
	@RequestMapping("/trash")
	public String trash() {
		return "recycle/trash";
	}
}
