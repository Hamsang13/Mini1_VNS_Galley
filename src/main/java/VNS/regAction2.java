package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;

public class regAction2 implements Action {
	//아이디 중복체크
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id2");
		
		Boolean reg = mapperDAO.checkId(id);
		
		if(reg) {
			request.setAttribute("cnt2", 0);
		}else {
			request.setAttribute("cnt2", 1);
		}
		return "/loginFail2.jsp";
	}

}
