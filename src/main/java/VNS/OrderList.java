package VNS;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;
import mybatis.vo.orderVO;
import mybatis.vo.orderlogVO;

public class OrderList implements Action {

	//주문한 상품들 조회하는 액션
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		String m_idx = request.getParameter("m_idx");
		String ol_idx = request.getParameter("ol_idx");
		orderlogVO olvo = mapperDAO.getorderlogvo(ol_idx);
		request.setAttribute("olvo", olvo);
		//String m_id = request.getParameter("m_id");
		//String m_status = request.getParameter("m_status");
		orderlogVO[] olar = mapperDAO.myorder(m_idx);
		request.setAttribute("orderlist", olar);
		
		return "order.jsp";
	}

}
