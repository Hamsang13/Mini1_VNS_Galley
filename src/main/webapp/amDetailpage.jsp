<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<%! 
	memberVO  smvo = null;
			%>

<%smvo = (memberVO)session.getAttribute("mvo");
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
        	<link href="css/bootstrap.css" rel="stylesheet" />
  
        
    <!-- CSS 부분 -->      
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>    
   
		 
<style>
  .container-new {
   width: 800px;       
  }
</style>		 
		 
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aviewList">상품 현황</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aoList">주문 현황</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aqList">문의 현황</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=amList">회원 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=shop">판매 페이지 돌아가기</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">메뉴 토글</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
              <div class="container-new">  
                <div class="container-fluid">
                    <h2 class="mt-4">회원 상세정보</h2>
                <p>
                    
                	<div class="row">
                	<div class="col-md-8">
                    <form action="" method="get">
                    <table class="table table-hover">
                        
<colgroup>
  <col style="width: 50px;">
  <col style="width: 100px;">
  <!-- 나머지 열 -->
</colgroup>
            
             
                        <tbody>
                        
				<%-- <%
					Object obj = request.getAttribute("ar");
					memberVO[] ar = null;
					if(obj != null){
						ar = (memberVO[])obj; 
						for(memberVO mvo : ar){
				%> --%>
				
				<%				
				    Object obj = request.getAttribute("mvo");
				    memberVO mvo = null;
				    if(obj != null){
				        mvo = (memberVO)obj;
				%>
				<tr>
					<td colspan="2">
					<c:if test="${requestScope.mvo.m_status != 3 }">
					<input type="button" value="정지" class="btn btn-dark" id="btn"  onclick="suspendMem('<%=mvo.getM_idx()%>')"/>
					</c:if>
					<c:if test="${requestScope.mvo.m_status == 3 }">
					<input type="button" value="활성" class="btn btn-dark" id="btn"  onclick="suspendMem('<%=mvo.getM_idx()%>')"/>
					</c:if>
					<input type="button" value="뒤로가기" class="btn btn-dark" onclick="javascript:location.href='Controller?type=amList'"/>
					</td>
				</tr>
				
					<tr>
						<th style="border-right: 2px solid #dedede;">번호</th>
						<td style="padding-left: 20px;"><%=mvo.getM_idx() %></td>
					</tr>
					<tr>
						<th style="border-right: 2px solid #dedede;">아이디</th>
						<td style="padding-left: 20px;"><%=mvo.getM_id() %></td>
					</tr>
					<tr>
						<th style="border-right: 2px solid #dedede;">이름</th>
						<td style="padding-left: 20px;"><%=mvo.getM_name() %></td>
					</tr>
					<tr>
						<th style="border-right: 1px solid #dedede;">주소</th>
						<td style="padding-left: 20px;"><%=mvo.getM_add()%></td>
					</tr>
					<tr>
						<th style="border-right: 1px solid #dedede;">핸드폰</th>
						<td style="padding-left: 20px;"><%=mvo.getM_phone() %></td>
					</tr>
					<tr>
						<th style="border-right: 2px solid #dedede;">이메일</th>
						<td style="padding-left: 20px;"><%=mvo.getM_email() %></td>
					</tr>
					<tr>
						<th style="border-right: 2px solid #dedede;">생년월일</th>
						<td style="padding-left: 20px;"><%=mvo.getM_birth() %></td>
					</tr>
					<tr>
						<th style="border-right: 2px solid #dedede;">가입일</th>
						<td style="padding-left: 20px;"><%=mvo.getM_joindate() %></td>
					</tr>
					
					
				<%			
					}//if문의 끝
				%>
				
				</tbody>
                         
                        </table>
                        </form>
                        </div>
                    </div>
                    </p>
                </div>
               </div> 
            </div>
        </div>
        
        <input type="hidden" id="status" value="<%=mvo.getM_status()%>"/>
       
   <!-- Bootstrap core JS-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="js/scripts.js"></script>
       <script type="text/javascript" src="/js/bootstrap.js"></script>
        
        
        <script>
        function suspendMem(mIdx){
        	
        	let st = $("#status").val();
        	if(st == 1)
        		st = 3;
        	else if(st == 3)
        		st = 1;
        	
        	let param = "type=suspendMem&m_idx="+encodeURIComponent(mIdx)+"&m_status="+encodeURIComponent(st);
        	
        	$.ajax({
        		url: "Controller",
        		data: param,
        		type: "post", //데이터 보낼때
        		dataType: "json" //데이터 받을때
        	}).done(function(data){
        		if(data.cnt == '1'){
            		if(st == 3){
                		alert('계정 정지 완료');
            			$("#btn").val("활성");
            		}else if(st == 1){
                		alert('계정 활성화 완료');
            			$("#btn").val("정지");          			
            		}

        			$("#status").val(st);
            	} else{
            		alert('정지실패');
            	}
        	});
        
        }
        </script>
        
       

    </body>
</html>
