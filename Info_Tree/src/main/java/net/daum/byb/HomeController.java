package net.daum.byb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	final boolean top=true;
	final boolean see=false;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		int result = 2;
		ModelAndView mav=new ModelAndView("home");
		mav.addObject("top",top);
		mav.addObject("see",see);
		mav.addObject("result",result);
		return mav;	
		
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homecome(Locale locale, Model model) {
		ModelAndView mav=new ModelAndView("home");
		mav.addObject("top",top);
		return mav;	
	}
}
