<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%!

memberVO mvo;
%>
<%mvo = (memberVO)session.getAttribute("mvo");
		System.out.println("aproductpage"+mvo.getM_idx());
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
  </head>
    <body>
        <div class="d-flex" id="wrapper">
         
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
    			
                <div class="container-fluid">
                	<div class ="row">
                		<div class ="col-md-1"></div>
                		<c:set var="product" value="${requestScope.pvo}"/>
                    	<br/>
                   		<div class = "col-md-5">
                    		<br/>
                    		<h4>${product.p_title }</h4>
                    	</div>
                    	<div class ="col-md-4">
                    	<br/>
                    	<input type="button" value="뒤로가기" class="btn btn-dark" onclick="javascript:location.href='Controller?type=aviewList'"/>                         		
								
						<input type="button" value="수정" class="btn btn-primary" onclick="javascript:location.href='Controller?type=apedit&p_idx=${product.p_idx }'"/>                         		 	
                    	</div>
                    </div>
                    <div class = "row">
                    	<form action="" method="get">
                        <div class = "col-md-9">
                        	<table class="table">
                        	 <caption></caption>
                        	 <colgroup>
                        	 	<col width="120px"/>
                        	 	<col width="*"/>
                        	 </colgroup>
                        	 <thead></thead>
                         	<tbody>
                         	<tr>
                         	<th>작품 설명</th>
                         	<td>${product.p_content}</td>
                         </tr>
                         <tr>
                         	<th>작가</th>
                          	<td>${product.p_artist }</td>
                         </tr>
                         <tr>
                         	<th>가격</th>
                          	<td><fmt:formatNumber pattern="#,###" value="${product.p_price }"/> ￦</td>
                         </tr>
                         <tr>
                         	<th>상태</th>
                          	<td>
                          	<c:if test="${product.p_status eq 1 }">판매중</c:if>
                          	<c:if test="${product.p_status eq 0 }">판매완료</c:if>
                          	</td>
                         </tr>
                         <tr>
                         	<th>수량</th>
                          	<td>${product.p_cnt }</td>
                         </tr>
                         </tbody>
						
                        </table>
                        </div>
                        
                        </form>
                  	</div>
					</div>
                </div>
            </div>
        </div>
   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
        <script src="js/scripts.js"></script>
    </body>
</html>
