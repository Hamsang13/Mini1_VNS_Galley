<%@page import="VNS.util.Paging"%>
<%@page import="mybatis.vo.orderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
table {
	width: 800px;
	border-collapse: collapse;
}

table th, table td {
	/*border: 2px solid black;*/
	padding: 4px;
}

table caption {
	text-indent: -9999px;
	height: 0;
}

.popup {
	display: none;
}

.empty {
	height: 50px;
	color: #ababab;
}
</style>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet" />
<!-- 새로추가 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
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
					<button class="btn btn-pirmary" id="sidebarToggle">메뉴 토글</button>
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
					<div class ="col-md-1"></div>
					<div class="col-md-11">
						<br/>
						<h1>주문 현황</h1>
						<br/>
						<br/>
					</div>
				</div>
				<div class="row">
					<div class = "col-md-1"></div>
					<div class="col-md-7 col-md-offset-5">
						<form name="frm" action="Controller" method="post">
						<input type="hidden" name="type" value="aoList" />
						<table>
							<tbody align=center>
							
							<thead>
								<tr>
        								<td>
        								<div class = "row">
										<div class = "col-md-3">
										<select id="SearchType" name="searchType" class="form-select">
											<option value="0">목록</option>
											<option value="1">주문자</option>
											<option value="2">주문번호</option>
											<option value="3">상품번호</option>
											<option value="4">주문상태</option>
										</select> 
										</div>
										<div class="col-md-7">
										<div class ="input-group">
										<input class="form-control" placeholder="검색어를 입력하세요"
												aria-describedby="button-addon" type="text" id="searchValue"
														name="searchValue" /> 
										<input type="button" class="btn btn-dark"
											onclick="sendKeyword(this.form)" value="검색" id="button-addon" />
											</div>
											</div>
										</td>
            						</tr>
            					</thead>
            					</table>
            				</div>
            			</div>
            			<div class = "row">
            			<div class="col-md-1"></div>
            					<div class="col-md-9">
								<table class="table table-hover">
								<thead>
								<tr style="background:#uu7785">
               			 			<th>목록</th>
                						<th>주문자</th>
               			 			<th>주문번호</th>
                						<th>상품번호</th>
               			 			<th>주문상태</th>
           						 </tr>
							</thead>
           			  		<tbody>
           			 		<c:forEach var="pvo" items="${requestScope.ar }" varStatus="st">
           			 			<tr>
						<%--<td>${page.totalRecord - ((page.nowPage-1)*page.numPerPage+st.index) }</td> --%>
									<td>${pvo.o_idx}</td>
					    			<td>${pvo.o_class}</td>
									<td><a href="Controller?type=aoView&o_idx=${pvo.o_idx }"><c:out
													value="${pvo.o_num }"></c:out></a></td>
									<td>${pvo.p_idx}</td>
									<td>
                                    <c:choose>
                                        <c:when
													test="${pvo.o_status == 1}">배송준비중</c:when>
                                        <c:when
													test="${pvo.o_status == 2}">배송중</c:when>
                                        <c:when
													test="${pvo.o_status == 3}">배송완료</c:when>
                                        <c:otherwise>택배가 가출했어요</c:otherwise>
                                    </c:choose>
                                </td>
                              </tr>
				</c:forEach>
				  	</tbody>
			</table>
			</form>
			</div>
		</div>
		<div class = "row">
			<div class ="col-md-4"></div>
			<div class ="col-md-5">
			<table>
			<tfoot>
                     <tr>
						<td>
								<ol class="pagination">
											<c:if test="${page.startPage < page.pagePerBlock}">
												<li class="page-item disabled"><a class="page-link">&lt;</a></li>
											</c:if>
											<c:if test="${page.startPage >= page.pagePerBlock}">
												<li class="page-item"><a class="page-link"
													href="Controller?type=aoView&cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
											</c:if>
											<c:forEach begin="${page.startPage }" end="${page.endPage }"
												varStatus="st">
												<c:if test="${page.nowPage eq st.index}">
													<li class="page-item active"><a class="page-link">${st.index}</a></li>
												</c:if>
												<c:if test="${page.nowPage ne st.index }">
													<li class="page-item"><a class="page-link"
														href="Controller?type=aoList&cPage=${st.index}">${st.index }</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${page.endPage<page.totalPage}">
												<li class="page-item"><a class="page-link"
													href="Controller?type=aoView&cPage=${page.startPage+page.pagePerBlock }">&gt;</a></li>
											</c:if>
											<c:if test="${page.endPage == page.totalPage}">
												<li class="page-item disabled"><a class="page-link">&gt;</a></li>
											</c:if>
										</ol>
						</td>
					</tr>
				</tfoot>
				</table>
			</div>
		</div>
	</div>
	</div>
	
	<%-- 추가Popup --%>
	<div id="add_popup" class="popup" title="내역 수정 ">
		<div id="content">
		<form action="Controller" method="post">
			<input type="hidden" name="type" value="add" />
			<label for="deptno">주문환불</label>
			<input type="text" id="deptno" name="deptno" /><br />
			<label for="dname">주문반품</label>
			<input type="text" id="dname" name="dname" /><br />
			<label for="location_id">주문상태확인</label>
			<input type="text" id="location_id" name="location_id" /><br />
			
			<input type="button" value="뒤로" onclick="add(this.form)" />
			
		</form>
		</div>
	</div>
	
	<div id="search_popup" class="popup" title="리모컨">
		<div id="content">
		<form action="Controller" method="post">
			<input type="hidden" name="type" value="list" />
			<select id="searchType" name="search1">
				<option value="0">뒤로</option>
				<option value="1">메인으로</option>
				<option value="2">상품창으로</option>
			</select>
			<input type="text" id="searchValue" name="search2" /><br />
			<input type="button" value="이동" onclick="search(this.form)" />
		</form>
		</div>
	</div>
	</div>
	</div>
	
    
      <script type="text/javascript" src="js/bootstrap.js"></script>
            
       <!-- 제이쿼리 -->
       <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
       </script>

       <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
       <script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
       </script>
       
       
        
        <!-- Bootstrap core JS-->
        <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
           <script>
        function sendKeyword(form){
        	
         	 var value = $("#searchValue").val();
			console.log(value);
    		if(value.trim().length < 1){
    			alert("검색어를 1자 이상 입력하세요");
           		$("searchValue").focus();
           		return;
    		}
    		document.frm.submit();
    	} 
        
        function fn_cancel_order(order_id){
            var answer=confirm("주문을 취소하시겠습니까?");
            if(answer==true){
                var formObj=document.createElement("form");
                var i_order_id = document.createElement("input"); 
                
                i_order_id.name="order_id";
                i_order_id.value=order_id;
                
                formObj.appendChild(i_order_id);
                document.body.appendChild(formObj); 
                formObj.method="post";
                formObj.action="${contextPath}/mypage/cancelMyOrder.do";
                formObj.submit();    
            }
            	
          
        }
        		
        
        </script>
    </body>
</html>
