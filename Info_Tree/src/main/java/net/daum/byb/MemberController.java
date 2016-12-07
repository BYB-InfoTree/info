package net.daum.byb;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Member;
import net.daum.byb.service.MemberDao;



/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	final boolean top=true;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Member member;
	
	
	
	@RequestMapping(value = "/memberInsertForm", method = RequestMethod.GET)
	public ModelAndView memberInsertForm() {
			
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		ModelAndView mav=new ModelAndView("member/member_insert");
		mav.addObject("yyyy",yyyy);
		mav.addObject("top",top);
		return mav;

	}
	
	@RequestMapping(value="/memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member){
		ModelAndView mav = new ModelAndView("home");
		
		member.setMemberlevel("일반회원");
		member.setPoint(0);
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		int result = dao.insertRow(member);
		mav.addObject("top",top);
		mav.addObject("result",result);
		
		return mav;
		
	}
	
	

	
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int idconfirm(@RequestParam String email ) {
		
		int count = 0;
		int find = 0;
		try {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			count =  dao.selectCount(email);
			
		} catch (Exception e) {
			
			System.out.println("error :" + e.getMessage());
		}
		if(count > 0){
			find = 1;
		}else{
			find = 0;
		}
		return find;
	}
	
	
							
	@RequestMapping(value="/memberUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdateForm(HttpSession session){
		String email= (String) session.getAttribute("sessionemail");
		ModelAndView mav = new ModelAndView("member/member_update_form");
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data = dao.selectOne(email);
		mav.addObject("data",data);
		return mav;
	}
	
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("member")Member member,HttpSession session){
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		if(member.getNewpassword().equals("")){
			member.setNewpassword(member.getPassword());
		}
		int result = dao.updateData(member);
		session.setAttribute("sessionnickname", member.getNickname());
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("top",top);
		return mav;
	}
	
	
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public ModelAndView memberDelete(HttpSession session,HttpServletRequest request){

		String email = (String) session.getAttribute("sessionemail");
		session = request.getSession();
		session.invalidate();
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = dao.memberDelete(email);
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	
	@RequestMapping(value = "/memberListForm", method = RequestMethod.GET)
	public ModelAndView memberListForm() {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectAll();
		ModelAndView mav = new ModelAndView("member/member_list");
		mav.addObject("member", members);
		return mav;
	}
	
	@RequestMapping(value="/memberListUpdate", method = RequestMethod.POST)
	public String memberListUpdate(@ModelAttribute("member")Member member){
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = dao.memberUpdate(member);
		return "redirect:memberListForm";
	}
	
	@RequestMapping(value = "/memberSelectDelete", method = RequestMethod.GET)
	public String memberSelectDelete(@RequestParam String saveids[] ) {
		MemberDao dao =sqlSession.getMapper(MemberDao.class);
		ModelAndView mav = new ModelAndView("member/member_list");
		for( String ids:saveids ){
			dao.delete_Row(ids);
		}
		return "redirect:memberListForm";
	}
	
	@RequestMapping(value = "/memberListUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberListUpdateForm(@RequestParam String email) {
		ModelAndView mav = new ModelAndView("member/member_list_update");
		MemberDao dao =sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(email);
		mav.addObject("member", member);
		return mav;
	}
	
}
