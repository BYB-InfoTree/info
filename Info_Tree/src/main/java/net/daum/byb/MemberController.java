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
	@Autowired
	private SqlSession sqlSesson;
	@Autowired
	private Member member;
	
	final boolean top=false;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
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
	
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody 
	public int idconform(@RequestParam String email) {
		int count = 0;
		int find = 0;
		try {
			MemberDao dao =sqlSesson.getMapper(MemberDao.class);
			count = dao.selectCount(email);
		} catch (Exception e) {
		}
		if (count > 0){
			find = 1;
		}else{
			find = 0;
		}
		return find;
	}
	
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member) {
		MemberDao dao =sqlSesson.getMapper(MemberDao.class);
		String msg = "";
		System.out.println(member.getEmail());
		Date currentdate = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String joindate=df.format(currentdate);
		member.setJoindate(joindate);
		member.setPoint(0);
		member.setMemberlevel("일반회원");
		
		int result = dao.insert_Row(member);
		if(result == 1){
			msg = "가입 되었습니다.";
		}else{
			msg = "가입을 실패하였습니다.";
		}
		
		ModelAndView mav = new ModelAndView("member/member_result");
		mav.addObject("msg",msg);
		mav.addObject("result", result);
		return mav;
	}
}
