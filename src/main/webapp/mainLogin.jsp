<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mainLogin.css">
</head>
<body>
	<div class="wrap" id="wrap1">
	</div>       
	    <div class="form-wrap">
	        <div class="button-wrap">
	            <div id="btn"></div>
	            <button type="button" class="togglebtn" onclick="login()">로그인</button>
	            <button type="button" class="togglebtn" onclick="register()">회원가입</button>
	        </div>
	        
	        <form id="login" action="" class="input-group" method="post">
	            <input type="text" class="input-field" placeholder="아이디" name="id" id="id">
	            <input type="password" class="input-field" placeholder="비밀번호" name="pw" id="pw" onkeydown="checkEnter(event)" >
	            <input type="hidden" class="checkbox"><span></span>
	        </form>
	        <button class="submit" onclick="sendData()" >로그인</button>
	        
		</div>
		
		<input type="hidden" name=m_idx />	
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script>
        
	        var id = $("#id");
			var pw = $("#pw");
 		 
           
             function register(){
            	location.href="mainReg.jsp";
            	return;
            }
         
       		/*function changeBackground() {
       			  var wrap = document.getElementById("wrap1");
       			  wrap.classList.remove("fade-in");
       			  wrap.classList.add("fade-out");

       			  setTimeout(function() {
       			    var randomNumber = Math.floor(Math.random() * 4) + 1;
       			    wrap.style.backgroundImage = "url('./images/tera" + randomNumber + ".jpg')";
       			    wrap.classList.remove("fade-out");
       			    wrap.classList.add("fade-in");
       			  }, 1000);
       			}

       		setInterval(changeBackground, 10000); */
       		
       		var images = ["pic01.jpg", "pic02.jpg", "pic03.jpg", "pic04.jpg", "pic05.jpg", "pic06.jpg", 
       			"pic07.jpg", "pic08.jpg", "pic09.jpg","pic10.jpg","pic11.jpg","pic12.jpg","pic13.jpg","pic14.jpg","pic15.jpg"];
       	    $(function () {
       	        var i = 0;
       	        $("#wrap1").css("background-image", "url(images/" + images[i] + ")");
       	        setInterval(function () {
       	            i++;
       	            if (i == images.length) {
       	                i = 0;
       	            }
       	            $("#wrap1").fadeOut("slow", function () {
       	                $(this).css("background-image", "url(images/" + images[i] + ")");
       	                $(this).fadeIn("slow");
       	            });
       	        }, 5000);
       	    });
       		
       		
       		function sendData() {
    			
    			if(id.val().trim().length <= 0){
    				alert("아이디를 입력하세요!");
    				id.focus();
    				return;
    			}
    			
    			if(pw.val().trim().length <= 0){
    				alert("비밀번호를 입력하세요!");
    				pw.focus();
    				return;
				}
   
    			var param = "id="+encodeURIComponent(id.val())+"&pw="+encodeURIComponent(pw.val())+"&type=login2";
    			
    			
    			$.ajax({
    				url: "Controller?type=login2",
    				data: param,
    				type: "post",
    				dataType: "json",
    			}).done(function(param){
    				console.log("???");
    				console.log(param);
    				// param안에 chk라는 변수의 값이 1이면 성공
    				 if(param.chk == 1){
    					alert("로그인 성공");
    					location.href="Controller?type=shop";
    				}else if(param.chk == 0){
    					alert("로그인 실패");
    					location.href="Controller?type=login";
    				}else if(param.chk == 2){
    					alert("관리자아이디로 로그인 하였습니다");
    					location.href="Controller?type=admin";
    				} 
    			}).fail(function(err){
    				console.log(err);
    			});
       		}
       		
       		function checkEnter(event) {
    			if (event.keyCode === 13) {
    				event.preventDefault();
    				sendData();
    			}
    		}
       			
        </script>
</body>
</html>
