package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.questionVO;
import mybatis.vo.writelogVO;

public class qwriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		questionVO qvo = new questionVO();
		qvo.setM_idx(request.getParameter("m_idx"));
		qvo.setO_val2(request.getParameter("o_val2"));
		qvo.setP_secret(request.getParameter("p_secret"));
		qvo.setP_title(request.getParameter("p_title"));
		qvo.setP_content(request.getParameter("p_content"));
		
		boolean chk = mapperDAO.qwrite(qvo);
		
		if(chk) {
			request.setAttribute("result", 1);
		}else {
			request.setAttribute("result", 0);
		}
		
		return "/qwritechk.jsp";
	}

}