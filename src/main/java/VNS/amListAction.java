package VNS;

import VNS.util.Paging;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;

public class amListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		//amListAction에서는 관리자페이지 내의 회원목록 가져오는걸로 하기
		
		//페이징 기법에 관련된 객체를 만들기(Paging.java)
		Paging page = new Paging(10,5); 
	
				
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		String m_status = request.getParameter("m_status");
		
		if(m_status == null)
			m_status = "100";
		
		String mm = null;
		if(!m_status.equals("100")) //m_status가 100이 아니면 m_status는 null이 아닌거다.
			mm = m_status;
		
		int count = mapperDAO.getCount(searchType, searchValue, mm);
		
		page.setTotalRecord(count);
		
		
		//현재페이지 값을 파라미터로 받는다.
		String cPage = request.getParameter("cPage");
		
		//현재 페이지가 없다면 넣어준다
		if(cPage ==null) {
			page.setNowPage(1);
		
		}else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		//cPage가 지정되면서 begin, end, startPage, endPage등이 지정되었다.
		
		
		// 회원들 목록 가져오기

 memberVO[] ar = mapperDAO.searchList(searchType, searchValue, String.valueOf(page.getBegin()), String.valueOf(page.getEnd()), mm);
				 		
		  request.setAttribute("ar", ar);
		  request.setAttribute("page", page);
		  request.setAttribute("m_status", m_status);
		  
		  

		return "/amListpage.jsp";
	}

}
