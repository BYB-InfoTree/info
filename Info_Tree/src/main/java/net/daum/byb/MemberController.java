package net.daum.byb;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Member;
import net.daum.byb.service.MemberDao;



@Controller
public class MemberController {
	
	@Autowired
	private Member member;
	
	@Autowired
	private SqlSession sqlSession;
	
	final boolean aoa = false;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping(value="member_insert" , method = RequestMethod.GET)
	public ModelAndView memberinsert() {
		
		ModelAndView mvc = new ModelAndView("member/member_insert");
		mvc.addObject("aoa",aoa);
		return mvc;
	}

	
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int idconfirm(@RequestParam String id ) {
		
		System.out.println("---->"+id);
		int count = 0;
		int find = 0;
		try {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			// dao�뿉 �엳�뒗 硫붿냼�뱶瑜� 媛뽯떎 �벐�뒗�뜲 洹몃찓�냼�뱶媛� 荑쇰━ xml�씠�옉 �뿰寃곕릺�엳怨� db�옉 �뿰寃곕릺�엳�뒗 
			// sqlSession.getMapper(MemberDao.class);瑜� 媛��졇�떎 �궗�슜�븳�떎.
			count =  dao.selectCount(id);
			
			
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
	
	
	
}
