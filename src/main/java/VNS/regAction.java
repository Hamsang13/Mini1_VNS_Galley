package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;

public class regAction implements Action {
	//메인 회원가입 화면 이동
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "/mainReg.jsp";
	}

}
