package mybatis.vo;

import java.util.List;

public class questionVO {
	
	String p_idx,m_idx,p_title,p_content,p_sfile,p_price,p_status,p_cnt,p_artist,p_wait,p_secret,o_val1,o_val2 ,o_val3,o_val4,wl_date;

	writelogVO wllog;
	memberVO mvo;
	productVO pvo;
	answerVO[] avolist;
	
	
	List<memberVO> mvolist;
	
	public String getWl_date() {
		return wl_date;
	}
	
	public void setWl_date(String wl_date) {
		this.wl_date = wl_date;
	}
	
	
	public List<memberVO> getMvolist() {
		return mvolist;
	}

	public void setMvolist(List<memberVO> mvolist) {
		this.mvolist = mvolist;
	}

	public productVO getPvo() {
		return pvo;
	}

	public void setPvo(productVO pvo) {
		this.pvo = pvo;
	}

	public memberVO getMvo() {
		return mvo;
	}
	
	public void setMvo(memberVO mvo) {
		this.mvo = mvo;
	}
	
	public writelogVO getWllog() {
		return wllog;
	}
	
	public void setWllog(writelogVO wllog) {
		this.wllog = wllog;
	}
	
	public answerVO[] getAvolist() {
		return avolist;
	}

	public void setAvolist(answerVO[] avolist) {
		this.avolist = avolist;
	}

	public String getP_idx() {
		return p_idx;
	}

	public void setP_idx(String p_idx) {
		this.p_idx = p_idx;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_sfile() {
		return p_sfile;
	}

	public void setP_sfile(String p_sfile) {
		this.p_sfile = p_sfile;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public String getP_cnt() {
		return p_cnt;
	}

	public void setP_cnt(String p_cnt) {
		this.p_cnt = p_cnt;
	}

	public String getP_artist() {
		return p_artist;
	}

	public void setP_artist(String p_artist) {
		this.p_artist = p_artist;
	}

	public String getP_wait() {
		return p_wait;
	}

	public void setP_wait(String p_wait) {
		this.p_wait = p_wait;
	}

	public String getP_secret() {
		return p_secret;
	}

	public void setP_secret(String p_secret) {
		this.p_secret = p_secret;
	}

	public String getO_val1() {
		return o_val1;
	}

	public void setO_val1(String o_val1) {
		this.o_val1 = o_val1;
	}

	public String getO_val2() {
		return o_val2;
	}

	public void setO_val2(String o_val2) {
		this.o_val2 = o_val2;
	}

	public String getO_val3() {
		return o_val3;
	}

	public void setO_val3(String o_val3) {
		this.o_val3 = o_val3;
	}

	public String getO_val4() {
		return o_val4;
	}

	public void setO_val4(String o_val4) {
		this.o_val4 = o_val4;
	}
	

}
