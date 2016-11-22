package net.daum.byb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Member;
import net.daum.byb.service.MemberDao;


@Controller
public class logInController {

	@Autowired
	private SqlSession sqlSesson;
	
	final boolean top = true;
	final boolean see = true;
	
	@RequestMapping(value = "/logIn", method = RequestMethod.POST)
	public ModelAndView logIn(@ModelAttribute("member") Member member, HttpSession session) {
		MemberDao dao =sqlSesson.getMapper(MemberDao.class);
		Member data = dao.selectLogin(member);
		ModelAndView mav = new ModelAndView("home");
		if(data == null){
			mav.addObject("modal", "modal");
			mav.addObject("top", top);
			mav.addObject("see", see);
			return mav;
		}else{
			session.setAttribute("sessionemail", data.getEmail());
			session.setAttribute("sessionpassword", data.getPassword());
			session.setAttribute("sessionnickname", data.getNickname());
			session.setAttribute("sessionpoint", data.getPoint());
			session.setAttribute("sessionmemberlevel", data.getMemberlevel());
			mav.addObject("session", session);
			mav.addObject("top", top);
			return mav;
		}
	}
	
	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public ModelAndView logOut( HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("home");
		HttpSession session = request.getSession();
		session.invalidate();
		mav.addObject("top", top);
		return mav;
	}
}
