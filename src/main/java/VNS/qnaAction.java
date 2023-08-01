package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.productVO;
import mybatis.vo.questionVO;
import utl.Paging;

public class qnaAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		productVO[] ar = mapperDAO.shoplist();
		
		request.setAttribute("ar", ar);
		
		//String p_idx = request.getParameter("viewidx");
		//productVO vo = ar[0];
		//productVO vo = mapperDAO.productpage(p_idx);
		request.setAttribute("product", ar);
		
		
		Paging page = new Paging();
		page.setNumPerPage(10);
		int totalCount = mapperDAO.getTotalqnaCount();
		page.setTotalRecord(totalCount);
		String cPage = request.getParameter("cPage");
		if(cPage==null) {
			page.setNowPage(1); // page.setNowPage(page.getNoPage());
		}else {
			int nowp = Integer.parseInt(cPage);
			page.setNowPage(nowp);
			// 이때 게시물을 추출할때 사용되는 begin,end가 구해지고 시작 페이지 값과 마지막 페이지 값이 계산된다.
		}
		questionVO[] qar = mapperDAO.questionalllist(page.getBegin(), page.getEnd());
		//vo.setQueslist(mapperDAO.questionlist(page.getBegin(),page.getEnd(),vo.getP_idx()));
		request.setAttribute("qar", qar);
		request.setAttribute("page", page);
		
		return "/question.jsp";
	}

}
