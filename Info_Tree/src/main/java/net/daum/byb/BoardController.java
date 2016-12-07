package net.daum.byb;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Board;
import net.daum.byb.service.BoardDao;
import net.daum.byb.entities.Member;
import net.daum.byb.service.MemberDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	final boolean top=false;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Member member;
	
	@RequestMapping(value = "/boardListForm", method = RequestMethod.GET)
	public ModelAndView board(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("board/board_list");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ArrayList<Board> board=dao.selectAll();
		mav.addObject("boards",board);
		return mav;
	}
	
	@RequestMapping(value = "/boardInsertForm", method = RequestMethod.GET)
	public String boardInsertForm(){
		
		return  "board/board_insert";
	}
	
//	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
//	public ModelAndView boardinsert(@RequestParam CommonsMultipartFile file, HttpSession session,@ModelAttribute("board") Board board,HttpServletRequest request) {
//
//		BoardDao dao = sqlSession.getMapper(BoardDao.class);
//		String b_ip=request.getRemoteAddr();
//		
//		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
//		
//		Date currentdate=new Date();
//		String b_date=simple.format(currentdate);
//	
//		String path="C:/spring2/itschoolspring/src/main/webapp/resources/upload/";
//		String filename=file.getOriginalFilename();
////		String		msg="Success Insert your File!";
//		try {
//			byte barr[]=file.getBytes();
//			
//			BufferedOutputStream bout=new BufferedOutputStream( new FileOutputStream(path+filename));
//			bout.write(barr);
//			bout.flush();
//			bout.close();
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		
//		board.setB_ip(b_ip);
//		board.setB_date(b_date);
//		if(filename.equals("")){
//			board.setB_attach("");
//		}else{
//			board.setB_attach(path+filename);
//		}
//				String msg="";
//		int result=dao.insertRow(board);
//		if(result ==1){
//				msg="Successfully, Inserted TEXT!";
//		}else{
//			msg="Failed  your Board TEXT!";
//		}
//		ModelAndView mav=new ModelAndView("member/board_result");
//		mav.addObject("msg",msg);
//		return  mav;
//	}
	

}