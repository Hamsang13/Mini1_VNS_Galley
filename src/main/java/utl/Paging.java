package utl;

public class Paging {
	
	int nowPage = 1; // 현재 페이지의 값
	int numPerPage = 5; // 한 페이지당 보여질 레코드(게시물)의 수
	
	
	// 페이징을 위한 변수
	int totalRecord; // 총 게시물의 수
	int pagePerBlock = 5; // 페이지 묶음(한 블럭당 보여질 페이지의 수)
	int totalPage; // 전체 페이지의 수
	
	// 게시물 레코드를 가져오기 위한 변수

	int begin; // 현재 페이지의 값에따라 bbs_t db테이블에서 가져올 게시물의 시작 레코드를 의미
	int end; // 현재 페이지의 값에따라 bbs_t db테이블에서 가져올 게시물의 마지막 레코드를 의미
	
	int startPage; // 한 블럭의 시작 페이지값
	int endPage; // 한 블럭의 마지막 페이지값
	
	public Paging() {}
	
	public Paging(int numPerPage,int pagePerBlock) {
		this.numPerPage = numPerPage;
		this.pagePerBlock = pagePerBlock;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		// 현재 페이지 값이 바뀌는 세터이므로 표현할 게시물들이 변경되는걸 수행하도록 한다
		// 즉 begin과 end값이 바뀌므로 db로부터 가져와야한다
		
		// 현재 페이지 값은 총 페이지 값을 넘길 수 없다
		if(nowPage>totalPage)
			nowPage = totalPage;
		
		// 각 페이지의 시작 레코드(begin)과 마지막(end)를 지정하자
		// 현재 페이지가 1이면 begin=1/end=10
		// 현재 페이지가 2이면 begin=11/end=20
		// 현재 페이지가 3이면 begin=21/end=30
		// 현재 페이지가 4이면 begin=31/end=40
		this.begin = (nowPage-1)*numPerPage+1;
		this.end = nowPage*numPerPage;
		
		// 현재 페이지 값에 의해 블럭의 시작페이지를 구하자
		this.startPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		// 페이지 블럭 처음 시작페이지가 1,6,11,16형식으로 나가도록 함
		
		// 블럭의 마지막 페이지 값 구하기
		this.endPage = startPage+pagePerBlock-1;
		// 위에서 구한 endPage값이 전체 페이지 전체 페이지 수보다 클때가 우려됨
		if(endPage>totalPage)
			this.endPage=totalPage;
		
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총 게시물 수가 정해지면 자동적으로 총 페이지 수를 구하자
		
//		this.totalPage = totalRecord/numPerPage;
//		// 토탈 레코드가 52고 넘퍼페이지가 10이면 나머지가 2가 남기떄문에 
//		if(totalRecord%numPerPage!=0)
//			++totalPage;
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		// math.ceil은 더블로 받고 더블로 주는데 가장 가까운 높은 값의 정수를 반환한다 5.2>>6
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
