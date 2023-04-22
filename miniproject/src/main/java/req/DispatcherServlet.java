package req;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("*.do") // 뷰 페이지 요청을 제외한 모든 요청이 여기로 온다.
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Handler> map = new HashMap<>();

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		Properties prop = new Properties(); 
		String path = this.getServletContext().getRealPath("WEB-INF/commands.properties");
		try {
			prop.load(new FileReader(path));
			Iterator iter = prop.keySet().iterator();
			while (iter.hasNext()) {
				String url = (String) iter.next(); // member/join.do
				String className = prop.getProperty(url); 
				System.out.println(url + "/" + className);

				try { 
					Class<?> handlerClass = Class.forName(className); // 정보 수집
					Constructor<?> cons = handlerClass.getConstructor(null); // 생성자 가져옴
					Handler handler = (Handler) cons.newInstance(); // 객체 생성

					map.put(url, handler); // 생성한 객체를 값으로 저장

				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DispatcherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청을 처리한 뒤 뷰 페이지 이동
		String url = request.getServletPath(); // 요청 url 반환,
		String view = null;
		Handler handler = map.get(url);
		// url (key), handler (key에 따른 value)

		if (handler != null) {
			view = handler.process(request, response); // 메소드 호출해서 join 작업
			if (view != null) {
				if (view.startsWith("redirect")) {
					String[] path = view.split(":");
					response.sendRedirect(request.getContextPath() + path[1]);

				} else if (view.startsWith("responsebody")) { //idcheckhandler //JSON
					String[] path = view.split("/");
					response.getWriter().append(path[1]); //{flag:true}
				} else {
					RequestDispatcher dis = request.getRequestDispatcher(view);
					dis.forward(request, response);
				}
			}
		} else {
			response.getWriter().append("404 not found url");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
