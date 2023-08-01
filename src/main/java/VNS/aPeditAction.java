package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.productVO;

public class aPeditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String p_idx= request.getParameter("p_idx");
		
		
		productVO vo = mapperDAO.getAdminPvo(p_idx);
		
		request.setAttribute("pvoE", vo );
		
		return "/apedit.jsp";
	}

}
