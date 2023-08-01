<%@page import="java.util.Map"%>
<%@page import="org.apache.taglibs.standard.lang.jstl.Literal"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="mybatis.vo.productVO"%>
<%@page import="mybatis.vo.orderlogVO"%>
<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<%!
 orderlogVO[] olar;
%>

<%
   	 	Object obj = session.getAttribute("mvo");
    	memberVO mvo = null;
    	if(obj != null){
    		mvo = (memberVO)obj;
    		olar= (orderlogVO[])request.getAttribute("orderlist");
   
    %>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	
<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">
							<!-- Logo -->
								<a href="Controller?type=shop" class="logo">
									<span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">VNS GALLERY</span>
								</a>
	
							<!-- Nav -->
							<nav>
								<ul>
									<li><a href="#menu">Menu</a></li>
								</ul>
							</nav>
						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
						<li><a href="Controller?type=shop">SHOP</a></li>
							<li><a href="Controller?type=qna">QNA</a></li>
							<li><a href="Controller?type=order&m_idx=<%=mvo.getM_idx()%>">ORDER</a></li>
     					    <li><a href="Controller?type=museum">MUSEUM</a></li>
     					    <li><a href="Controller?type=logout&m_id=<%=mvo.getM_id()%>">로그아웃</a></li>
						</ul>
					</nav>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>나의 주문 현황<br />
							</header>
							<section class="tiles">
								<table summary="주문 목록">
									  <caption>주문 목록</caption>
									  <thead>
									    <tr class="title">
									      <th class="no">주문목록</th>
									      <th class="subject">주문번호</th>
									      <th class="writer">상품명</th>
									      <th class="reg">구매날짜</th>
									      <th class="hit">구매자</th>
									      <th class="hit">배송현황</th>
									    </tr>
									  </thead>
									  <tbody>
									  <%if(olar != null){
										  int i = 1;
										  for(orderlogVO vo : olar){%>
									  <tr>
									  <td><%=i %></td>
									  <td><a href="Controller?type=orderpage&ol_idx=<%=vo.getOl_idx() %>"><%=vo.getOvo().getO_num() %></a></td>
									  <td><%=vo.getOvo().getPvo().getP_title() %></td>
									  <td><%=vo.getOl_date() %></td>
									  <td><%=vo.getMvo().getM_name() %></td>
									  <td>	  
									  <% 
									  	if(vo.getOvo().getO_status().equals("1")){
									  %>
									  준비중
									  <%
									  	}else if(vo.getOvo().getO_status().equals("2")){
									  %>
									  배송중
									  <%
									  	}else if(vo.getOvo().getO_status().equals("3")){
									  %>
									  배송완료
									  <%
									  	}else if(vo.getOvo().getO_status().equals("4")){
									  %>
									  주문완료
									  <%
									  	}else if(vo.getOvo().getO_status().equals("5")){
									  %>
									  주문취소
										  <%} %>
										</td>
									  </tr>
									  	<%i++;}
									  	}
    		else{
    			
    		
									  	%>
									  	<tr>
									  		<td colspan="5">주문한 상품이 없어요~~!</td>
									  	</tr>
										  <%
    		}
    	}
    	
										  %>
									  </tbody>
									</table>
							</section>
						</div>
					</div>
				
				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="field half">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="field">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>
			</div>
		 <form name="frm" action="Controller" method="post">
			<input type="hidden" name="type"/>
			<input type="hidden" name="m_id"/>
			<input type="hidden" name="m_idx"/>
			<input type="hidden" name="m_status"/>
		</form>
		<form name="frm2" action="Controller" method="post">
			<input type="hidden" name="type"/>
			<input type="hidden" name="ol_idx"/>
		</form>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script>
				function order() {
					document.frm.type.value = "order";
					document.frm.m_id.value = "<%=mvo.getM_id()%>";
					document.frm.m_idx.value = "<%=mvo.getM_idx()%>";
					document.frm.m_status.value = "<%=mvo.getM_status()%>";
					document.frm.submit();
				}
				function viewDetails(ol_idx) {
					document.frm2.type.value = "viewOrder";
					document.frm2.ol_idx.value = ol_idx;
					document.frm2.submit();
				}
			</script>
	</body>
