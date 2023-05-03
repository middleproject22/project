package handler.freeboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		FreeBoardService service = new FreeBoardService();
		ArrayList<FreeBoardVo> list = service.getAll();
		FreeBoardService fservice = new FreeBoardService();
		ArrayList<FreeBoardVo> flist = fservice.getByMgNum();
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		return "/freeboard/fb_list.jsp";
	}

}
