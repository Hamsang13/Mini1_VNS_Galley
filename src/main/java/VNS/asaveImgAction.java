package VNS;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class asaveImgAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			ServletContext application = request.getServletContext();
			String realPath = application.getRealPath("/images");
			
			MultipartRequest mr = new MultipartRequest(request, realPath, 1025*1024*20, "utf-8", new DefaultFileRenamePolicy());
			
			String fname = null;
			File f = mr.getFile("img");
			
			if(f!=null)
				fname = f.getName();
			
			request.setAttribute("fname", fname);
			request.setAttribute("f_path", request.getContextPath());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/asaveImg.jsp";
	}

}
