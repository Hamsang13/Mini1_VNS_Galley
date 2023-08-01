package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;


public class amdAction implements Action {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//게시물을 구별하는 기본키인 b_idx를 파라미터로 받아야한다.(jsp에서 보여줘야하기 때문에)
		
		String m_idx = request.getParameter("m_idx");
		
		memberVO mvo = mapperDAO.getmember(m_idx);
						
		if(mvo!=null)
		request.setAttribute("mvo", mvo);
		
		return "/amDetailpage.jsp";
	}
	
	
}
