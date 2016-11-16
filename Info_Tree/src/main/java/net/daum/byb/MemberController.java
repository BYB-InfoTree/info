package net.daum.byb;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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
	final boolean top=false;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Member member;
	
	@RequestMapping(value = "/memberInsertForm", method = RequestMethod.GET)
	public ModelAndView memberInsertForm(Locale locale, Model model) {
			
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		ModelAndView mav=new ModelAndView("member/member_insert");
		mav.addObject("yyyy",yyyy);
		mav.addObject("top",top);
		return mav;

	}
	
	@RequestMapping(value = "/memberInsert", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView memberInsert(@ModelAttribute("member")Member member) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		//member.setName("aa");
		//member.setPhone("111");
		member.setMemberlevel("1");
		member.setJoindate("1");
		System.out.println("=====member==="+member);
		int result=dao.insertRow(member);

		ModelAndView mav=new ModelAndView("member/member_insert");
		mav.addObject("msg",dao);
		return  mav;
	}
	
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody
	public  int  idconfirm(@RequestParam  String email) {
		int find = 1;	
		try {
				net.daum.byb.service.MemberDao dao = sqlSession.getMapper(MemberDao.class);
				Member data =dao.selectOne(email);
				if(data.getEmail()!=null)
						find=0;
			} catch (Exception e) {
			//	System.out.println("===Exeption=="+e.getMessage());
			}
			return find;
	}
	
	
	
}
