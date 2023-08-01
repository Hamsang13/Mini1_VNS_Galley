package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.productVO;
import utl.Paging;

public class museumproductAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		
		String p_idx = request.getParameter("viewidx");		
		productVO vo = mapperDAO.productpage(p_idx);
		request.setAttribute("product", vo);
		
		
		Paging page = new Paging();
		int totalCount = mapperDAO.getTotalCount(vo.getP_idx());
		page.setTotalRecord(totalCount);
		String cPage = request.getParameter("cPage");
		if(cPage==null) {
			page.setNowPage(1); // page.setNowPage(page.getNoPage());
		}else {
			int nowp = Integer.parseInt(cPage);
			page.setNowPage(nowp);
			// 이때 게시물을 추출할때 사용되는 begin,end가 구해지고 시작 페이지 값과 마지막 페이지 값이 계산된다.
		}
		vo.setQueslist(mapperDAO.questionlist(page.getBegin(),page.getEnd(),vo.getP_idx()));
		request.setAttribute("page", page);
		
		return "/museumproductpage.jsp";
		
	}

}


