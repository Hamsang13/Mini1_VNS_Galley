<%@page import="mybatis.vo.orderlogVO"%>
<%@page import="mybatis.vo.memberVO"%>
<%@page import="mybatis.vo.productVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%! productVO pvo;
	memberVO  mvo;
	orderlogVO olvo = null;
			%>

<%
 olvo = (orderlogVO)request.getAttribute("olvo");
 mvo = olvo.getMvo();
 pvo = olvo.getOvo().getPvo();
			%>
			
			
<html>
	<head>
		<title>Generic - Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<style>
	
	.pvolist, .svolist {
    list-style:none; 
    padding-left:0px;
    display: block;
    vertical-align: top;
    margin: 10px;
}

.pvowrap, .svowrap {
    width:45%;
    display: inline-block;
    margin: 20;
}
	
	/* .pvolist {
	list-style:none; 
	padding-left:0px;
	}
	.pvowrap{
	 width:40%;
	 margin-right:auto;
	 display: inline-block;
	}
	.svolist {
	list-style:none; 
	padding-left:0px;
	}
	.svowrap{
	 width:40%;
	 margin-left:auto;
	 display: in-line-block;
	} */
	</style>
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
				<%if(pvo!=null && mvo!=null){
					%>
				
					<div id="main">
						<div class="inner">
							<h1>주문 조회</h1>
							<form action="Controller?type=buyok" method="post">
							<input type="hidden" id="m_idx" name="m_idx" value="<%=mvo.getM_idx() %>"/>
							<input type="hidden" id="p_idx" name="p_idx" value="<%=pvo.getP_idx()%>"/>
							<table class="inner" style="max-width: 100%;">
							<caption style="text-indent: -99999px">상품정보</caption>
							<colgroup>
							 <col width="10%"/>
						     <col width="30%" style="text-align: center;"/>
						     <col width="20%" style="text-align: center;" />
						     <col width="15%" style="text-align: center;"/>
						     <col width="*" style="text-align: center;"/>
							</colgroup>
							<thead>
							<tr>
							<td colspan="5"><h1>주문정보</h1></td>
							</tr>
							<tr>
							<td colspan="2"><h2>상품 정보</h2></td>
							<td></td>
							<td></td>
							<td></td>
							</tr>
							<tr>
							<td></td>
							<td>상품이름</td>
							<td style="text-align: center;">상품가격</td>
							<td style="text-align: center;">상품개수</td>
							<td></td>
							</tr>
							</thead>
							<tbody>
							<tr>
							<td><img src="<%=pvo.getP_sfile()%>" width="150px" height="150px"></td>
							<td style="text-align: left; "><%=pvo.getP_title() %></td>
							<td id="price" style="text-align: center;"><%=pvo.getP_price()%></td>
							<td style="text-align: center;"><input name="p_cnt" id="p_cnt" style="text-align: center;" data-svo="상품 개수" type="text" value="<%=olvo.getOvo().getO_val1() %>" readonly></td>
							<td style="text-align: center;"><input style="text-align: center;" type="text" id="p_price" name="p_price" value="<%=olvo.getOvo().getO_val2() %>" readonly></input></td>
							</tr>
							</tbody>
							</table>
							<div class="pvowrap">
							<ul class="pvolist">
							<li class="pvolist"><h2>주문자 정보</h2></li>
							<li class="pvolist"><input type="text" id="m_name" name="m_name" value="<%=mvo.getM_name() %>" data-svo="주문자 이름" readonly></li>
							<li class="pvolist"><input type="text" id="m_phone" name="m_phone" value="<%=mvo.getM_phone() %>" data-svo="주문자 연락처" readonly></li>
							<li class="pvolist"><input type="text" id="m_add" name="m_add" value="<%=mvo.getM_add() %>" data-svo="주문자 주소" readonly></li>
							<li class="pvolist"><input type="text" id="m_email" name="m_email" value="<%=mvo.getM_email() %>" data-svo="주문자 이메일" readonly></li>
							</ul>
							</div>
							<div class="svowrap">
							<ul class="svolist">
							<li class="svolist"><h2>배송지 정보</h2></li>
							<li class="svolist"><input type="text" id="o_name" name="o_name" value="<%=mvo.getM_name() %>" data-svo="받는분 이름" readonly></li>
							<li class="svolist"><input type="text" id="o_phone" name="o_phone" value="<%=mvo.getM_phone() %>" data-svo="받는분 연락처" readonly></li>
							<li class="svolist"><input type="text" id="o_add" name="o_add" value="<%=mvo.getM_add() %>" data-svo="받는분 주소" readonly></li>
							<li class="svolist"><input type="text" id="o_email" name="o_email" value="<%=mvo.getM_email() %>" data-svo="받는분 이메일" readonly></li>
							</ul>
							</div>
							<div class="pvowrap">
							<ul class="pvolist">
							<li class="pvolist"><h2>결제 정보</h2></li>
							<!-- 결제정보 출력해주기-->
							<li class="pvolist"><input type="text" id="o_type" name="o_type" class="type" value="<%=olvo.getOvo().getO_val3()%>" readonly/>
							</li>
							<li class="pvolist"><input type="text" id="o_cname" name="o_cname" value="<%=olvo.getOvo().getO_val4() %>" placeholder="입금자명" data-svo="입금자명" readonly></li>
							</ul>
							</div>
							<div class="svowrap">
							<ul class="svolist">
							<li class="svolist"></li>
							<li class="svolist"></li>
							
							<li class="svolist"><input type="button" value="&nbsp;돌아가기&nbsp;" onclick="location.href='Controller?type=order&m_idx=<%=mvo.getM_idx()%>'"></li>
							</ul>
							</div>
							</form>
						</div>
					</div>
					<%}else{ %>
					
					<div id="main">
						<div class="inner">
							<h1>잘못된 접근입니다.</h1>
					</div>
					<%} %>

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
			<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
 			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 			

	</body>
</html>