package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;

public class regAction3 implements Action {
	//회원가입 추가
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id2");
		String pw = request.getParameter("pw2");
		String name = request.getParameter("name");
		String add = request.getParameter("add");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		
		int mvo2 = mapperDAO.registry(id, pw, name, add, email, phone, birth);
		
		request.setAttribute("mvo2", mvo2);
		
		return "/mainLogin.jsp";
	}

}
