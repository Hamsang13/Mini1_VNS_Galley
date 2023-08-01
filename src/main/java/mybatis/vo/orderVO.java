package mybatis.vo;

public class orderVO {
	String o_idx,o_class,o_num,o_status,p_idx,o_val1,o_val2,o_val3,o_val4;
	

	productVO pvo;
	
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
	
	

	public productVO getPvo() {
		return pvo;
	}

	public void setPvo(productVO pvo) {
		this.pvo = pvo;
	}

	public String getO_idx() {
		return o_idx;
	}

	public void setO_idx(String o_idx) {
		this.o_idx = o_idx;
	}

	public String getO_class() {
		return o_class;
	}

	public void setO_class(String o_class) {
		this.o_class = o_class;
	}

	public String getO_num() {
		return o_num;
	}

	public void setO_num(String o_num) {
		this.o_num = o_num;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}

	public String getP_idx() {
		return p_idx;
	}

	public void setP_idx(String p_idx) {
		this.p_idx = p_idx;
	}
}
