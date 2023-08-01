package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.productVO;

public class aviewListAciton implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		ProductPaging page = new ProductPaging(10, 5);
		
		String cPage = request.getParameter("cPage");
		
		int count = mapperDAO.getPvoCount();
		page.setTotalRecord(count);
		
		if(cPage == null || cPage == "0") {
			page.setNowPage(1);
		}else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		
		productVO[] ar = mapperDAO.getAdminPvoList(String.valueOf(page.getBegin()),String.valueOf(page.getEnd()));
		
		request.setAttribute("pAr", ar);
		request.setAttribute("page", page);
		
		return "/apListpage.jsp";
	}

}
