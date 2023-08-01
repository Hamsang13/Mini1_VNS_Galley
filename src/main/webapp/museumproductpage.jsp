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
	p img{
	width:auto;
	 height:auto;
	 max-height: 100%;
	 max-width: 100%;
	}
	
	
	
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
					productVO vo = (productVO)obj;
					pvo = (productVO)obj;
					%>
					<c:set var="p_idx2" value="<%=pvo.getP_idx() %>"/>
					<div id="main">
					<div class="inner">
							<h1><%=vo.getP_title() %></h1>
							<a href="Controller?type=museum&searchtype=0&search=<%=vo.getP_artist()%>" style="padding-bottom: 10%; overflow: hidden; text-decoration: none; border-bottom: 0px; "><h3><%=vo.getP_artist() %></h3></a>
							<div id="imgfield" class="inner" style="display: flex; align-items: center;">
							<span class="image main" style="width: 40%; position: relative;"><img src="<%=vo.getP_sfile() %>" alt="" /></span>
							<div id="textfield" class="inner" style="display: flex; flex-direction: column; justify-content: center; padding-left:40%; margin-right: 0px;">
							<h2><%=vo.getP_price() %> &#8361;</h2>
							</div>
							</div>
							<br/><br/><br/>
						</div>
						<div class="inner" style="border-top: 1px solid #ccc; border-bottom:1px solid #ccc; width:85%;">
						<p></p>
						<p></p>
						<p></p>
						<p></p>
							<p><%=vo.getP_content() %></p>
							<p></p>
						</div>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
						<div class="inner">
						 <table>
						  <caption>문의 게시판</caption>
						  <colgroup>
						   <col width="10%"/>
						   <col width="60%"/>
						   <col width="20%"/>
						   <col width=*/>
						  </colgroup>
						  <tfoot>
						     <tr>
                          <td colspan="4">
                              <ul class="paging">
                                  
							<% Object obj3 = request.getAttribute("page"); 
								Paging pavo = null;
								if(obj!=null){
								pavo = (Paging)obj3;
									if(pavo.getStartPage()<pavo.getPagePerBlock()){
									%>
									<li class="disable">&lt;</li>
									<%}else {%>
									<li><a href="Controller?type=productpage&viewidx=<%=vo.getP_idx() %>&cPage=<%=pavo.getStartPage()-pavo.getPagePerBlock()%>">&lt;</a></li>
									<%}  for(int i = pavo.getStartPage();i<=pavo.getEndPage();i++){
									  
									if(i==pavo.getNowPage()){%>
									<li class="now"><%=i %></li>
									<%}else{%>
									<li class="icons"><a href="Controller?type=productpage&viewidx=<%=vo.getP_idx() %>&cPage=<%=i %>"><%=i %></a></li>
									<%}
									}
								if(pavo.getEndPage()< pavo.getTotalPage()){%>     
								<li><a href="Controller?type=productpage&viewidx=<%=vo.getP_idx() %>&cPage=<%=pavo.getStartPage()+pavo.getPagePerBlock()%>">&gt;</a></li>
								<%}else{ %>
								<li class="disable">&gt;</li>
								<%}
							}%>
                              </ul>
                          </td>
                      </tr>
						   <tr>
						    <td colspan="4">
						    <input class="btn" type="button" value="문의하기" id="btn"/><br/>
							 <div class="box" id="box" style="height:auto; background-color: #ffffff; z-index: 10;">
							  <header>
							   <h3>문의하기</h3>
							   <div id="form_area">
							   	<form method="post" action="Controller">
							   	 <input type="hidden" id="m_idx" name="m_idx" value="<%=mvo.getM_idx()%>">
							   	 <input type="hidden" id="o_val2" name="o_val2" value="<%=pvo.getP_idx()%>">
							   	 <input type="text" id="p_title" name="p_title" placeholder="문의 글 제목을 적어주세요."/>
							   	 <textarea id="qtextarea" class="qtextarea" rows="50" cols="15" name="p_content" placeholder="문의 내용을 입력해주세요."></textarea>
							   	 <div class="col-6 col-12-small">
												<input type="checkbox" id="demo-copy" name="p_secret">
												<label for="demo-copy">비밀글</label>
											</div>
							   	<input type="button" value="문의등록" onclick="add(this.form)">
							    <input type="button" value="닫기" id="close_btn"/>
							   	</form>
							   </div>
							  </header>
							 </div>
						    </td>
						   </tr>
						  </tfoot>
						  <thead>
						  <!-- 로그인 페이지에서 리퀘스트에 저장된 mvo객체 받아올 곳 -->
						  <%if(vo.getQueslist()!=null){ %>
						   <tr>
						   <th>글번호</th>
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
					  <% if(vo.getQueslist()!=null){
					    questionVO[] ar2;
					    int i=0;
					    for(questionVO vo2 : vo.getQueslist()){								 
					      int num = pavo.getTotalRecord()-((pavo.getNowPage()-1)*pavo.getNumPerPage()+i);
					      i++;
					  %>
					    <tr>
					      <td><%=num %><!-- 페이징 글 번호 자리 --></td>
					      <%if(vo2.getM_idx().equals(mvo.getM_idx()) || vo2.getP_secret().equals("0")|| mvo.getM_status().equals("0")){ %>
					        <td id="Information<%=num%>" style="font-weight:bold; text-decoration: underline; cursor: pointer;"><%=vo2.getP_title() %></td>
					      <%}else{ %>
					        <td><%=vo2.getP_title() %></td>
					      <%} %>
					      <td><%=vo2.getMvo().getM_name()%></td>
					      <%if(vo2.getP_wait().equals("0")){ %>
					        <td>답변완료</td>
					      <%}else{ %>
					        <td>답변대기</td>
					      <%} %>
					    </tr>
					    <tr class="InfomationForm<%=num %>" style="display: none; border-bottom: 1px solid #555555">
					      <td bgcolor="#eceff1"></td>
					      <td colspan="3" bgcolor="#eceff1">
					        <p><%=vo2.getP_title() %></p>
					        <p><%=vo2.getP_content() %></p>
					      </td>
					    </tr>
					    <%if(vo2.getAvolist().length>0){
					      for(answerVO ans: vo2.getAvolist()){
					    %>
					      <tr class="InfomationForm<%=num %>" style="display: none; ">
					        <td bgcolor="#cfd8dc"></td>
					        <td colspan="3" bgcolor="#cfd8dc">
					          <p><%=ans.getP_title() %></p>
					          <p><%=ans.getMvo().getM_name() %></p>
					          <p><%=ans.getP_content() %></p>
					        </td>
					      </tr>
					    <%} %>
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
			     
			  function add(frm){
					//유효성 검사
					
					let m_idx= $("#m_idx").val();
					let o_val2= $("#o_val2").val();
					//let p_secret = 0;
					if($("#demo-copy").prop("checked")){
					    $("#demo-copy").val(1);
					}else{
					    $("#demo-copy").val(0);
					}
					let p_secret= $("#demo-copy").val();
				    /*  if(p_secret==null){
				      p_secret=0;
				     } */
					
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
					}
					
					
					
					var param = "type=qwrite&m_idx="+encodeURIComponent(m_idx)+
						"&o_val2="+encodeURIComponent(o_val2)+
						"&p_secret="+encodeURIComponent(p_secret)+
						"&p_title="+encodeURIComponent(p_title)+
						"&p_content="+encodeURIComponent(p_content);
					
					$.ajax({
						url: "Controller",
						data: param,
						type: "post",
						dataType: "json",
					}).done(function(param){
						if(param.chk == 1){
							alert("저장 완료");
							location.href="Controller?type=productpage&viewidx="+o_val2;
						}else
							alert("뭔가가.. 잘 못 되었다.");
					}).fail(function(err){
						console.log(err);
					});
				};
			  
			  
			 </script>
	</body>
</html>