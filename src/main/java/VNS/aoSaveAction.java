package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.orderVO;


public class aoSaveAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String o_idx = request.getParameter("o_idx");
		
		
		
		orderVO vo = mapperDAO.getoos(o_idx);
		
		
		//얻어낸 vo가 null 아닐 때 vo를 request에 저장! 그리고 뷰 페이지를 view.jsp로 지정하자
		String viewPath = null;
		
	
		String o_class = request.getParameter("o_class");
		String o_num = request.getParameter("o_num");
		String o_status = request.getParameter("o_status");

		if(vo != null) {
			request.setAttribute("vo", vo);

		
		int cnt =  mapperDAO.oosedit(o_idx , o_class,o_num,o_status);
		
		request.setAttribute("cnt", cnt);
		
		
		viewPath = "Controller?type=aoList";
		}
		return viewPath;
	}
}
		
