package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.productVO;

public class aproductAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String p_idx = request.getParameter("p_idx");
		
		String cPage = request.getParameter("cPage");
		
		productVO vo = mapperDAO.getAdminPvo(p_idx);
		
		request.setAttribute("pvo", vo);
		request.setAttribute("backcPage", cPage);
		
		return "/aproductpage.jsp";
	}

}
