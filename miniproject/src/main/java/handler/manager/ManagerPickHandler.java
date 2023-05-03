package handler.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Member.MemberVo;
import handler.Handler;
import manager.ManagerPickService;
import manager.ManagerPickVo;
import recipe.RecipeBoardService;
import recipe.RecipeBoardVo;

public class ManagerPickHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		RecipeBoardService rservice = new RecipeBoardService();
		ManagerPickService mservice = new ManagerPickService();
		if (request.getMethod().equals("GET")) {
			ArrayList<RecipeBoardVo> list = rservice.getByMn();
			request.setAttribute("picklist", list);
			ArrayList<ManagerPickVo> plist = mservice.getAll();
			System.out.println(plist);
			request.setAttribute("plist", plist);
			view = "/recipe/managerpick.jsp";

		} else {
			String path = request.getSession().getServletContext().getRealPath("/managerpickimg/");

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
				String imgpath ="/miniproject/managerpickimg/"+fname;
				String name = multipart.getParameter("name");
				System.out.println(name);
				RecipeBoardVo vo = rservice.SelectByName(name);
				int seqnum = vo.getSeq_num();
				
				mservice.insert(new ManagerPickVo(0,seqnum,name,imgpath));
				
				view = "redirect:/managerpick/managerpick.do";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 업로드된 파일의 원본 이름

		}

		return view;

	}
}
