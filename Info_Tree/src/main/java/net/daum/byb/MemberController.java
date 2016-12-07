package net.daum.byb;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	
	
	
	@RequestMapping(value = "/memberSelectedDelete", method = RequestMethod.GET)
	public String memberSelectedDelete(@RequestParam String saveids[]) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ModelAndView mav = new ModelAndView("member/member_result");
		
		for( String emails : saveids){
			dao.deleteRow(emails);
		}
			
		
		return "redirect:/memberList";
	}
	
	
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
	
	
							

	
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("member")Member member,HttpSession session){
			
		int result = 0;
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		if(member.getPassword().equals(null)||member.getPassword().equals("")){
			member.setPassword((String) session.getAttribute("sessionpassword"));
			result = dao.updateData(member);			
			session.setAttribute("sessionnickname", member.getNickname());
		}else{
			
			result = dao.updateData(member);	
			session.setAttribute("sessionnickname", member.getNickname());
		}
		
		
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
	
	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdate(@RequestParam String email , HttpServletResponse response,HttpServletRequest request ) throws Exception {
		MemberDao dao =sqlSession.getMapper(MemberDao.class);
		System.out.println("이메일값 : "+ email);
		Member member = dao.selectOne(email);
//		String path = request.getContextPath();

		
		
//		byte[] bytes = member.getPhoto();	
		ModelAndView mav = new ModelAndView("member/member_update_form");
		mav.addObject("data",member);
		return mav;
	}
	
	
	@RequestMapping(value = "/memberlistupdateform", method = RequestMethod.GET)
	public ModelAndView memberlistupdateform(@RequestParam String email , HttpServletResponse response,HttpServletRequest request ) throws Exception {
		MemberDao dao =sqlSession.getMapper(MemberDao.class);
		System.out.println("이메일값 : "+ email);
		Member member = dao.selectOne(email);
//		String path = request.getContextPath();

		member.getNickname();
		member.getName();
		member.getPassword();
		member.getPoint();
		member.getMemberlevel();
//		byte[] bytes = member.getPhoto();	
		ModelAndView mav = new ModelAndView("member/member_list_update");
		mav.addObject("data",member);
		return mav;
	}
	
	
	@RequestMapping(value = "/memberlistupdate", method = RequestMethod.POST)
	public String memberlistupdate(@ModelAttribute Member member , HttpServletResponse response,HttpServletRequest request ) throws Exception {
		MemberDao dao =sqlSession.getMapper(MemberDao.class);
		
		int result = dao.memberlistupdate(member);
//		String path = request.getContextPath();

		String email= member.getEmail();
//		byte[] bytes = member.getPhoto();	
		
		return "redirect:/memberList?email"+email;
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
	
	@RequestMapping(value="/inserteditor", method = RequestMethod.GET)
	public String inserteditor(){
		return "inserteditor";
	}
	
	
	/**
     * 이미지 업로드
     * @param request
     * @param response
     * @param upload
     */
    @RequestMapping(value = "/community/imageUpload", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
 
    	System.out.println("사진 업로드 천천히");
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            System.out.println("resources/image/" +fileName);
            byte[] bytes = upload.getBytes();
            String uploadPath = "C:/Users/IT/Desktop/new/info/Info_Tree/src/main/webapp/resources/image/" +fileName;//저장경로
            System.out.println("111");
 
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
            System.out.println("=========================================");
            System.out.println("CKEditorFuncNum값  :"+callback);
            System.out.println("222");
 
            printWriter = response.getWriter();
            String fileUrl =  "resources/image/"+fileName;//url경로
            
            System.out.println("333");
 
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
            System.out.println("4444");
            printWriter.flush();
            System.out.println("55555");
        }catch(IOException e){
        	
            e.printStackTrace();
        } finally {
        	System.out.println("파니얼");
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
