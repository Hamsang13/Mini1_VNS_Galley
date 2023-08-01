package VNS;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet(
		urlPatterns = { "/Controller" }, 
		initParams = { 
				@WebInitParam(name = "myparam", value = "/WEB-INF/action.properties")
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 Map<String, Action> am;
	
    public Controller() {
        am = new HashMap<String, Action>();   
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		String props_path = getInitParameter("myparam");
		
		ServletContext application =  getServletContext();
		String realPath = application.getRealPath(props_path);
		Properties props = new Properties();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(realPath);
			props.load(fis);
		} catch (Exception e) {
		} finally {
			try {
				if(fis!=null)
					fis.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		Iterator<Object> it = props.keySet().iterator();
		
		while(it.hasNext()) {
			String key =  (String)it.next();
			String value = props.getProperty(key);
			try {
				Object obj = Class.forName(value).newInstance();
				am.put(key, (Action)obj);
			} catch (Exception e) {
			}
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		if(type==null)
			type="login";
		
		Action ac = am.get(type);
		
		String viewpath = ac.execute(request, response);
		
		if(viewpath == null) {
			response.sendRedirect("Controller");
		}
		else if(viewpath.equals("finish")){
			
		}
		else {
			RequestDispatcher dip = request.getRequestDispatcher(viewpath);
			dip.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
