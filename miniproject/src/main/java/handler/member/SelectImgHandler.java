package handler.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Member.MemberService;
import Member.MemberVo;
import handler.Handler;
import oracle.net.aso.d;
import userimg.UserImgService;
import userimg.UserImgVo;

public class SelectImgHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view ="";
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		MemberService mservice = new MemberService();
		if(request.getMethod().equals("GET")) {
			UserImgService service = new UserImgService();
			ArrayList<UserImgVo> list = service.getAll();
			request.setAttribute("list", list);
			
			view = "/member/selectimg.jsp";
		}else {
			
			String path = "/Users/steve/git/project/miniproject/src/main/webapp/userimg";

			int size = 100 * 1024 * 1024; // 100M

			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
				File f = multipart.getFile("file");
				if(f==null) {
					String defaultimgpath = multipart.getParameter("path");
					mservice.imgUpdate(defaultimgpath, id);
				}else {
				// getName(): 파일명 반환
				String fname = "/miniproject/userimg/"+f.getName();// 파일명
				mservice.imgUpdate(fname, id);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			
			
			MemberVo vo = mservice.getById(id);
			request.setAttribute("ck", "ck");
			session.setAttribute("img", vo.getImgpath());
			view = "/member/selectimg.jsp";
			}
		
		
		return view;
	}

}
