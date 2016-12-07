package net.daum.byb;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.daum.byb.entities.Board;
import net.daum.byb.entities.FileBean;
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
	
	@RequestMapping(value = "/travel_input_form", method = RequestMethod.GET)
	public String travel_input_form() {
		return "board/travel_list_input";	
	}
	
	@RequestMapping(value = "/file_upload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		
		System.out.println("확인작업 : 이미지");
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try{
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = "C:/Users/user/Desktop/github/info/Info_Tree/src/main/webapp/resources/file_upload/" + fileName;//저장경로
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");
			
			printWriter = response.getWriter();
			String fileUrl = "resources/file_upload/" + fileName;//url경로
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+ callback+ ",'"+ fileUrl+ "','이미지를 업로드 하였습니다.'"+ ")</script>");
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
		return;
	}
	
}
