package VNS;

import java.io.File;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;

import mybatis.vo.orderVO;

public class aoViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 게시물을 구별하는 기본키인 b_idx를 파라미터로 받아야 한다.
		String o_idx = request.getParameter("o_idx");
		
	
		// DAO를 통해 원하는 게시물을 BbsVO로 받는다.
		orderVO vo = mapperDAO.getoos(o_idx);
		
		
		
		//얻어낸 vo가 null 아닐 때 vo를 request에 저장! 그리고 뷰 페이지를 view.jsp로 지정하자
		String viewpath = null;
		if(vo != null) {
			request.setAttribute("vo", vo);
			viewpath = "/aoViewpage.jsp";
		}
		
		return viewpath;
	}

}
