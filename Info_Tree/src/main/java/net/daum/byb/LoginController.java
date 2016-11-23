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
public class LoginController {
	
	final boolean top=true;
	final boolean see=true;
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/loging", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") Member member,HttpSession session) {
		System.out.println("member"+member.getEmail());
		System.out.println("password : "+member.getPassword());
		
		ModelAndView mav = new ModelAndView("home");
	
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		Member data = dao.selectLogin(member);
		
		
		if(data == null) {
			mav.addObject("modal","modal");
			mav.addObject("top",top);
			mav.addObject("see",see);
			return mav;
		}else{
			session.setAttribute("sessionemail", data.getEmail());
			session.setAttribute("sessionnickname", data.getNickname());
			session.setAttribute("sessionpassword", data.getPassword());
			session.setAttribute("sessionlevel", data.getMemberlevel());
			
			return mav;
		}		
	
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		// 위에 코드가 세션을 끊어주는거.
		
		return "redirect:/home";
			
	}

}
