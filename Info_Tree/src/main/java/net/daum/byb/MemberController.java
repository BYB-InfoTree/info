package net.daum.byb;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
		
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		member.setJoindate(yyyy);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		int result = dao.insertRow(member);
		System.out.println("디비후~~~~~~~~~~");
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
			// dao에 있는 메소드를 갖다 쓰는데 그메소드가 쿼리 xml이랑 연결되있고 db랑 연결되있는 
			// sqlSession.getMapper(MemberDao.class);를 가져다 사용한다.
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

//		mav.addObject("email", data.getEmail());
//		mav.addObject("nickname", data.getNickname());
		return mav;
		
	}
	
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("member")Member member,HttpSession session){
			
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		int result = dao.updateData(member);
		session.setAttribute("sessionnickname", member.getNickname());
		ModelAndView mav = new ModelAndView("home");
		
		System.out.println("업데이트 값 숫자 :"+result);
		return mav;
		
	}
	
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public ModelAndView memberList(HttpSession session){
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectAll();
		ModelAndView mav = new ModelAndView("member/member_list");
		System.out.println("카운터리스트 :"+ members.size());
		mav.addObject("members",members);
		
		return mav;
		
	}
	
	
	
	
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public ModelAndView memberDelete(HttpSession session,HttpServletRequest request){

		String email = (String) session.getAttribute("sessionemail");
		System.out.println("초아초아초아~~~~~~~~~~~~~~");
		session = request.getSession();
		session.invalidate();
		System.out.println("설현설현~~~~~~~~~~~~~~");
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = dao.memberDelete(email);
		ModelAndView mav = new ModelAndView("home");
		
		System.out.println("딜리트 값 숫자 :"+result);
		
//		session = request.getSession();
//		session.invalidate();
		return mav;
		
	}
	
	
	
	
}
