package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;

public class delAnswerAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String del_idx = request.getParameter("del_idx");
		String p_idx = request.getParameter("p_idx");
		String m_idx = request.getParameter("m_idx");
		
		int cnt = mapperDAO.updateStatus(del_idx);
		int cnt2 = mapperDAO.updateWait2(p_idx);
		
		return "Controller?type=aqView&p_idx="+p_idx+"&m_idx="+m_idx;
	}

}
