package net.daum.byb;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Board;
import net.daum.byb.entities.Member;
import net.daum.byb.service.BoardDao;
import net.daum.byb.service.MemberDao;

@Controller
public class BoardController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/boardlist", method = RequestMethod.GET)
	public ModelAndView boardlist(HttpSession session){
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.selectAll();
		ArrayList<Board> boards = dao.selectAll();
		ModelAndView mav = new ModelAndView("board/board_list");
		mav.addObject("boards",boards);
		
		return mav;
		
	}

}
