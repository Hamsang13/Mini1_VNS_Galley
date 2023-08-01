package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.orderlogVO;

public class vieworderAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String ol_idx = request.getParameter("ol_idx");
		orderlogVO olvo = mapperDAO.getorderlogvo(ol_idx);
		request.setAttribute("olvo", olvo);
		
		
		
		return "/orderpage.jsp";
	}

}
