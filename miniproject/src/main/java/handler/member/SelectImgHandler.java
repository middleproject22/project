package handler.member;

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
			
			String path = request.getSession().getServletContext().getRealPath("/userimg/");

			int size = 100 * 1024 * 1024; // 100M

			// 업로드에 사용할 MultipartRequest 객체 생성
			// param1: 요청객체
			// param2: 업로드 경로
			// param3: 파일 최대 크기
			// param4: 인코딩
			// param5: 파일명 중복됐을때 처리 방법
			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
				String fname = multipart.getOriginalFileName("file");
				if(fname != null) {
					String myimg= "/miniproject/userimg/"+fname;
					mservice.imgUpdate(myimg, id);
					
				}else if(fname==null){
					String defaultpath = multipart.getParameter("path");
					mservice.imgUpdate(defaultpath, id);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 업로드된 파일의 원본 이름
			MemberVo vo = mservice.getById(id);
			request.setAttribute("ck", "ck");
			session.setAttribute("img", vo.getImgpath());
			view = "/member/selectimg.jsp";
			}
		
		
		
		return view;
	}

}
