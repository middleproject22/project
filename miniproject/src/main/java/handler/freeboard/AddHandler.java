package handler.freeboard;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

//url: /filedown/add.do
public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "/index.jsp";
		if (request.getMethod().equals("GET")) {// request.getMethod(): 요청 방식(get/post)값 반환
			request.setAttribute("view", "/filedown/add.jsp");
		} else {
			int size = 100 * 1024 * 1024; // 100M
			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, FreeBoardService.downDir, size, "euc-kr", new DefaultFileRenamePolicy());
				// 폼파라메터 읽기
				String writer = multipart.getParameter("writer");
				String title = multipart.getParameter("title");
				String content = multipart.getParameter("content");

				// 업로드된 파일의 파일객체 반환
				File f = multipart.getFile("file");
				// getName(): 파일명 반환
				String fname = f.getName();// 파일명
				
				FreeBoardService service = new FreeBoardService();
				service.addFile(new FreeBoardVo(0, writer, null, title, content, fname, 0));
				view = "redirect:/filedown/list.do";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return view;
	}

}
