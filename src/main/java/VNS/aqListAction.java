package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VNS.util.Paging;
import mybatis.dao.mapperDAO;
import mybatis.vo.questionVO;
import mybatis.vo.writelogVO;

public class aqListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
				// 페이징 처리를 위한 객체생성
				Paging page = new Paging();
				
				//전체 페이지 값을 구하기 위해 먼저 총 게시물의 수를 구해야 한다.
				//int totalCount = BbsDAO.getTotalCount();
				
				//위에서 구한 총 게시물 수를 page객체에 저장한다.
				//page.setTotalRecord(totalCount);
				page.setTotalRecord(mapperDAO.getTotalCount());
				
				//이렇게 총 게시물 수가 저장되는 순간, 총 페이지 수까지 구해진다.
				
				//현재 페이지 값을 파라미터로 받는다.
				String cPage = request.getParameter("cPage");
				
				if(cPage == null)
					page.setNowPage(1);// page.setNowPage(page.getNowPage());
				else {
					int nowPage = Integer.parseInt(cPage);
					page.setNowPage(nowPage); // 이때!!!!!!
					// 게시물을 추출할 때 사용되는 begin과 end가 구해지고 더불어
					// 시작페이지 값과 마지막페이지 값도 구해진다.
				}
		
		questionVO[] ar = mapperDAO.getlist(page.getBegin(), page.getEnd());
		
		String viewPath = null;
		
			request.setAttribute("page", page);
			request.setAttribute("vo", ar);
			 
			
			viewPath = "/aqListpage.jsp";
		
		
		return viewPath;
	}

}
