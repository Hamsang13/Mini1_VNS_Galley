<%@page import="mybatis.vo.memberVO"%>
<%@page import="utl.Paging"%>
<%@page import="mybatis.vo.answerVO"%>
<%@page import="mybatis.vo.questionVO"%>
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
<%! 
productVO pvo;
memberVO mvo = new memberVO();		
%>
<%
mvo = (memberVO)session.getAttribute("mvo");
%>
<html>
	<head>
	<style type="text/css">
	.box{
   width:60%;
   height:400px;
   text-align:center;
   border:1px solid #000000;
   position:absolute;
   top:50;
   right:30;
   background-color:#fff;
   display:none;
   }
	.box2{
   width:60%;
   height:400px;
   text-align:center;
   border:1px solid #000000;
   position:absolute;
   top:50;
   right:30;
   background-color:#fff;
   display:none;
   }
    #form_area{
     margin:5%;
   }
   
    .qtextarea{
     width:100%;
     height:60%;
    }
    
   table tfoot ul.paging {
	    list-style:none;
	}
	
	table tfoot ul.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ul.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #ababab;
	    color:#444444;
	    font-weight:bold;
	    text-decoration: none;
	}
	
	table tfoot ul.paging li a:hover {
	    background:#eeeeee;
	    color:white;
	    font-weight:bold;
	    text-decoration: none;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ababab;
	    background:#aaaaaa;
	    color:white;
	    font-weight:bold;
	}
	.empty{
	 height:50px;
	 color: #ababab;
	 
	</style>
		<title>Generic - Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
 		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 		<script src="js/complete/highslide/highslide.config.js"></script>
 		<script src="js/complete/highslide/highslide-with-gallery.js"></script>
 		<script src="js/complete/highslide/highslide-with-html.js"></script>
		
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
				<%Object obj = request.getAttribute("product");
					if(obj!=null){
					productVO[] voar = (productVO[])obj;
					%>
					<div id="main">
						<div class="inner">
						 <table>
						  <caption>문의 게시판</caption>
						  <colgroup>
						   <col width="10%"/>
						   <col width="20%"/>
						   <col width="40%"/>
						   <col width="20%"/>
						   <col width=*/>
						  </colgroup>
						  <tfoot>
						     <tr>
                          <td colspan="5">
                              <ul class="paging">
                                  
							<% Object obj3 = request.getAttribute("page"); 
								Paging pavo = null;
								if(obj!=null){
								pavo = (Paging)obj3;
									if(pavo.getStartPage()<pavo.getPagePerBlock()){
									%>
									<li class="disable">&lt;</li>
									<%}else {%>
									<li><a href="Controller?type=qna&cPage=<%=pavo.getStartPage()-pavo.getPagePerBlock()%>">&lt;</a></li>
									<%}  for(int i = pavo.getStartPage();i<=pavo.getEndPage();i++){
									  
									if(i==pavo.getNowPage()){%>
									<li class="now"><%=i %></li>
									<%}else{%>
									<li class="icons"><a href="Controller?type=qna&&cPage=<%=i %>"><%=i %></a></li>
									<%}
									}
								if(pavo.getEndPage()< pavo.getTotalPage()){%>     
								<li><a href="Controller?type=qna&cPage=<%=pavo.getStartPage()+pavo.getPagePerBlock()%>">&gt;</a></li>
								<%}else{ %>
								<li class="disable">&gt;</li>
								<%}
							}%>
                              </ul>
                          </td>
                      </tr>
						  </tfoot>
						  <thead>
						  <%if(voar.length>0){ %>
						   <tr>
						   <th>글번호</th>
						   <th></th>
						   <th>제목</th>
						   <th>작성자</th>
						   <th></th>
						   </tr>
						   <%}else{ %>
						   <tr>
						   </tr>
						   <%} %>
						  </thead>
						<tbody>
					  <%  questionVO[] ar2 = (questionVO[])request.getAttribute("qar");
					   if(ar2.length>0){
					    int i=0;
					    int acnt=0;
					    for(questionVO vo2 : ar2){								 
					      int num = pavo.getTotalRecord()-((pavo.getNowPage()-1)*pavo.getNumPerPage()+i);
					      if(vo2.getO_val1().equals("2")){
					      i++;					    	  
					      } 
					      
					  %>
					    <tr>
					      <td><%=num %><!-- 페이징 글 번호 자리 --></td>
					      <%
					       
					      if(vo2.getM_idx().equals(mvo.getM_idx()) || vo2.getP_secret().equals("0")|| mvo.getM_status().equals("0")){ 
					      
					      %>
					      	<td><img alt="" src="<%=vo2.getPvo().getP_sfile() %>" style="max-width: 100%;max-height: 100%" /></td>
					        <td id="Information<%=num%>" style="font-weight:bold; text-decoration: underline; cursor: pointer;"><%=vo2.getP_title() %></td>
					      <%}else{ %>
					      	<td><img alt="" src="<%=vo2.getPvo().getP_sfile() %>" style="max-width: 100%;max-height: 100%"/></td>
					        <td><%=vo2.getP_title() %></td>
					      <%} %>
					      <td><%=vo2.getMvo().getM_name()%></td>
					      <%if(vo2.getP_wait().equals("0")){ %>
					        <td>답변완료</td>
					      <%}else if(vo2.getP_wait().equals("1")){ %>
					        <td>답변대기</td>
					      <%}else{ %>
					      <td/>
					      <%} %>
					    </tr>
					    <tr class="InfomationForm<%=num %>" style="display: none; border-bottom: 1px solid #555555">
					      <td bgcolor="#eceff1"></td>
					      <td colspan="4" bgcolor="#eceff1">
					        <p><%=vo2.getP_title() %></p>
					        <p><%=vo2.getP_content() %></p>
					      </td>
					    </tr>
					    <%if(vo2.getAvolist().length>0){
					      for(answerVO ans : vo2.getAvolist()){
					    %>
					  <%    if(ans.getP_status().trim().equals("1")){%>
					      <tr class="InfomationForm<%=num %>" style="display: none; ">
					        <td bgcolor="#cfd8dc"></td>
					        <td colspan="4" bgcolor="#cfd8dc">
					          <p><%=ans.getP_title() %></p>
					          <p><%=ans.getMvo().getM_name() %></p>
					          <p><%=ans.getP_content() %></p>
					        </td>
					      </tr>
					    <%}
					    } %>
					    <%} %>
					    <script>
					      $(function(){
					        $("#Information<%=num%>").on("click", function() {
					          $(".InfomationForm<%=num %>").slideToggle("200"); // 2초에 걸쳐서 진행
					        });
					      });
					    </script>
					  <%} %>
					  <%}else{ %>
					    <tr>
					      <td colspan="4"> 등록된 문의글이 없습니다.</td>
					    </tr>
					  <%} %>
					</tbody>

						 </table>
						</div>
					</div>
					
					<%}else{ %>
					<div id="main">
						<div class="inner">
							<h1>잘못된 접근입니다</h1>
							<span class="image main"><img src="images/pic13.jpg" alt="" /></span>
							<p><a href="Controller?type=shop">돌아가기</a></p>
							
						</div>
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
			  $(function(){
			   $("#box").draggable();
			   
			   $("#btn").bind("click" , function(){
			    $("#box").css("display", "block");
			   });
			   
			   $("#close_btn").bind("click" , function(){
			    $("#box").css({display:"none"}); 
			   });
			    
			  });
			     
			  
			 </script>
	</body>
</html>