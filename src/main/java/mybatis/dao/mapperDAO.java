package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.memberVO;
import mybatis.vo.orderVO;
import mybatis.vo.orderlogVO;
import mybatis.vo.productVO;
import mybatis.vo.questionVO;
import mybatis.vo.writelogVO;


public class mapperDAO {
	
	// 페이징 관련
	
	public static int getTotalCount(String p_idx) {
		 SqlSession ss = FactoryService.getssf().openSession();
		 int totalCount = ss.selectOne("mapper.totalcount",p_idx);
		 ss.close();
		 return totalCount;
	 }
	public static int getTotalqnaCount() {
		SqlSession ss = FactoryService.getssf().openSession();
		int totalCount = ss.selectOne("mapper.totalqnacount");
		ss.close();
		return totalCount;
	}
	
	

	
	// 상품 페이지 관련
	
	public static productVO[] shopalllist() {
		productVO[] ar = null;
		SqlSession ss = FactoryService.getssf().openSession();
		List<productVO> list = ss.selectList("mapper.shopalllist");
		
		ss.close();
		if(list!=null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new productVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		
		return ar;
	}
	public static productVO[] shoplist() {
		productVO[] ar = null;
		SqlSession ss = FactoryService.getssf().openSession();
		List<productVO> list = ss.selectList("mapper.shoplist");
		
		ss.close();
		if(list!=null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new productVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		
		return ar;
	}
	public static productVO[] museumlist() {
		productVO[] ar = null;
		SqlSession ss = FactoryService.getssf().openSession();
		List<productVO> list = ss.selectList("mapper.museumlist");
		
		ss.close();
		if(list!=null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new productVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		
		return ar;
	}
	
	public static productVO[] shopsearchlist(String type ,String str) {
		productVO[] ar = null;
		SqlSession ss = FactoryService.getssf().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("str", str);
		
		List<productVO> list = ss.selectList("mapper.shopsearchlist" ,map);
		
		ss.close();
		if(list!=null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new productVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		
		return ar;
	}
	public static productVO[] museumsearchlist(String type ,String str) {
		productVO[] ar = null;
		SqlSession ss = FactoryService.getssf().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("str", str);
		
		List<productVO> list = ss.selectList("mapper.museumsearchlist" ,map);
		
		ss.close();
		if(list!=null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new productVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		
		return ar;
	}
	
	
	public static productVO productpage(String p_idx) {
		productVO vo = null;
		SqlSession ss = FactoryService.getssf().openSession();
		vo = ss.selectOne("mapper.viewproduct" , p_idx);
		ss.close();
		return vo;
	}
	
	public static memberVO getmembervo(String m_idx) {
		memberVO vo = null;
		SqlSession ss = FactoryService.getssf().openSession();
		vo = ss.selectOne("mapper.membersel" , m_idx);
		ss.close();
		return vo;
		
	}
	public static orderlogVO getorderlogvo(String ol_idx) {
		orderlogVO vo = null;
		SqlSession ss = FactoryService.getssf().openSession();
		vo = ss.selectOne("mapper.orderlist" , ol_idx);
		ss.close();
		return vo;
		
	}
	
	
	public static questionVO[] questionlist(int begin , int end , String p_idx){
		questionVO[] ar = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("p_idx", Integer.parseInt(p_idx));
		SqlSession ss = FactoryService.getssf().openSession();
		
		List<questionVO> list = ss.selectList("queslistpage",map);
		
		if(list!=null && !list.isEmpty()) {
		ar = new questionVO[list.size()];
		list.toArray(ar);
		}
		ss.close();
		return ar;
		
	}
	public static questionVO[] questionalllist(int begin , int end){
		questionVO[] ar = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = FactoryService.getssf().openSession();
		
		List<questionVO> list = ss.selectList("queslistall",map);
		
		if(list!=null && !list.isEmpty()) {
			ar = new questionVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
		
	}
	
	
	public static boolean qwrite(questionVO qvo) {
		boolean chk = false;
		SqlSession ss = FactoryService.getssf().openSession();
		int cnt = ss.insert("qwrite", qvo);
		if(cnt>0) {
			ss.commit();
			writelogVO wlovo = new writelogVO();
			wlovo.setM_idx(qvo.getM_idx());
			wlovo.setP_idx(qvo.getP_idx());
			int cnt2=ss.insert("qwrite_log",wlovo);
			if(cnt2>0) {
				ss.commit();
				chk=!chk;
			}else
				ss.rollback();
		}else {
			ss.rollback();
		}
		ss.close();
		return chk;
	}
	
	public static orderlogVO owrite(orderVO ovo,memberVO mvo) {
		boolean chk = false;
		SqlSession ss = FactoryService.getssf().openSession();
		int cnt = ss.insert("owrite", ovo);
		orderlogVO olvo = new orderlogVO();
		if(cnt>0) {
			ss.commit();
			Map<String, String> map = new HashMap<String, String>();
			olvo.setM_idx(mvo.getM_idx());
			olvo.setO_idx(ovo.getO_idx());
			int cnt2=ss.insert("owrite_log",olvo);
			map.put("o_val1",ovo.getO_val1());
			map.put("p_idx",ovo.getP_idx());
			ss.update("cntupdate",map);
			if(cnt2>0) {
				ss.commit();
				chk=!chk;
				return olvo;
			}else
				ss.rollback();
		}else {
			ss.rollback();
		}
		ss.close();
		return olvo;
	}
	
	
	
	// 영석씨 로그인
	
	public static memberVO login(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_id", id);
		map.put("m_pw", pw);
		
		SqlSession ss = FactoryService.getssf().openSession();
		
		memberVO mvo = ss.selectOne("mapper.login", map);
		ss.close();
		
		return mvo;
	}
	
	//아이디 체크
	public static boolean checkId(String id) {
		boolean chk = false;
		
		SqlSession ss = FactoryService.getssf().openSession();
		memberVO mvo = ss.selectOne("mapper.reg", id);
		ss.close();
		//같은 아이디가 없을때만 chk에 true를 넣는다.
		if(mvo == null) {
			chk = true;
		}
		
		return chk;
	}
	
	//회원가입
	public static int registry(String id, String pw, String name, String add, 
	String email, String phone, String birth) { 
	int cnt = 0;
	  
	Map<String, String> map = new HashMap<String, String>(); 
	map.put("m_id",id); 
	map.put("m_pw", pw); 
	map.put("m_name", name); 
	map.put("m_add", add); 
	map.put("m_email", email); 
	map.put("m_phone", phone);
	map.put("m_birth", birth);
	  
	SqlSession ss = FactoryService.getssf().openSession();
	 
	cnt = ss.insert("mapper.add", map);

	if(cnt > 0){ 
		ss.commit(); 
	}
	ss.close();
	  
	return cnt; 
	}
	public static orderlogVO[] myorder(String m_idx) {
		orderlogVO[] ar=null;
	
	    SqlSession ss = FactoryService.getssf().openSession();
	    List<orderlogVO> list = ss.selectList("mapper.myorderlist" , m_idx);
		
		ss.close();
		if(list!=null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new orderlogVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		return ar;
		
	}
	
	
//	지혜시 상품등록
	

	public static  int getSearchPvoCount(String searchType, String searchValue) {
		SqlSession ss = FactoryService.getssf().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		int cnt = ss.selectOne("mapper.searchPVO_count",map);
		
		ss.close();
		return cnt;
	}
	public static productVO[] searchPVO(String searchType, String searchValue, String begin, String end) {
		productVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = FactoryService.getssf().openSession();
		List<productVO> list = ss.selectList("mapper.searchPVO", map);
		
		if(list!=null && !list.isEmpty()) {
			ar = new productVO[list.size()];
			if(ar != null)
				list.toArray(ar);
		}
		ss.close();
		
		return ar;
		
	}
	
	public static productVO[] getAdminPvoList(String begin, String end) {
		productVO[] ar = null;
		
		SqlSession ss = FactoryService.getssf().openSession();
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);

		List<productVO> list = ss.selectList("mapper.getAdminPvolist", map);
		
		if(list!=null && !list.isEmpty()) {
			ar = new productVO[list.size()];
			if(ar != null)
				list.toArray(ar);
		}
		ss.close();
		
		return ar;
	}
	public static productVO getAdminPvo(String p_idx) {
		productVO vo = null;
		
		SqlSession ss = FactoryService.getssf().openSession();
		
		vo=ss.selectOne("mapper.selectAdminPvo", p_idx);
		
		ss.close();
		return vo;
	}
	
	public static  int getPvoCount() {
		SqlSession ss = FactoryService.getssf().openSession();
		
		int cnt = ss.selectOne("mapper.countPvo");
		
		ss.close();
		return cnt;
	}
	public static int editAdminPvo(String p_idx,String p_status, String title,String artist,String price,String content,
				String cnt,String m_idx,String s_file) {
		SqlSession ss = FactoryService.getssf().openSession();
		
		productVO vo = new productVO();
		vo.setP_idx(p_idx);
		vo.setP_title(title);
		vo.setP_artist(artist);
		vo.setP_price(price);
		vo.setP_content(content);
		vo.setP_cnt(cnt);
		vo.setM_idx(m_idx);
		vo.setP_sfile(s_file);
		vo.setP_status(p_status);
		
		int ct = ss.update("mapper.aPvoedit", vo);
		
		if(ct>0) {
			ss.commit();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_idx", m_idx);
			map.put("p_idx",p_idx);
		
			int s = ss.insert("mapper.wladd", map);
		
			if(s>0)
				ss.commit();
			else
				ss.rollback();
		
		}else
			ss.rollback();
		ss.close();
		
		return ct;
	}
	
	public static int addAdminPvo(String title,String artist,String price,String content,
				String cnt,String m_idx,String fname) {
		SqlSession ss = FactoryService.getssf().openSession();
		//oname...
		
		productVO vo = new productVO();
		vo.setP_title(title);
		vo.setP_artist(artist);
		vo.setP_price(price);
		vo.setP_content(content);
		vo.setP_cnt(cnt);
		vo.setM_idx(m_idx);
		vo.setP_sfile(fname);
		
		System.out.println("vo.getm_idx:"+vo.getM_idx());
		
		int ct=ss.insert("mapper.aPvoadd", vo);

		String k = vo.getP_idx();
		
		if(ct>0) {
			ss.commit();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_idx", m_idx);
			map.put("p_idx",k);
		
			int s = ss.insert("mapper.wladd", map);
		
			if(s>0)
				ss.commit();
			else
				ss.rollback();
		
		}else 
			ss.rollback();
			
		ss.close();

		return ct;
	}
	
	/*대시보드용*/
	
	public static Map<String,Integer> getCountForD(){
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		
		SqlSession ss = FactoryService.getssf().openSession();
		
		int pS = ss.selectOne("adminPVOcountS");
		int pSo = ss.selectOne("adminPVOcountSO");
		
		int oSr = ss.selectOne("adminOVOcountSR");
		int oSn = ss.selectOne("adminOVOcountSN");
		int oSf = ss.selectOne("adminOVOcountSF");
		int oOf = ss.selectOne("adminOVOcountOF");
		
		
		int qAr = ss.selectOne("adminQVOcountAR");
		int qAf = ss.selectOne("adminQVOcountAF");
		
		map.put("ps", pS);
		map.put("pso", pSo);
		map.put("osr", oSr);
		map.put("osn", oSn);
		map.put("osf", oSf);
		map.put("oof", oOf);
		map.put("qar", qAr);
		map.put("qaf", qAf);
		
		ss.close();
		
		return map;
	}
	
	
	
/*문의*/
	public static questionVO[] getlist(int begin, int end) {
		questionVO[] ar = null;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = FactoryService.getssf().openSession();
		List<questionVO> list = ss.selectList("mapper.qlist", map);

		
		if (list != null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new questionVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		ss.close();
		return ar;
	}

	

	public static questionVO[] getlist2(String p_idx, String m_idx) {
		
		HashMap<String,String>map = new HashMap<String, String>();
		map.put("p_idx", p_idx);
		map.put("m_idx", m_idx);
		
		questionVO[] ar = null;

		SqlSession ss = FactoryService.getssf().openSession();
		
		List<questionVO> list = ss.selectList("mapper.ViewQlist", map);

		
		
		  if (list != null && !list.isEmpty()) { 
		// 리스트의 크기만큼 배열을 생성 ar = new
			  ar = new questionVO[list.size()]; 
		  // 리스트의 요소들로 배열을 채워야한다. list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌 
			  list.toArray(ar);
		  }
		  ss.close();

		return ar;
	}
	
	public static int answerAdd(String p_title, String p_content, String p_secret, String o_val2, String m_idx) {
		questionVO qvo = new questionVO();
		
		qvo.setP_title(p_title);
		qvo.setP_content(p_content);
		qvo.setP_secret(p_secret);
		
		qvo.setO_val2(o_val2);
		qvo.setM_idx(m_idx);
		
		SqlSession ss = FactoryService.getssf().openSession();
		int cnt = ss.insert("mapper.answerAdd", qvo);
		
		if(cnt>0) {
			
			int cnt2 = ss.insert("mapper.logAdd", qvo);
			
			if(cnt2>0)
				ss.commit();
		}
		ss.close();
		return cnt;
	}
	
	public static questionVO[] getAnswer(String oval) {
		questionVO[] ar = null;

		SqlSession ss = FactoryService.getssf().openSession();
		List<questionVO> list = ss.selectList("mapper.getAnswer", oval);

		
		if (list != null && !list.isEmpty()) {
			// 리스트의 크기만큼 배열을 생성
			ar = new questionVO[list.size()];
			// 리스트의 요소들로 배열을 채워야한다.
			list.toArray(ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
		}
		ss.close();
		return ar;
	}
	
	public static int updateWait(String oval) {
		SqlSession ss = FactoryService.getssf().openSession();
		int cnt = ss.update("mapper.updateWait", oval);
		
		if(cnt>0) {
			ss.commit();
	}
		ss.close();
		return cnt;
	}
	
	public static int updateStatus(String del_idx) {
		SqlSession ss = FactoryService.getssf().openSession();
		int cnt = ss.update("mapper.updateStatus", del_idx);
		
		if(cnt>0) {
			ss.commit();
	}
		ss.close();
		return cnt;
	}
	public static int updateWait2(String p_idx) {
		SqlSession ss = FactoryService.getssf().openSession();
		int cnt = ss.update("mapper.updateWait2", p_idx);
		
		if(cnt>0) {
			ss.commit();
		}
		ss.close();
		return cnt;
	}
	
	//총 게시물 수를 반환하는 기능
		public static int getTotalCount() {
			SqlSession ss = FactoryService.getssf().openSession();
			int cnt = ss.selectOne("mapper.totalCount");
			ss.close();
			
			return cnt;
		}
		
	
/*문의*/
		
/*회원*/
		
		
		//전체데이터 수 반환
		public static int getCount(String searchType, String searchValue, String m_status) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			map.put("m_status", m_status);
			
			SqlSession ss = FactoryService.getssf().openSession();
			int cnt = ss.selectOne("mapper.count", map);
			ss.close();
			
			return cnt;
		}
		
		
		//회원들의 리스트를 보여줌
		public static memberVO[] getMemList (String begin, String end, String m_status) {
				 	
			memberVO[]m_ar = null;
			
			Map<String, String> map = new HashMap<String, String>();

			map.put("begin", begin);
			map.put("end", end);
			map.put("m_status", m_status);
			
			SqlSession ss = FactoryService.getssf().openSession();
			List<memberVO>m_list = ss.selectList("mapper.amemlist",map);
			
			
			if(m_list!=null && !m_list.isEmpty()) {
				// 리스트의 크기만큼 배열을 생성
				m_ar = new memberVO[m_list.size()];
				// 리스트의 요소들로 배열을 채워야한다.
				m_list.toArray(m_ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
			}
			ss.close(); 
			return m_ar;
		}
		
		//회원 검색
		public static memberVO[] searchList(String searchType, String searchValue, 
				String begin, String end, String m_status) {
			
			memberVO[]m_ar = null;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			map.put("begin", begin);
			map.put("end", end);
			map.put("m_status", m_status);
			
			SqlSession ss = FactoryService.getssf().openSession();
			List<memberVO>m_list = ss.selectList("mapper.search",map);
			
			
			if(m_list!=null && !m_list.isEmpty()) {
				// 리스트의 크기만큼 배열을 생성
				m_ar = new memberVO[m_list.size()];
				// 리스트의 요소들로 배열을 채워야한다.
				m_list.toArray(m_ar); // 같은 사이즈의 배열에 값을 복사해서 넣어줌
			}
			ss.close(); 
			return m_ar;
		}
		
		
		
		
		// 회원 상세보기(호출은 amdAction에서 하고, amDetailpage.jsp 로 이동)
		public static memberVO getmember(String m_idx) {
			
			SqlSession ss = FactoryService.getssf().openSession();
			memberVO mvo = ss.selectOne("mapper.amember",m_idx);
			ss.close();
			
			return mvo;

		}
		
		// 회원 계정정지
		public static int suspendMem(String m_idx, String m_status) {
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_idx", m_idx);
			map.put("m_status", m_status);
			
			SqlSession ss = FactoryService.getssf().openSession();
			int cnt = ss.update("mapper.suspendmem",map);
			
			if(cnt>0)
				ss.commit();
			else
				ss.rollback();
			
			ss.close();
			return cnt;
		}
/*회원*/
		/*주문*/
		public static orderVO[] getoosList(String searchType, String searchValue,
				String begin, String end) {
			orderVO[] ar = null;
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("searchValue", searchValue);
			map.put("searchType", searchType);
			map.put("begin", begin);
			map.put("end", end);
			
			SqlSession ss = FactoryService.getssf().openSession();
			List<orderVO> list = ss.selectList("mapper.ooslist", map);
			
			if(list != null && list.size() > 0) {
				// list가 null이 아니고 길이가 0보다 크다면 DB로부터
				// 자원을 가져왔다는 뜻이니 배열을 생성하고, 
				// list에 있는 요소들을 그대로 배열로 복사해 넣는다.
				ar = new orderVO[list.size()];
				
				list.toArray(ar);
			}
			ss.close();
			
			return ar;
		}
		
		//전체 게시물 수를 세서 반영해주는 
		public static int getoosTotalCount() {
			
			
			SqlSession ss = FactoryService.getssf().openSession();
			int cnt = ss.selectOne("mapper.oostotalCount");
			ss.close();
			
			return cnt;
		}
		
		// 보기 기능에서 사용하는 게시물 반환 기능 - 호출은 ViewAction에서 한다.
		public static orderVO getoos(String o_idx) {
			
			SqlSession ss = FactoryService.getssf().openSession();
			orderVO vo = ss.selectOne("mapper.getoos", o_idx);
			ss.close();
			
			return vo;
		}
		
		
		
		
		
		public static int oosedit(String o_idx , String o_class,String o_num,String o_status) {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("o_idx", o_idx);
			map.put("o_class", o_class);
			map.put("o_num", o_num);
			map.put("o_status", o_status);
			
			
			
			SqlSession ss = FactoryService.getssf().openSession();
			int cnt = ss.update("mapper.oosadd", map);
			if(cnt > 0)
				ss.commit();
			else
				ss.rollback();
			
			ss.close();
			
			return cnt;
		}
	
}
