package net.daum.byb;

import java.util.ArrayList;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Board;
import net.daum.byb.service.BoardDao;
import net.daum.byb.service.MemberDao;


@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Board board;
	
	@RequestMapping(value="/travelListForm", method = RequestMethod.GET)
	public ModelAndView travelListForm(){
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<Board> boards = dao.selectAll();
		ModelAndView mav = new ModelAndView("board/travel_list");
		mav.addObject("boards", boards);
		return mav;
	}
	
	@RequestMapping(value = "/travel_input_form", method = RequestMethod.POST)
	public String travel_input_form() {
		return "board/travel_list_input";	
	}
	
}
