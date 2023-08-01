package mybatis.vo;

public class writelogVO {
	String wl_idx,m_idx,p_idx,wl_date;
	
	productVO pvo;
	memberVO mvo;

	public memberVO getMvo() {
		return mvo;
	}

	public void setMvo(memberVO mvo) {
		this.mvo = mvo;
	}

	public productVO getPvo() {
		return pvo;
	}

	public void setPvo(productVO pvo) {
		this.pvo = pvo;
	}

	public String getWl_idx() {
		return wl_idx;
	}

	public void setWl_idx(String wl_idx) {
		this.wl_idx = wl_idx;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getP_idx() {
		return p_idx;
	}

	public void setP_idx(String p_idx) {
		this.p_idx = p_idx;
	}

	public String getWl_date() {
		return wl_date;
	}

	public void setWl_date(String wl_date) {
		this.wl_date = wl_date;
	}
}
