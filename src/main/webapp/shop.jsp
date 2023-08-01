<%@page import="mybatis.vo.memberVO"%>
<%@page import="mybatis.vo.productVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<c:set var="mvo" set="${sessionScope.mvo}"



<%!

memberVO mvo = new memberVO();
%>
<%mvo = (memberVO)session.getAttribute("mvo");
		
			%>

<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<style>
		.searchwrap {
		  position: relative;
		  height: 80px;
		  display:block;
		  align-items: center;
		}
		.searchwrap select {
		  width:20%;
		  display: inline-block;
		  text-align: center;
		  box-sizing: border-box;
		  overflow: auto;
		}
		.searchwrap input[type="text"] {
		 display: inline-block;
		 width:20%
		}
		.searchwrap label {
		  display: inline-block;
		  width: 10%;
		  cursor: pointer;
		}
		
		.tiles article > .image {
				-moz-transition: -moz-transform 0.5s ease;
				-webkit-transition: -webkit-transform 0.5s ease;
				-ms-transition: -ms-transform 0.5s ease;
				transition: transform 0.5s ease;
				position: relative;
				display: block;
				width: 100%;
				border-radius: 4px;
				overflow: hidden;
			}

				.tiles article > .image img {
					display: block;
					width: 100%;
				}

				.tiles article > .image:before {
					pointer-events: none;
					-moz-transition: background-color 0.5s ease, opacity 0.5s ease;
					-webkit-transition: background-color 0.5s ease, opacity 0.5s ease;
					-ms-transition: background-color 0.5s ease, opacity 0.5s ease;
					transition: background-color 0.5s ease, opacity 0.5s ease;
					content: '';
					color:"#ffffff"
					display: block;
					position: absolute;
					top: 0;
					left: 0;
					width: 100%;
					height: 100%;
					opacity: 0.3;
					z-index: 1;
				}

		 		.tiles article > .image:after {
					pointer-events: none;
					-moz-transition: opacity 0.5s ease;
					-webkit-transition: opacity 0.5s ease;
					-ms-transition: opacity 0.5s ease;
					transition: opacity 0.5s ease;
					content: '';
					display: block;
					position: absolute;
					top: 0;
					left: 0;
					width: 100%;
					height: 100%;
					
					background-position: center;
					background-repeat: no-repeat;
					background-size: 100% 100%;
					opacity: 0;
					z-index: 2;
				}
		
		</style>
		
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
								<h1>세상에서&nbsp;&nbsp;단&nbsp;&nbsp;하나&nbsp;뿐인&nbsp;&nbsp;유니크한&nbsp;&nbsp;작품들을&nbsp;&nbsp;모아두었습니다.</h1>
								<h2>작가들의&nbsp;&nbsp;전혀&nbsp;&nbsp;다른&nbsp;&nbsp;감성을&nbsp;&nbsp;느껴보세요</h2><br/>
								<h2>이전&nbsp;&nbsp;전시&nbsp;&nbsp;작품&nbsp;&nbsp;보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;<a href="Controller?type=museum">MUSEUM</a></h2>
							</header>
							<div class="inner">
							<form method="get" action="Controller">
							<section>
							<div class="searchwrap">
							<input type="hidden" name="type" value="shop"/>
								<select name="searchtype">
								<option value="0">작가명</option>
								<option value="1">작품명</option>
								</select>
								<input type="text" name="search"/>
								<input id="gum" type="button" value="검색" onclick="search(this.form)"/>
								</div>
							</section>
							</form>
							</div>
							<section class="tiles">
							<%if(request.getAttribute("ar")!=null){
								Object list = request.getAttribute("ar");
								productVO[] ar = (productVO[])list;
								if(ar.length==0||ar==null){%>
								<article  class="style7">
								<h1>검색된 내용이 없습니다.</h1>
								</article>
								<%}else{
								for(productVO vo : ar){
								%>
									<article class="style7">
										<span class="image">
											<img src="<%=vo.getP_sfile() %>" alt="<%=vo.getP_title() %> " style="max-height: 100%;max-width: 100%"/>
										</span>
										<a href="Controller?type=productpage&viewidx=<%=vo.getP_idx()%>">
											<h2 style="color:#FFFFFF;"><%=vo.getP_title() %></h2>
											<div class="content" style="color:#FFFFFF;">
												<p><%=vo.getP_artist() %></p>
											</div>
										</a>
									</article>
								<%}
								} %>
								<%} %>
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

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	<script type="text/javascript">
	 function search(frm){
		  
		 frm.submit();
	 }
	
	</script>

	</body>
