package net.daum.byb;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
	
	@RequestMapping(value = "/memberInsert", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView memberInsert(@ModelAttribute("member")Member member) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		member.setJoindate(yyyy);
		member.setPoint(0);
		member.setMemberlevel("일반회원");

		int result=dao.insertRow(member);
		String msg="";
		if(result==1){
			msg="Success Insert your Info!";
		}else{
			msg="failed Insert your Info!";
		}
		ModelAndView mav=new ModelAndView("member/member_insert_result");
		mav.addObject("msg",msg);
		return  mav;
	}
	
	@RequestMapping(value = "/memberInsertResult", method = RequestMethod.GET)
	public String memberResult(Locale locale, Model model) {
				
		return "home";
	}
	
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	   @ResponseBody 
	   public int idconform(@RequestParam String email) {
	      int count = 0;
	      int find = 0;
	      try {
	         MemberDao dao =sqlSession.getMapper(MemberDao.class);
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
	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdateForm(@RequestParam String email, HttpSession session) {
		ModelAndView mav=new ModelAndView("member/member_update");
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		Member member=dao.selectOne(email);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		
		mav.addObject("yyyy",yyyy);
		mav.addObject("member",member);
		mav.addObject("top",top);
		return mav;

	}
	
	@RequestMapping(value = "/memberUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView memberUpdate(@ModelAttribute("member")Member member,HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		member.setJoindate(yyyy);
		member.setPoint(0);
		member.setMemberlevel("일반회원");
		member.setNewpassword(member.getNewpassword());
		System.out.println("==ppppp=="+member);
		int result=dao.updateRow(member);
		String msg="";
		if(result==1){
			msg="Success Update your Info!";
			Map <String,Object> map = new HashMap<String,Object>();
			session.setAttribute("sessionnickname", member.getNickname());
			session.setAttribute("sessionpassword", member.getNewpassword());
			session.setAttribute("sessionpoint", member.getPoint());
			session.setAttribute("sessionemail", member.getEmail());
			session.setAttribute("sessionmemberlevel", member.getMemberlevel());
		}else{
			msg="Failed Update your Info!";
		}
		ModelAndView mav=new ModelAndView("member/member_update_result");
		mav.addObject("msg",msg);
		return  mav;
	}
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	@ResponseBody 
	   public ModelAndView memberDelete(@RequestParam String email,HttpSession session) {
         MemberDao dao =sqlSession.getMapper(MemberDao.class);
         session.invalidate();
         ModelAndView mav=new ModelAndView("member/member_update_result");
         dao.deleteRow(email);
         return  mav;
	   }
	
	
}
