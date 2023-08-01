package mybatis.vo;

public class orderlogVO {
	
	String ol_idx,m_idx,o_idx,ol_date;
	
	orderVO ovo;
	memberVO mvo;
	
	
	public String getOl_idx() {
		return ol_idx;
	}

	public void setOl_idx(String ol_idx) {
		this.ol_idx = ol_idx;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getO_idx() {
		return o_idx;
	}

	public void setO_idx(String o_idx) {
		this.o_idx = o_idx;
	}

	public String getOl_date() {
		return ol_date;
	}

	public void setOl_date(String ol_date) {
		this.ol_date = ol_date;
	}

	public orderVO getOvo() {
		return ovo;
	}

	public void setOvo(orderVO ovo) {
		this.ovo = ovo;
	}

	public memberVO getMvo() {
		return mvo;
	}

	public void setMvo(memberVO mvo) {
		this.mvo = mvo;
	}


}
