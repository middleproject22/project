package handler.mainindex;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import handler.Handler;
import likes.likesService;
import likes.likesVo;
import oracle.net.aso.r;
import recipe.RecipeBoardService;
import recipe.RecipeBoardVo;

public class MainIndexHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String view ="/mainindex/mainIndex.jsp";
		if(request.getMethod().equals("GET")) {
		likesService lservice = new likesService();
		RecipeBoardService rservice = new RecipeBoardService();
		ArrayList<likesVo> llist = lservice.Maxlikes();
		ArrayList<RecipeBoardVo> rlist = new ArrayList<>();
		FreeBoardService fservice = new FreeBoardService();
		ArrayList<FreeBoardVo> flist = fservice.getByLikes();
		
		
		for(int i= 0; i<llist.size();i++) {
			int seqnum = llist.get(i).getSeq_num();
			RecipeBoardVo vo = rservice.SelectByNum(seqnum);
			rlist.add(vo);
			
		}
		request.setAttribute("flist", flist);
		request.setAttribute("rlist",rlist);
		}
		return view;
	}

}
