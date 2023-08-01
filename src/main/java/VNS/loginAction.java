package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;

public class loginAction implements Action {
	//메인 로그인 페이지 이동
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "/mainLogin.jsp";
	}

}
