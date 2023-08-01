package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.productVO;

public class museumListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		productVO[] ar = mapperDAO.museumlist();
		String str = request.getParameter("search");
		String type = request.getParameter("searchtype");
		if(str!=null&&type!=null) {
			ar = mapperDAO.museumsearchlist(type, str);
		}
		
		request.setAttribute("ar", ar);
		return "/museum.jsp";
	}

}
