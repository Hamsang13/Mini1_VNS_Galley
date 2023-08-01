package VNS;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.productVO;

public class psearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		ProductPaging page = new ProductPaging(10, 5);
		
		String cPage = request.getParameter("cPage");
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		//전체 레코드수 받기
		int count = mapperDAO.getSearchPvoCount(searchType, searchValue);
		page.setTotalRecord(count);
		
		if(cPage == null || cPage == "0") {
			page.setNowPage(1);
		}else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		
		productVO[] ar = mapperDAO.searchPVO(searchType, searchValue,String.valueOf(page.getBegin()),String.valueOf(page.getEnd()));
		
		//검색결과 리스트를 다시 불러오기 위해 searchType과 searchValue를 map에 저장했음!!
		Map<String, String> map =new HashMap<String, String>();
		map.put("stype", searchType);
		map.put("svalue", searchValue);
		
		request.setAttribute("searchS", map);
		request.setAttribute("searchAr", ar);
		request.setAttribute("page", page);
		return "/searchList.jsp";
	}

}
