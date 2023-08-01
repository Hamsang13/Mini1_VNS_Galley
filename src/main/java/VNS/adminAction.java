package VNS;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;

public class adminAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Integer> map = mapperDAO.getCountForD();
		request.setAttribute("countmap", map);
		
		return "/admin.jsp";
	}

}
