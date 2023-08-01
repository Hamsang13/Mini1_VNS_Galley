package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;

public class suspendAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String m_idx = request.getParameter("m_idx");
		String m_status = request.getParameter("m_status");
		int cnt = mapperDAO.suspendMem(m_idx, m_status);
		
		request.setAttribute("cnt", cnt);
		
		return "/memSuspend.jsp";
		
	}

}
