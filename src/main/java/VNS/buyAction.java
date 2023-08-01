package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;
import mybatis.vo.productVO;

public class buyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String m_idx = request.getParameter("m_idx");
		String p_idx = request.getParameter("p_idx");
		
		productVO pvo = mapperDAO.productpage(p_idx);
		memberVO mvo = mapperDAO.getmembervo(m_idx);
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("mvo", mvo);
		
		return "/buypage.jsp";
	}

}
