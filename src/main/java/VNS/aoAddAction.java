package VNS;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import mybatis.dao.mapperDAO;

import mybatis.vo.orderVO;

public class aoAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
	
		String viewPath = null;
		   String o_idx = request.getParameter("o_idx");
			String o_class = request.getParameter("o_class");
			String o_num = request.getParameter("o_num");
			String o_status = request.getParameter("o_status");
		
			
				
				mapperDAO.oosedit(o_idx, o_class,o_num,o_status);
				
				//원래 있었던 보기화면으로 이동시키기 위해 viewPath를 지정한다.
				viewPath = "Controller?type=aoAdd&o_idx="+o_class;
			
			
	
			// view.jsp에서 [수정]버튼을 클릭했을 때 수행하는 부분!
			
			// b_idx라는 파라미터 받기
			
			orderVO ovo = mapperDAO.getoos(o_idx);
			
			//위의 bvo를 edit.jsp에서 표현하기 위해 request에 저장!
			request.setAttribute("vo",ovo);
			viewPath = "/aoaddpage.jsp";// Controller에 의해서 forward된다.
		return viewPath;
	}

}
