package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.service.FactoryService;
import mybatis.vo.productVO;

public class viewListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		productVO[] ar = mapperDAO.shoplist();
		String str = request.getParameter("search");
		String type = request.getParameter("searchtype");
		if(str!=null&&type!=null) {
			ar = mapperDAO.shopsearchlist(type, str);
		}
		
		request.setAttribute("ar", ar);
		return "/shop.jsp";
	}

}
