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
	   public String communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	      OutputStream out = null;
	      PrintWriter printWriter = null;
	      response.setCharacterEncoding("utf-8");
	      response.setContentType("text/html;charset=utf-8");
	      
	      try{
	         String fileName = upload.getOriginalFilename();
	         byte[] bytes = upload.getBytes();
	         String uploadPath = "C:/Users/grace/git/info/Info_Tree/src/main/webapp/resources/fileupload/" + fileName;//저장경로
	         out = new FileOutputStream(new File(uploadPath));
	         out.write(bytes);
	         String callback = request.getParameter("CKEditorFuncNum");
	         printWriter = response.getWriter();
	         String fileUrl = "resources/fileupload/" + fileName;//url경로
	         printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+callback+ ",'"+fileUrl+ "','이미지를 업로드 하였습니다.'"+ ")</script>");
	         this.sleep(3000);
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
	      return "upload";
	   }


}