package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;

public class loginAction2 implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		memberVO mvo = mapperDAO.login(id, pw);
		
		if(mvo != null) {
			request.setAttribute("mvo", mvo);
			
			if(mvo.getM_status().equals("0")) {
				request.setAttribute("cnt", 2);
			}else if(mvo.getM_status().equals("1")) {
				request.setAttribute("cnt", 1);
			}
		}else {
			request.setAttribute("cnt", 0);
		}
		
		return "/loginFail.jsp";
	}

}
