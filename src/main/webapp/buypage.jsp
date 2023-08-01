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
<%! productVO pvo = null;
	memberVO  mvo = null;
			%>

<%mvo = (memberVO)session.getAttribute("mvo");
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
				<%if(request.getAttribute("pvo")!=null && mvo!=null){
					
					pvo = (productVO)request.getAttribute("pvo");
					%>
				
					<div id="main">
						<div class="inner">
							<h1>주문 하기</h1>
							<form action="Controller?type=buyok" method="post">
							<input type="hidden" id="m_idx" name="m_idx" value="<%=mvo.getM_idx() %>"/>
							<input type="hidden" id="p_idx" name="p_idx" value="<%=pvo.getP_idx()%>"/>
							<input type="hidden" id="m_cnt" name="m_cnt" value="<%=pvo.getP_cnt()%>"/>
							<table class="inner" style="max-width: 100%;">
							<caption style="text-indent: -99999px">상품정보</caption>
							<colgroup>
							 <col width="10%"/>
						     <col width="20%" style="text-align: center;"/>
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
							<td style="text-align: center;">현재고/주문개수</td>
							<td></td>
							</tr>
							</thead>
							<tbody>
							<tr>
							<td><img src="<%=pvo.getP_sfile()%>" width="150px" height="150px"></td>
							<td style="text-align: left; "><%=pvo.getP_title() %></td>
							<td id="price" style="text-align: center;"><%=pvo.getP_price()%></td>
							<td style="text-align: center;"><label></label><input name="p_cnt" id="p_cnt" style="text-align: center;" placeholder="<%=pvo.getP_cnt() %>" data-svo="상품 개수" type="text" onkeyup="javascript:calprice()"/></td>
							<td style="text-align: center;"><input style="text-align: center;" type="text" id="p_price" name="p_price" readonly></input></td>
							</tr>
							</tbody>
							</table>
							<div class="pvowrap">
							<ul class="pvolist">
							<li class="pvolist"><h2>주문자 정보</h2></li>
							<li class="pvolist"><input type="text" id="m_name" name="m_name" value="<%=mvo.getM_name() %>" data-svo="주문자 이름"></li>
							<li class="pvolist"><input type="text" id="m_phone" name="m_phone" value="<%=mvo.getM_phone() %>" data-svo="주문자 연락처"></li>
							<li class="pvolist"><input type="text" id="m_add" name="m_add" value="<%=mvo.getM_add() %>" data-svo="주문자 주소"></li>
							<li class="pvolist"><input type="text" id="m_email" name="m_email" value="<%=mvo.getM_email() %>" data-svo="주문자 이메일"></li>
							</ul>
							</div>
							<div class="svowrap">
							<ul class="svolist">
							<li class="svolist"><h2>배송지 정보</h2></li>
							<li class="svolist"><input type="text" id="o_name" name="o_name" value="<%=mvo.getM_name() %>" data-svo="받는분 이름"></li>
							<li class="svolist"><input type="text" id="o_phone" name="o_phone" value="<%=mvo.getM_phone() %>" data-svo="받는분 연락처"></li>
							<li class="svolist"><input type="text" id="o_add" name="o_add" value="<%=mvo.getM_add() %>" data-svo="받는분 주소"></li>
							<li class="svolist"><input type="text" id="o_email" name="o_email" value="<%=mvo.getM_email() %>" data-svo="받는분 이메일"></li>
							</ul>
							</div>
							<div class="pvowrap">
							<ul class="pvolist">
							<li class="pvolist"><h2>결제 정보</h2></li>
							<li class="pvolist"><select id="o_type" name="o_type" class="type">
							<option>무통장입금</option>
							<option>신용카드</option>
							<option>샘숭페이</option>
							</select></li>
							<li class="pvolist"><input type="text" id="o_cname" name="o_cname" value="" placeholder="입금자명" data-svo="입금자명"></li>
							</ul>
							</div>
							<div class="svowrap">
							<ul class="svolist">
							<li class="svolist"></li>
							<li class="svolist"></li>
							<li class="svolist"><input type="button" value="&nbsp;&nbsp;&nbsp;결제&nbsp;&nbsp;&nbsp;" style="background-color: #fdc08b" onclick="order()"></input></li>
							<li class="svolist"><input type="button" value="&nbsp;돌아가기&nbsp;" onclick="location.href='Controller?type=productpage&viewidx=<%=pvo.getP_idx()%>'"></li>
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
 			
			<script>
			 function calprice(){
					  
					  let cnt = parseInt(document.getElementById("p_cnt").value.trim());
					  
					  let a_cnt = parseInt(cnt);
					  let m_cnt = parseInt(document.getElementById("m_cnt").value.trim());
						console.log("a_cnt:"+a_cnt);
						console.log("m_cnt:"+m_cnt);
					  
					  
					  if(a_cnt>m_cnt){
				        alert("주문 가능 수량을 초과하였습니다.");
				        $("#p_cnt").val("");
				        return;
				       }
				       
					  let price = parseInt(document.getElementById("price").innerHTML);
					
					  
					  document.getElementsByName("p_price")[0].value = cnt * price;
			
			 }
			 function order(){
				//유효성 검사
					/* 
					let = $("#m_idx").val();
					let = $("#o_val2").val();
					
					let p_title= $("#p_title").val();
					if(p_title.trim().length < 1){
						alert("문의글 제목을 입력해주세요");
						$("#p_title").focus();
						return;
					}
					let p_content= $("#qtextarea").val();
					if(p_content.trim().length < 1){
						alert("문의글 내용을 입력해주세요");
						$("#qtextarea").focus();
						return;
					}*/
				 let ar = document.forms[0].elements;
				 
					
					
					
				 console.log(ar);
					 for(let i=0;i<ar.length-1;i++){
					 if(ar[i].value.trim().length<1){
						 //if(ar[i].data("str"))
						 let str = ar[i].dataset.svo; // html5에서 확장된 속성임. 커스텀속성을 표시하는데 표준화된 방법을 제안함.
						 
						 alert(str+"를 입력하세요");
						 ar[i].focus();
						 return;
					  }
					 }
				
					 
					 let m_idx = $("#m_idx").val();
					 let p_idx= $("#p_idx").val();
					 let p_cnt= $("#p_cnt").val();
					 let p_price = $("#p_price").val();
					 let m_name = $("#m_name").val();
					 let m_add = $("#m_add").val();
					 let m_email = $("#m_email").val();
					 let o_name = $("#o_name").val();
					 let o_phone= $("#o_phone").val();
					 let o_add= $("#o_add").val();
					 let o_email= $("#o_email").val();
					 let o_type= $("#o_type").val();
					 let o_cname = $("#o_cname").val();
					 
					
					var param = "type=buyok&m_idx="+encodeURIComponent(m_idx)+
						"&p_idx="+encodeURIComponent(p_idx)+
						"&p_cnt="+encodeURIComponent(p_cnt)+
						"&p_price="+encodeURIComponent(p_price)+
						"&m_name="+encodeURIComponent(m_name)+
						"&m_phone="+encodeURIComponent(m_phone)+
						"&m_add="+encodeURIComponent(m_add)+
						"&m_email="+encodeURIComponent(m_email)+
						"&o_name="+encodeURIComponent(o_name)+
						"&o_phone="+encodeURIComponent(o_phone)+
						"&o_add="+encodeURIComponent(o_add)+
						"&o_email="+encodeURIComponent(o_email)+
						"&o_type="+encodeURIComponent(o_type)+
						"&o_cname="+encodeURIComponent(o_cname);
					
					$.ajax({
						url: "Controller",
						data: param,
						type: "post",
						dataType: "json",
					}).done(function(param){
						if(param.chk == 1){
							alert("저장 완료");
							location.href="Controller?type=orderpage&ol_idx="+param.ol_idx;
						}else
							alert("뭔가가.. 잘 못 되었다.");
					}).fail(function(err){
						console.log(err);
					});
				
				 
				 
			 }
			</script>

	</body>
</html>