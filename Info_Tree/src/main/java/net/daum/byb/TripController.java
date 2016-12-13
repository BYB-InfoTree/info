package net.daum.byb;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.TBoard;
import net.daum.byb.service.TBoardDao;

@Controller
public class TripController {

	private static final Logger logger = LoggerFactory.getLogger(TripController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/trip_listform",method = RequestMethod.GET)
	public ModelAndView triplistForm(){
		
		ModelAndView mav = new ModelAndView("trip/trip_listform");
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		ArrayList<TBoard> list = dao.selectAll();
		mav.addObject("lists", list);
		System.out.println("히히히히");
		return mav;
	};
	
	
	@RequestMapping(value="/TBoardInsertForm",method = RequestMethod.GET)
	public ModelAndView TBoardInsertForm(){
		
		ModelAndView mav = new ModelAndView("trip/trip_insertform");
		
		
		return mav;
	};
	
//	tboardInsert
	@RequestMapping(value="/tboardInsert", method = RequestMethod.POST)
	public String TboardInsert(@ModelAttribute("tboard")TBoard tboard){
		
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		String t_date=simple.format(currentdate);
		
		tboard.setT_date(t_date);
		
		
		int result = dao.insertRow(tboard);
		System.out.println("리설트값" + result);
		
		return "redirect:/trip_listform";
	}
	
	
	@RequestMapping(value="/t_boardDetail" ,method=RequestMethod.GET)
	public ModelAndView t_boardDetail(@RequestParam("t_seq")int t_seq){
		
		
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		TBoard data = dao.selectOne(t_seq);
		ModelAndView mav = new ModelAndView("trip/trip_detail");
		
		mav.addObject("data",data);
		
		
		return mav;
		
	}
	
	@RequestMapping(value="/tboardUpdateform" , method=RequestMethod.POST)
	public ModelAndView tboardUpdate(@RequestParam("t_seq")int t_seq){
		
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		TBoard data = dao.selectOne(t_seq);
		ModelAndView mav = new ModelAndView("trip/trip_update");
		mav.addObject("data",data);
		
		return mav;
	}
	
//	tboardUpdatefinish
	@RequestMapping(value="/tboardUpdatefinish",method=RequestMethod.POST)
	public String tboardUpdatefinish(@ModelAttribute("tboard") TBoard tboard ) {
		
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
	 	int result = dao.updateRow(tboard);
		
		System.out.println("1나오면 업데이트 성공 :"+result);
		
		return "redirect:/t_boardDetail?t_seq="+tboard.getT_seq();
	}
	
	
}
