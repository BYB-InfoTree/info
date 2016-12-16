package net.daum.byb;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Board;
import net.daum.byb.service.BoardDao;
import net.daum.byb.entities.Member;
import net.daum.byb.entities.Tboard;
import net.daum.byb.service.MemberDao;
import net.daum.byb.service.TBoardDao;

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
	
	@RequestMapping(value = "/boardUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdateForm(@RequestParam int b_seq) {
		ModelAndView mav=new ModelAndView("board/board_update");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Board board =dao.selectOne(b_seq);
		

//		Date currentdate=new Date();
//		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
//		String yyyy=df.format(currentdate);
//		mav.addObject("yyyy",yyyy);
		mav.addObject("data",board);
		
		
		mav.addObject("top",top);
		return mav;

	}

	@RequestMapping(value = "/boardUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView boardUpdate(@ModelAttribute("board") Board board) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);

		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);

		board.setB_date(yyyy);
	
		int result=	dao.updateRow(board);

		String msg="";
		if(result ==1){
			msg="Successfully, Inserted TEXT!";
		}else{
		msg="Failed  your Board TEXT!";
		}
		ModelAndView mav=new ModelAndView("board/board_detail");
		mav.addObject("msg",msg);
		return  mav;
	}
	
	@RequestMapping(value = "/boardInsertForm", method = RequestMethod.GET)
	public String boardInsertForm(){
		
		return  "board/board_insert";
	}
	
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public ModelAndView boardinsert(@ModelAttribute("board") Board board) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		String b_date=simple.format(currentdate);
		board.setB_date(b_date);
		String msg="";
		int result=dao.insertRow(board);
		
		if(result ==1){
				msg="Successfully, Inserted TEXT!";
		}else{
			msg="Failed  your Board TEXT!";
		}
		ModelAndView mav=new ModelAndView("board/board_result");
		mav.addObject("msg",msg);
		return  mav;
	}

	public void sleep(int time){
	    try {
	      Thread.sleep(time);
	    } catch (InterruptedException e) { }
	}
	

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	   public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	      OutputStream out = null;
	      PrintWriter printWriter = null;
	      response.setCharacterEncoding("utf-8");
	      response.setContentType("text/html;charset=utf-8");
	      Date currentdate=new Date();
			SimpleDateFormat df=new SimpleDateFormat("yyyyMMdd_HHmmss");
			String date=df.format(currentdate);
	      
	      
	      try{
	         String fileName = date+upload.getOriginalFilename();
	         byte[] bytes = upload.getBytes();
	         String uploadPath = "C:/Users/jsi/git/info/Info_Tree/src/main/webapp/resources/fileupload/" + fileName;//저장경로
	         out = new FileOutputStream(new File(uploadPath));
	         out.write(bytes);
	         String callback = request.getParameter("CKEditorFuncNum");
	         printWriter = response.getWriter();
	         String fileUrl = "resources/fileupload/" + fileName;//url경로
	         this.sleep(5000);
	         printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+callback+ ",'"+fileUrl+ "','이미지를 업로드 하였습니다.'"+ ")</script>");
	        
 	         printWriter.flush();
      
	      }catch(IOException e){
	         e.printStackTrace();
	      } finally {
	         try {	        	 
	            if (out != null) {
	               out.close();
	            }
	            if (printWriter != null) {
	               printWriter.close();
	               }
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      return ;
	   }
	@RequestMapping(value = "/BoardDetail", method = RequestMethod.GET)
	public ModelAndView BoardDetail(@RequestParam int b_seq) {
		ModelAndView mav=new ModelAndView("board/board_detail");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Board boards=dao.selectOne(b_seq);
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		mav.addObject("yyyy",yyyy);
		mav.addObject("board",boards);
		mav.addObject("top",top);
		return mav;

	}
	@RequestMapping(value="/boardDelete", method = RequestMethod.POST)
	public ModelAndView boardDelete(HttpSession session,HttpServletRequest request,@RequestParam int b_seq){
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.deleteRow(b_seq);
		ArrayList<Board> board=dao.selectAll();
		ModelAndView mav = new ModelAndView("board/board_list");
		mav.addObject("boards",board);
		mav.addObject("top",top);
		return mav;
	}
	
	
	@RequestMapping(value = "/boardSelectDelete", method = RequestMethod.GET)
	public String boardSelectDelete(@RequestParam  int saveids[]) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		for (int ids:saveids){
			dao.deleteRow(ids);
		}
		return "redirect:/boardListForm";
	}

}