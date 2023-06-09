package handler.recipe;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import recipe.RecipeBoardService;
import recipe.RecipeBoardVo;

public class RecipeMatHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view= "/recipe/namelist.jsp";
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String[] rcpArr =  new String[3];
		if(request.getMethod().equals("GET")) {
		String rcppd = request.getParameter("rcp");
		String[] splitArr = rcppd.split(" ");
		int len = splitArr.length;
		
		for (int i=0; i<len; i++) {
		    rcpArr[i] = splitArr[i];	
		}
		
		for (int i=len; i<3; i++) {
		    rcpArr[i] = "";
		}
		String mat1 = rcpArr[0];
		String mat2 = rcpArr[1];
		String mat3 = rcpArr[2];
		
		RecipeBoardService service = new RecipeBoardService();
		ArrayList<RecipeBoardVo> list = service.selectMat(mat1, mat2, mat3);
		
		request.setAttribute("list", list);
		} 
		else {
			
			String[] mats = request.getParameterValues("inglist");
			int len = mats.length;
			System.out.println(len);
			for (int i=0; i<len; i++) {
			    rcpArr[i] = mats[i];
			}
			
			for (int i=len; i<3; i++) {
			    rcpArr[i] = "";
			}
			
			String mat1 = rcpArr[0];
			String mat2 = rcpArr[1];
			String mat3 = rcpArr[2];
			
			
			
			RecipeBoardService service = new RecipeBoardService();
			ArrayList<RecipeBoardVo> list = service.selectMat(mat1, mat2, mat3);
			request.setAttribute("list", list);

		}
		return view;
	}

}
