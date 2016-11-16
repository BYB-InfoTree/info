package net.daum.byb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSesson;
	@Autowired
	private Member member;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	final boolean top=true;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		ModelAndView mav=new ModelAndView("home");
		mav.addObject("top",top);
		return mav;	
		
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView memberInsert(Locale locale, Model model) {
		ModelAndView mav=new ModelAndView("home");
		mav.addObject("top",top);
		return mav;	
	}
}
