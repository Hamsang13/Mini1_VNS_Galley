package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.questionVO;

public class aqViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String p_idx = request.getParameter("p_idx");
		String m_idx = request.getParameter("m_idx");
		
		questionVO[] ar = mapperDAO.getlist2(p_idx, m_idx);
		
		questionVO[] ar2 = mapperDAO.getAnswer(p_idx);
		
		request.setAttribute("avo", ar2);
		
		String viewPath = null;
		if(ar != null) {
			request.setAttribute("vo", ar);
			viewPath = "/aqViewpage.jsp";
		}
		
		return viewPath;
	}

}
