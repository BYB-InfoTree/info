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
import net.daum.byb.entities.Member;
import net.daum.byb.entities.Tboard;
import net.daum.byb.service.BoardDao;
import net.daum.byb.service.MemberDao;
import net.daum.byb.service.TBoardDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TBoardController {
	
	final boolean top=false;
	private static final Logger logger = LoggerFactory.getLogger(TBoardController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Member member;
	
	@RequestMapping(value = "/tBoardListForm", method = RequestMethod.GET)
	public ModelAndView tBoardListForm(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("tboard/tboard_list");
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		ArrayList<Tboard> tboard=dao.selectAll();
		mav.addObject("tboards",tboard);
		return mav;
	}
	
	@RequestMapping(value = "/tBoardUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdateForm(@RequestParam int t_seq) {
		ModelAndView mav=new ModelAndView("tboard/tboard_update");
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		Tboard tboard =dao.selectOne(t_seq);
		

		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);
		mav.addObject("yyyy",yyyy);
		mav.addObject("data",tboard);
		
		
		mav.addObject("top",top);
		return mav;

	}
	
	@RequestMapping(value = "/tBoardUpdate", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView boardUpdate(@ModelAttribute("tboard") Tboard tboard) {
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);

		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String yyyy=df.format(currentdate);

		tboard.setT_date(yyyy);
		int result=	dao.updateRow(tboard);

		String msg="";
		if(result ==1){
			msg="Successfully, Inserted TEXT!";
		}else{
		msg="Failed  your Board TEXT!";
		}
		ModelAndView mav=new ModelAndView("tboard/tboard_detail");
		mav.addObject("msg",msg);
		return  mav;
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/tBoardInsertForm", method = RequestMethod.GET)
	public String tBoardInsertForm(){
		
		return  "tboard/tboard_insert";
	}
	
	@RequestMapping(value = "/tBoardInsert", method = RequestMethod.POST)
	public ModelAndView tboardinsert(@ModelAttribute("tboard") Tboard tboard) {
		
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		String t_date=simple.format(currentdate);
		tboard.setT_date(t_date);
		String msg="";
		int result=dao.insertRow(tboard);
		if(result ==1){
				msg="Successfully, Inserted TBoard !";
		}else{
			msg="Failed  your TBoard TEXT!";
		}
		ModelAndView mav=new ModelAndView("tboard/tboard_result");
		mav.addObject("msg",msg);
		return  mav;
	}
	

	public void sleep(int time){
	    try {
	      Thread.sleep(time);
	    } catch (InterruptedException e) { }
	}
	
	
	@RequestMapping(value = "/tupload", method = RequestMethod.POST)
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
	         String uploadPath = "C:/Users/jsi/git/info/Info_Tree/src/main/webapp/resources/tfileupload/" + fileName;//저장경로
	         out = new FileOutputStream(new File(uploadPath));
	         out.write(bytes);
	         this.sleep(3000);
	         String callback = request.getParameter("CKEditorFuncNum");
	         printWriter = response.getWriter();
	         String fileUrl = "resources/tfileupload/" + fileName;//url경로
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
	      return ;
	   }
	
	@RequestMapping(value = "/tBoardDetail", method = RequestMethod.GET)
	public ModelAndView listUpdateForm(@RequestParam int t_seq) {
		ModelAndView mav=new ModelAndView("tboard/tboard_detail");
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		Tboard tboards=dao.selectOne(t_seq);
		int t_ref=t_seq;	
		ArrayList<Tboard> tboardref=dao.selectRef(t_ref);
		mav.addObject("tboard",tboards);
		mav.addObject("tboardref",tboardref);
		mav.addObject("top",top);
		return mav;

	}
	@RequestMapping(value="/tBoardDelete", method = RequestMethod.POST)
	public ModelAndView tBoardDelete(HttpSession session,HttpServletRequest request,@RequestParam int t_seq){
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		dao.deleteRow(t_seq);
		ArrayList<Tboard> tboard=dao.selectAll();
		ModelAndView mav = new ModelAndView("tboard/tboard_list");
		mav.addObject("tboards",tboard);
		mav.addObject("top",top);
		return mav;
	}
	
	@RequestMapping(value = "/tBoardSelectDelete", method = RequestMethod.GET)
	public String tBoardSelectDelete(@RequestParam  int saveids[]) {
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		for (int ids:saveids){
			dao.deleteRow(ids);
		}
		return "redirect:/tBoardListForm";
	}
	
	@RequestMapping(value = "/insertRef", method = RequestMethod.POST)
	public ModelAndView insertRef(@ModelAttribute("tboard") Tboard tboard,@RequestParam int t_seq) {
		TBoardDao dao = sqlSession.getMapper(TBoardDao.class);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate=new Date();
		String t_date=simple.format(currentdate);
		tboard.setT_date(t_date);
		dao.insertRef(tboard);
		ModelAndView mav=new ModelAndView("tboard/tboard_detail");
		ArrayList<Tboard> tboardref=dao.selectRef(t_seq);
		Tboard tboards=dao.selectOne(t_seq);
		mav.addObject("tboardref",tboardref);
		mav.addObject("tboard",tboards);
		return mav;
	}
}