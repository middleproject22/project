package handler.foodmanage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import temp.TempService;
import temp.TempVo;

public class CntHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginId");
		
		TempService service = new TempService();
		
		int num = service.getCnt(id);
	
	
		
		
		
		return "responsebody/"+num;
	
		
		
		
	}

}
