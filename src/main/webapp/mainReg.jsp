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
	            <button type="button" class="togglebtn" onclick="register()">회원가입</button>
	            <button type="button" class="togglebtn" onclick="login()">로그인</button>
	       </div>
	       <form id="register" action="" class="input-group" method="post">
               <input type="text" class="input-field" placeholder="user id" name="id2" id="id2" >
       		   <input type="button"  onclick="sendData3()" value="중복체크"/>
               <input type="password" class="input-field" placeholder="Enter Password" name="pw2" id="pw2"  >
               <input type="text" class="input-field" placeholder="user name" name="name"  id="name">
               <input type="text" class="input-field" placeholder="user address" name="add" id="add" >
               <input type="text" class="input-field" placeholder="user phone" name="phone" id="phone" >
               <input type="text" class="input-field" placeholder="Your Email" name="email" id="email" >
               <input type="text" class="input-field" placeholder="Your birth"  name="birth"id="birth" onkeydown="checkEnter(event)">
            </form>
               <button class="submit" onclick="sendData5()">회원가입</button>
		</div>
		<input type="hidden" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script>

       		/* function changeBackground() {
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
       		
       		function login(){
            	location.href="mainLogin.jsp";
       		}
       		
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
       		
       		function sendData2() {
				var pw2 = $("#pw2");
				var name = $("#name");
				var add = $("#add");
				var phone = $("#phone");
				var email = $("#email");
				var birth = $("#birth");
				if(pw2.val().trim().length <= 0){
					alert("비밀이 없어?");
					pw2.focus();
					return;
				}if(name.val().trim().length <= 0){
					alert("이름이 없어?");
					name.focus();
					return;
				}
				if(add.val().trim().length <= 0){
					alert("집이 없어?");
					add.focus();
					return;
				}if(phone.val().trim().length <= 0){
					alert("핸드폰이 없어?");
					phone.focus();
					return;
				}
				if(email.val().trim().length <= 0){
					alert("이메일 없어도 되긴 해!");
					email.focus();
					return;
				}if(birth.val().trim().length <= 0){
					alert("생일이 없어?");
					birth.focus();
					return;
				}
				alert("회원가입 완료!");
				document.forms[0].action = "Controller?type=reg3";
	   			document.forms[0].submit();
			}
       		function sendData3() {
       			var id2 = $("#id2");
				if(id2.val().trim().length <= 0){
					alert("아이디를 입력하세요!");
					id2.focus();
					return;
				}
				var param = "id2="+encodeURIComponent(id2.val());
    			$.ajax({
    				url: "Controller?type=reg2",
    				data: param,
    				type: "post",
    				dataType: "json",
    			}).done(function(param){
    				// param안에 chk라는 변수의 값이 1이면 성공
    				if(param.chk2 == 1){
    					alert("아이디가 중복됩니다.");
    					location.href="Controller?type=reg";
    				}else if(param.chk2 == 0){
    					alert("사용 가능한 아이디입니다.");
    				}
    			}).fail(function(err){
    				console.log(err);
    			});
			}
				
			function sendData4() {
				var id2 = $("#id2");
				var param = "id2="+encodeURIComponent(id2.val());
    			$.ajax({
    				url: "Controller?type=reg2",
    				data: param,
    				type: "post",
    				dataType: "json",
    			}).done(function(param){
    				// param안에 chk라는 변수의 값이 1이면 성공
    				if(param.chk2 == 1){
    					alert("아이디가 중복됩니다.");
    					location.href="Controller?type=reg";
    				}else if(param.chk2 == 0){
    					sendData2();
    				}
    			}).fail(function(err){
    				console.log(err);
    			});
			}
			
			function sendData5() {
				var pw2 = $("#pw2");
				var name = $("#name");
				var add = $("#add");
				var phone = $("#phone");
				var email = $("#email");
				var birth = $("#birth");
				if(pw2.val().trim().length <= 0){
					alert("비밀이 없어?");
					pw2.focus();
					return;
				}if(name.val().trim().length <= 0){
					alert("이름이 없어?");
					name.focus();
					return;
				}
				if(add.val().trim().length <= 0){
					alert("집이 없어?");
					add.focus();
					return;
				}if(phone.val().trim().length <= 0){
					alert("핸드폰이 없어?");
					phone.focus();
					return;
				}
				if(email.val().trim().length <= 0){
					alert("이메일 없어도 되긴 해!");
					email.focus();
					return;
				}if(birth.val().trim().length <= 0){
					alert("생일이 없어?");
					birth.focus();
					return;
				}
				sendData4();
			}
			function checkEnter(event) {
    			if (event.keyCode === 13) {
    				event.preventDefault();
    				sendData4();
    			}
    		}
        </script>
</body>
</html>
