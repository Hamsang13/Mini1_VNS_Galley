package VNS;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.mapperDAO;

public class apeditSaveAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String enc_type = request.getContentType();
		String viewpath = null;
		if (enc_type != null && enc_type.startsWith("multipart")) {
			try {
				ServletContext application = request.getServletContext();
				String realPath = application.getRealPath("/images");

				MultipartRequest mr = new MultipartRequest(request, realPath, 1024 * 1024 * 200, "utf-8",
						new DefaultFileRenamePolicy());

				String p_idx = mr.getParameter("p_idx");
				String p_title = mr.getParameter("title");
				String p_content = mr.getParameter("content");
				String p_price = mr.getParameter("price");
				String p_status = mr.getParameter("status");
				String p_cnt = mr.getParameter("cnt");
				String p_artist = mr.getParameter("artist");
				
				String m_idx = mr.getParameter("m_idx"); 

				File f = mr.getFile("file");

				String p_sfile = "";

				if (f != null)
					p_sfile =  "images/"+f.getName();

				mapperDAO.editAdminPvo(p_idx, p_status, p_title, p_artist, p_price, p_content, p_cnt, m_idx, p_sfile);
				viewpath = "Controller?type=aproduct&p_idx=" + p_idx;
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return viewpath;
	}

}
