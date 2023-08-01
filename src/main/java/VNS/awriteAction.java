package VNS;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.mapperDAO;

public class awriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String enc_type = request.getContentType();
		
		String viewPath = null;
		if(enc_type==null)
			viewPath ="/aproductaddpage.jsp";
		
		else if(enc_type.startsWith("multipart")) {
			try {
				ServletContext application = request.getServletContext();
				String realPath = application.getRealPath("/images");
				MultipartRequest mr = new MultipartRequest(request, realPath, 1024*1024*200, "utf-8", new DefaultFileRenamePolicy());
				
				String title = mr.getParameter("title");
				String artist = mr.getParameter("artist");
				String price = mr.getParameter("price");
				String content = mr.getParameter("content");
				String cnt = mr.getParameter("cnt");
				
				//System.out.println(title);
				
				String m_idx = mr.getParameter("m_idx"); 
				
				File f = mr.getFile("file");
				
				String fname ="";
				String oname = ""; //필요할지?
				
				if(f!=null) {
					fname = "images/"+f.getName();
					oname = mr.getOriginalFileName("file");
				}
				
				int cn = mapperDAO.addAdminPvo(title, artist, price, content, cnt, m_idx, fname );
				
				viewPath = "/Controller?type=aviewList";
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return viewPath;
	}

}
