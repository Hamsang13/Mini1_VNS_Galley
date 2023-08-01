package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import VNS.util.Paging;
import VNS.Action;

import mybatis.dao.mapperDAO;
import mybatis.service.FactoryService;
import mybatis.vo.orderVO;

public class aoListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 페이징 처리를 위한 객체생성
				Paging page = new Paging(10,5);
				
				String searchType = request.getParameter("searchType");
				String searchValue = request.getParameter("searchValue");

				
				
				//이렇게 총 게시물 수가 저장되는 순간, 총 페이지 수까지 구해진다.
				page.setTotalRecord(mapperDAO.getoosTotalCount());
				
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
	
				// JSP에서 표현할 게시물들을 가져온다.
				
				orderVO[] ar = mapperDAO.getoosList(searchType, searchValue, 
						String.valueOf(page.getBegin()), String.valueOf(page.getEnd()));
				
				// JSP에서 표현할 수 있도록 request에 저장하자!
				request.setAttribute("ar", ar);
				request.setAttribute("page", page);
				
		
				return "/aoListpage.jsp";
			}

}
