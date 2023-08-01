<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%!

memberVO mvo = new memberVO();
%>
<%mvo = (memberVO)session.getAttribute("mvo");
		
			%>
<html lang="en">
<head>
  		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
  		<link href="css/bootstrap.css" rel="stylesheet"/>
  <!-- 새로추가 --> 
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>       
<style type="text/css">

table tr td>a{
	text-decoration: none;

}
table tfoot tr td {
	text-align: right;
}

</style>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
			<div class="list-group list-group-flush">
			<a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=admin">관리자 메인 페이지</a>
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Controller?type=aviewList">상품 현황</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Controller?type=aoList">주문 현황</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Controller?type=aqList">문의 현황</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Controller?type=amList">회원 관리</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Controller?type=shop">판매 페이지 돌아가기</a>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<button class="btn btn-primary" id="sidebarToggle">메뉴 토글</button>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
								role="button" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Dropdown</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#!">Action</a> <a
										class="dropdown-item" href="#!">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#!">Something else here</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<br/>
					</div>
				</div>
				
				<div class="row">
					<div class = "col-md-1"></div>
					<div class="col-md-4">
						<h3>상품 현황</h3>
						<br/>
						<br/>
						<br/>
					</div>
				</div>
				
				<div class="row">
					<div class = "col-md-1"></div>
					<div class="col-md-7 col-md-offset-5">
						<form action="Controller" method="get" class="form-inline">

							<div class="row">
								<div class="col-md-3">
									<input type="hidden" name="type" value="search"  /> 
									<select name="searchType" class="form-select">
										<option value="0">통합검색</option>
										<option value="1">제목</option>
										<option value="2">작가</option>
									</select>
								</div>
								<div class="col-md-7">
									<div class="input-group">
									<input class="form-control" placeholder="검색어를 입력하세요" aria-describedby="button-addon" type="text" 
										id="searchValue" name="searchValue" /> 
									<input type="button" class="btn btn-dark" onclick="sendKeyword(this.form)"
										value="검색" id="button-addon" />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>



				<!-- <div class="container-fluid"> -->
				<div class="row">
					<div class = "col-md-1"></div>
					<div class="col-md-9 col-md-offset-1">
						<br/>
						<table class="table table-hover">
							<colgroup>
								<col width="100px">
								<col width="200px">
								<col width="300px">
								<col width="200px">
								<col width="200px">
								<col width="120px">
								<col width="100px">
							</colgroup>
							<thead>

								<tr class="">
									<th scope="col">NO.</th>
									<th scope="col"></th>
									<th scope="col">상품명</th>
									<th scope="col">작가</th>
									<th scope="col">가격</th>
									<th scope="col">상태</th>
									<th scope="col">수량</th>
								</tr>
							</thead>
							<tbody>


								<c:forEach var="pvo" items="${requestScope.pAr }">
									<tr>
										<td>${pvo.p_idx }</td>
										<td><img src="${pvo.p_sfile}" width="70" /></td>
										<td><a href="Controller?type=aproduct&p_idx=${pvo.p_idx}">${pvo.p_title }</a></td>
										<td>${pvo.p_artist }</td>
										<td><fmt:formatNumber pattern="#,###"
												value="${pvo.p_price }" /> ￦</td>
										<td><c:if test="${pvo.p_status eq 1 }">판매중</c:if> <c:if
												test="${pvo.p_status eq 0 }">판매완료</c:if></td>
										<td>${pvo.p_cnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
						<div class = "row">
						<div class = "col-md-5"></div>
						<div class = "col-md-4">
						<br/>
						<br/>
						<table>
							<tbody>
								<tr>
									<td colspan="7">
										<ol class="pagination">
											<c:if test="${page.startPage < page.pagePerBlock}">
												<li class="page-item disabled"><a class = "page-link">&lt;</a></li>
											</c:if>
											<c:if test="${page.startPage >= page.pagePerBlock}">
												<li class="page-item"><a class="page-link"
													href="Controller?type=aviewList&cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
											</c:if>
											<c:forEach begin="${page.startPage }" end="${page.endPage }"
												varStatus="st">
												<c:if test="${page.nowPage eq st.index}">
													<li class="page-item active"><a class = "page-link">${st.index}</a></li>
												</c:if>
												<c:if test="${page.nowPage ne st.index }">
													<li class="page-item"><a class="page-link"
														href="Controller?type=aviewList&cPage=${st.index}">${st.index }</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${page.endPage<page.totalPage}">
												<li class="page-item"><a class="page-link"
													href="Controller?type=aviewList&cPage=${page.startPage+page.pagePerBlock }">&gt;</a></li>
											</c:if>
											<c:if test="${page.endPage == page.totalPage}">
												<li class="page-item disabled"><a class = "page-link">&gt;</a></li>
											</c:if>
										</ol>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						</div>
						<div class="col-md-1">
							<input type="button" class="btn btn-primary"
											value="작품 등록"
											onclick="javascript:location.href='Controller?type=aadd'" />
							</div>
						</div>
					</div>

				</div>
			</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		function sendKeyword(frm) {

			if (frm.searchValue.value == "") {
				alert("검색어를 1자 이상 입력하세요");
				frm.searchValue.focus();
				return;
			}

			frm.submit();
		}
	</script>
</body>
</html>
