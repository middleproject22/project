package handler.recipe;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import handler.Handler;
import likes.likesService;
import recipe.RecipeBoardService;
import xml.RecipeVo;

public class RecipeByNameHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		
		String rcpnm = request.getParameter("rcpnm");
		int num = Integer.parseInt(request.getParameter("num"));
//		int cnt = Integer.parseInt(request.getParameter("cnt"));
//		int likes = Integer.parseInt(request.getParameter("likes"));
		
		System.out.println(num);
		System.out.println(rcpnm);
		if(rcpnm.contains(" ")) {
			rcpnm = rcpnm.replace(" ", "%20");
		}
		System.out.println(rcpnm);
		String urlstr = "https://openapi.foodsafetykorea.go.kr/api/fba33ac4a2d9496ab9f5/COOKRCP01/xml/1/999/RCP_NM="+rcpnm;
		try {
			URL url = new URL(urlstr);
			URLConnection conn = url.openConnection();// 네트워크 연결
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			// DocumentBuilder 객체 생성
			DocumentBuilder builder = factory.newDocumentBuilder();
			// xml 파싱
			Document doc = builder.parse(conn.getInputStream());
			Element root = doc.getDocumentElement();// root 요소 추출
			String code = root.getElementsByTagName("CODE").item(0).getTextContent();
			System.out.println(code);
			if(!code.equals("INFO-000")) {
				String errormsg = root.getElementsByTagName("MSG").item(0).getTextContent();
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(errormsg);
				return null;
			}
			RecipeBoardService service = new RecipeBoardService();
			NodeList recipelist = root.getElementsByTagName("row");
			Element recipe = (Element) recipelist.item(0);
			service.addcnt(num);
			String RCP_NM = recipe.getElementsByTagName("RCP_NM").item(0).getTextContent();
			
			String RCP_PARTS_DTLS = recipe.getElementsByTagName("RCP_PARTS_DTLS").item(0).getTextContent();
			String MANUAL01 = recipe.getElementsByTagName("MANUAL01").item(0).getTextContent();
			String MANUAL02 = recipe.getElementsByTagName("MANUAL02").item(0).getTextContent();
			String MANUAL03 = recipe.getElementsByTagName("MANUAL03").item(0).getTextContent();
			String MANUAL04 = recipe.getElementsByTagName("MANUAL04").item(0).getTextContent();
			String MANUAL05 = recipe.getElementsByTagName("MANUAL05").item(0).getTextContent();
			String MANUAL06 = recipe.getElementsByTagName("MANUAL06").item(0).getTextContent();
			String MANUAL07 = recipe.getElementsByTagName("MANUAL07").item(0).getTextContent();
			String MANUAL08 = recipe.getElementsByTagName("MANUAL08").item(0).getTextContent();
			String MANUAL09 = recipe.getElementsByTagName("MANUAL09").item(0).getTextContent();
			String MANUAL10 = recipe.getElementsByTagName("MANUAL10").item(0).getTextContent();
			String MANUAL11 = recipe.getElementsByTagName("MANUAL11").item(0).getTextContent();
			String MANUAL12 = recipe.getElementsByTagName("MANUAL12").item(0).getTextContent();
			String MANUAL13 = recipe.getElementsByTagName("MANUAL13").item(0).getTextContent();
			String MANUAL14 = recipe.getElementsByTagName("MANUAL14").item(0).getTextContent();
			String MANUAL15 = recipe.getElementsByTagName("MANUAL15").item(0).getTextContent();
			String MANUAL16	= recipe.getElementsByTagName("MANUAL16").item(0).getTextContent();
			String MANUAL17 = recipe.getElementsByTagName("MANUAL17").item(0).getTextContent();
			String MANUAL18 = recipe.getElementsByTagName("MANUAL18").item(0).getTextContent();
			String MANUAL19 = recipe.getElementsByTagName("MANUAL19").item(0).getTextContent();
			String MANUAL20 = recipe.getElementsByTagName("MANUAL20").item(0).getTextContent();
			
			String str[]= {MANUAL01,MANUAL02,MANUAL03, MANUAL04, MANUAL05, MANUAL06, MANUAL07 ,MANUAL08, MANUAL09, MANUAL10,
					MANUAL11,MANUAL12,MANUAL13, MANUAL14, MANUAL15, MANUAL16, MANUAL17 ,MANUAL18, MANUAL19, MANUAL20};
			
			String MANUAL_IMG01 = recipe.getElementsByTagName("MANUAL_IMG01").item(0).getTextContent();
			String MANUAL_IMG02 = recipe.getElementsByTagName("MANUAL_IMG02").item(0).getTextContent();
			String MANUAL_IMG03 = recipe.getElementsByTagName("MANUAL_IMG03").item(0).getTextContent();
			String MANUAL_IMG04 = recipe.getElementsByTagName("MANUAL_IMG04").item(0).getTextContent();
			String MANUAL_IMG05 = recipe.getElementsByTagName("MANUAL_IMG05").item(0).getTextContent();
			String MANUAL_IMG06 = recipe.getElementsByTagName("MANUAL_IMG06").item(0).getTextContent();
			String MANUAL_IMG07 = recipe.getElementsByTagName("MANUAL_IMG07").item(0).getTextContent();
			String MANUAL_IMG08 = recipe.getElementsByTagName("MANUAL_IMG08").item(0).getTextContent();
			String MANUAL_IMG09 = recipe.getElementsByTagName("MANUAL_IMG09").item(0).getTextContent();
			String MANUAL_IMG10 = recipe.getElementsByTagName("MANUAL_IMG10").item(0).getTextContent();
			String MANUAL_IMG11 = recipe.getElementsByTagName("MANUAL_IMG11").item(0).getTextContent();
			String MANUAL_IMG12 = recipe.getElementsByTagName("MANUAL_IMG12").item(0).getTextContent();
			String MANUAL_IMG13 = recipe.getElementsByTagName("MANUAL_IMG13").item(0).getTextContent();
			String MANUAL_IMG14 = recipe.getElementsByTagName("MANUAL_IMG14").item(0).getTextContent();
			String MANUAL_IMG15 = recipe.getElementsByTagName("MANUAL_IMG15").item(0).getTextContent();
			String MANUAL_IMG16	= recipe.getElementsByTagName("MANUAL_IMG16").item(0).getTextContent();
			String MANUAL_IMG17 = recipe.getElementsByTagName("MANUAL_IMG17").item(0).getTextContent();
			String MANUAL_IMG18 = recipe.getElementsByTagName("MANUAL_IMG18").item(0).getTextContent();
			String MANUAL_IMG19 = recipe.getElementsByTagName("MANUAL_IMG19").item(0).getTextContent();
			String MANUAL_IMG20 = recipe.getElementsByTagName("MANUAL_IMG20").item(0).getTextContent();
			
			String IMG[]= {MANUAL_IMG01,MANUAL_IMG02,MANUAL_IMG03, MANUAL_IMG04, MANUAL_IMG05, MANUAL_IMG06, MANUAL_IMG07 ,MANUAL_IMG08, MANUAL_IMG09, MANUAL_IMG10,
					MANUAL_IMG11,MANUAL_IMG12,MANUAL_IMG13, MANUAL_IMG14, MANUAL_IMG15, MANUAL_IMG16, MANUAL_IMG17 ,MANUAL_IMG18, MANUAL_IMG19, MANUAL_IMG20};
			
//			String MANUAL = "";
//			for (int i = 0; i<20; i++) {
//				if (str[i]=="") {
//					break;
//				}else {
//					MANUAL += str[i] +"<br/>";
//				}
//			}
//			
//			
//			String MANUAL_IMG = "";
//			for (int i = 0; i<20; i++) {
//				if (IMG[i]=="") {
//					break;
//				}else {
//					MANUAL_IMG = IMG[i] ;
//				}
//			}
			
//			request.setAttribute("RCP_PARTS_DTLS", RCP_PARTS_DTLS);
//			request.setAttribute("RCP_NM", RCP_NM);
//			request.setAttribute("MANUAL", MANUAL);
//			request.setAttribute("MANUAL_IMG", MANUAL_IMG);
			
			ArrayList<RecipeVo> list = new ArrayList<>();
			
			for (int i = 0; i<20; i++) {
				if (str[i]=="") {
					break;
				}else {
					//MANUAL += str[i] +"<br/>";
					list.add(new RecipeVo(str[i], IMG[i]));
					
				}
			}
			int cnt = service.selectcnt(num);
			likesService Lservice = new likesService();
			int likes = Lservice.addlikes(num);
			request.setAttribute("cnt", cnt);
			request.setAttribute("num", num);
			request.setAttribute("RCP_PARTS_DTLS", RCP_PARTS_DTLS);
			request.setAttribute("RCP_NM", RCP_NM);
			request.setAttribute("list", list);
			request.setAttribute("likes", likes);
			

			
//			str += MANUAL01 +"\n";
//			str += MANUAL02 +"\n";
//			str += MANUAL03 +"\n";
//			str += MANUAL04 +"\n";
//			str += MANUAL05 +"\n";
//			str += MANUAL06 +"\n";
//			str += MANUAL07 +"\n";
//			str += MANUAL08 +"\n";
//			str += MANUAL09 +"\n";
//			str += MANUAL10 +"\n";
//			str += MANUAL11 +"\n";
//			str += MANUAL12 +"\n";
//			str += MANUAL13 +"\n";
//			str += MANUAL14 +"\n";
//			str += MANUAL15 +"\n";
//			str += MANUAL16 +"\n";
//			str += MANUAL17 +"\n";
//			str += MANUAL18 +"\n";
//			str += MANUAL19 +"\n";
//			str += MANUAL20 +"\n";
			
			System.out.println(str);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/recipe/recipe.jsp";
	}

}
