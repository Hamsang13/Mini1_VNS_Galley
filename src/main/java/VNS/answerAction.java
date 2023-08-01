package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;
import mybatis.vo.questionVO;

public class answerAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String p_title = request.getParameter("title");
		String p_content = request.getParameter("content");
		String p_secret = request.getParameter("secret");
		String o_val2 = request.getParameter("oval");
		
		String m_idx = request.getParameter("m_idx");
		int cnt = mapperDAO.answerAdd(p_title, p_content, p_secret, o_val2, m_idx);
		
		int cnt2 = mapperDAO.updateWait(o_val2);
		
		  request.setAttribute("cnt", cnt);
		  
		  
		return "answer_save.jsp";
	}

}
