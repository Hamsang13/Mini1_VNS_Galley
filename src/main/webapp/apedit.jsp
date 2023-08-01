<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%!

memberVO mvo;
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
	<link rel="stylesheet" href="css/summernote-lite.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>  
  </head>
<body>
	<div class="d-flex" id="wrapper">

		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
			<div class="list-group list-group-flush">
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

			<div class="container-fluid">
				<c:set var="pr" value="${requestScope.pvoE}" />
				<div class="row">

					<div class="col-md-4">
						<br/>
						<h4>&nbsp;&nbsp;&nbsp;상품 수정</h4>

					</div>
				</div>
				
				<div class = "row">
				<form action="Controller?type=apeditSave" method="post"
					enctype="multipart/form-data">
					<div class = "col-md-6">
					<input type="hidden" name="p_idx" value="${pr.p_idx }"/>
					<table class="table">
						<thead></thead>
						<tbody>
							<tr>
								
								<td><div class="input-group">
      								<span class="input-group-text">작품명</span>
      								<input type="text" name="title" size="40" class="form-control" 
									data-str="작품명" value="${pr.p_title }" />
									</div>
									</td>
							</tr>
							<tr>
								
								<td><input type="file" name="file" class="form-control"/><small id="emailHelp" class="form-text text-muted">섬네일에 사용될 이미지를 등록해 주세요.</small></td>
							</tr>
							<tr>
								
								<td><textarea name="content" cols="50" rows="8" id="content" data-str="내용" >${pr.p_content }</textarea></td>
							</tr>
							<tr>
								
								<td><div class="input-group">
      								<span class="input-group-text">작가</span><input type="text" name="artist" size="40" class="form-control" 
									data-str="작가" value="${pr.p_artist }"/></div></td>
							</tr>
							<tr>
							<td>
								<div class="input-group">
      								
      								<span class="input-group-text">가격</span>
     								<input type="text" name="price" size="40" data-str="가격" class="form-control"  value="${pr.p_price }"/>
     								<span class="input-group-text">￦</span>
   								 </div>
   								</td> 
							</tr>
							<tr>
								
								<td>
									<div class="input-group">
      								<span class="input-group-text">상태</span>
									<label for="status"></label> 
										<select id="status" name="status" size="1" data-str="상태" class="form-select">
											<option value="">선택하세요.</option>
											<option value="1">판매중</option>
											<option value="0">판매완료</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								
								<td><div class="input-group">
      								<span class="input-group-text">수량</span>
      								<input type="text" name="cnt" size="40" data-str="수량" class="form-control"  value="${pr.p_cnt }"/>
      								</div></td>
							</tr>
							<tr style="text-align: right;">
								<td><input type="button" value="뒤로" class ="btn btn-dark"
									onclick="javascript:location.href='Controller?type=aviewList'">
									<input type="button" value="저장" onclick="sendData(this.form)" class ="btn btn-success"></td>
							</tr>
						</tbody>
					</table>
					</div>
					<input type="hidden" value="<%=mvo.getM_idx() %>" name="m_idx"/>
				</form>
				</div>


			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="js/summernote-lite.js"></script>
	<script src="js/lang/summernote-ko-KR.min.js"></script>
	
	
	<script type="text/javascript">
        $(function(){
			$("#content").summernote({
				height: 600,
				width: 800,
				leng: "ko-KR",
				focus: true, 
				callbacks:{
					onImageUpload: function(files, editor){ //인자: 파일(배열), 에디터
						
						for(let i =0; i<files.length; i++)
							sendImage(files[i], editor); //비동기식 통신을 이용해 서버로 이미지를 보내는 함수(아래) 호출
					}
				}
			});
		});
        function sendImage(file, editor){
        	let frm = new FormData();
        	frm.append("img", file);
        	
        	$.ajax({
        		url: "Controller?type=asaveImg",
        		data: frm,
        		type:"post",
        		contentType: false,
        		processData: false,
        		cache:false,
        		dataType:"json"
        		
        	}).done(function(data){
        		$("#content").summernote("editor.insertImage",data.url)
        	}).fail(function(err){
        		console.log(err);
        	});
        	
        }
        function sendData(frm2){
        	
        	
        	if(frm2.title.value == ""){
       			alert(frm2.title.dataset.str+"을 입력하세요");
       			frm2.title.focus();
       			return;
        	}
        	if(frm2.content.value == ""){
       			alert(frm2.content.dataset.str+"을 입력하세요");
       			frm2.content.focus();
       			return;
        	}
        	if(frm2.artist.value == ""){
       			alert(frm2.artist.dataset.str+"를 입력하세요");
       			frm2.artist.focus();
       			return;
        	}
        	if(frm2.price.value == ""){
       			alert(frm2.price.dataset.str+"을 입력하세요");
       			frm2.price.focus();
       			return;
        	}
        	if(frm2.status.value == ""){
       			alert(frm2.status.dataset.str+"를 입력하세요");
       			frm2.status.focus();
       			return;
        	}
        	if(frm2.cnt.value == ""){
       			alert(frm2.cnt.dataset.str+"을 입력하세요");
       			frm2.cnt.focus();
       			return;
        	}
        	
        	if($("#content").val()==""){
        		alert($("#content").data("str")+"을(를) 입력하세요");
        		return;
        	}
        		
        	frm2.submit();
        }
        </script>
</body>
</html>
