package handler.mainindex;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import oracle.net.aso.r;
import recipe.RecipeBoardService;
import recipe.RecipeBoardVo;

public class MainIndexHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String view ="/mainindex/mainIndex.jsp";
		if(request.getMethod().equals("GET")) {
		System.out.println(1);
		RecipeBoardService rservice = new RecipeBoardService();
		ArrayList<RecipeBoardVo> rlist = new ArrayList<>();
		rlist = rservice.selectByLikes();
		System.out.println(rlist);
		request.setAttribute("rlist",rlist);
		}
		return view;
	}

}
