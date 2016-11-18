package net.daum.byb;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Member;
import net.daum.byb.service.MemberDao;




/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	final boolean top=true;
	final boolean alert=true;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Member member;
	
	@RequestMapping(value = "/loginup", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView loginup(@ModelAttribute("member") Member member, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data = dao.selectLogin(member);
		ModelAndView mav=new ModelAndView("/home");
		mav.addObject("top",top);
		mav.addObject("alert",alert);
		if(data==null){
			mav.addObject("modal","modal");
			System.out.println("==modal=="+mav);
			return mav;
		}
		else{
			Map <String,Object> map = new HashMap<String,Object>();
			session.setAttribute("sessionnickname", data.getNickname());
			session.setAttribute("sessionpassword", data.getPassword());
			session.setAttribute("sessionepoint", data.getPoint());
			session.setAttribute("sessionemail", data.getEmail());

			return mav;
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:/home";
	}
	
	
}
