package VNS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.mapperDAO;
import mybatis.vo.memberVO;
import mybatis.vo.orderVO;
import mybatis.vo.orderlogVO;
import mybatis.vo.productVO;

public class buyokAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		memberVO mvo = null;
		productVO pvo = null;
		String m_idx = request.getParameter("m_idx");
		String p_idx = request.getParameter("p_idx");
		
		//ordervo 를 위한 주문정보 저장
		
		
		
		String p_cnt = request.getParameter("p_cnt");
		String p_price = request.getParameter("p_price");
		String o_type = request.getParameter("o_type");
		String o_cname = request.getParameter("o_cname");
		orderlogVO olvo = new orderlogVO();
		
		if(m_idx!=null&&p_idx!=null) {
			mvo = mapperDAO.getmembervo(m_idx);
			// 만약 pvo가 여러개라면 여기서 다중으로 뽑아줘야함 그리고 뽑은만큼을 i에 저장
			pvo = mapperDAO.productpage(p_idx);
			productVO[] pvoar = new productVO[1];
			pvoar[0]= pvo;
			orderVO ovo = new orderVO();
			ovo.setP_idx(pvo.getP_idx());
			ovo.setPvo(pvo);
			ovo.setO_num(p_cnt);
			ovo.setO_val1(p_cnt);
			ovo.setO_val2(p_price);
			ovo.setO_val3(o_type);
			ovo.setO_val4(o_cname);
			olvo = mapperDAO.owrite(ovo,mvo);
		}
		if(olvo.getOl_idx()!=null) {
			request.setAttribute("result", 1);
			request.setAttribute("ol_idx", olvo.getOl_idx());
		}else {
			request.setAttribute("result", 0);
			request.setAttribute("ol_idx", 0);
		}
		
		
		
		return "/owritechk.jsp";
	}

}
