<%@page import="mybatis.vo.orderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = request.getAttribute("vo");

	orderVO vo = null;
	if(obj != null){
		vo = (orderVO)obj;//request에 "vo"라는 이름으로 저장된 객체가 있다면
						// vo변수에 obj를 넣어준다.
%>
<!DOCTYPE html>
<html>
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
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
  <!-- 새로추가 --> 
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>


<style type="text/css">
	#bbs table {
	    width:920px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:15px;
	    
	}
	
	#bbs table caption {
	    font-size:30px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
		
</style>

</head>
<body>
	<div id="bbs" class="container">
	<div class="row">
    <div class="col-md-12">
	<!-- <form action="Controller?type=write_ok" method="post" 
	encType="multipart/form-data"> -->
	<form action="Controller" method="post"  name="frm">
	<input type="hidden" name="type"/>
	
		<table summary="주문 수정하기" class="mt-4">
			<caption style="text-indent: -9999px;">주문 수정하기</caption>
			<colgroup>
				<col width="120px"/>
				<col width="*"/>
			</colgroup>
			<tbody>
			
			
					<tr>
					<th>목록:</th>
					<td><input type="int" name="o_idx" value="<%=vo.getO_idx() %>" 
						size="45" data-str="주문번호"/></td>
				</tr>

				<tr>
					<th>주문자:</th>
					<td><input type="text" name="o_class" value="<%=vo.getO_class()%>" 
						size="45" data-str="주문자"/></td>
				</tr>
				
				<tr>
					<th>주문번호:</th>
					<td><input type="text" name="o_num"  value="<%=vo.getO_num() %>"
							size="45" data-str="주문번호"/></td>
				</tr>
				<tr>
					<th>상품번호:</th>
					<td><input type="int" name="p_idx" value="<%=vo.getP_idx() %>" 
						size="45" data-str="상품번호"/></td>
				</tr>
	             <tr>
					<th>주문상태:</th>
					<td><input type="int" name="o_status" value="<%=vo.getO_status() %>" 
						size="45" data-str="제목"/></td>
				</tr>
				
			
				<tr>
					<td colspan="2" >
						<input type="button" value="보내기" class="btn btn-dark"
						onclick="sendData()"/>
						
						<input type="button" value="뒤로 이동" class="btn btn-dark"
						onclick="listooss()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
		
		
	</div>
	</div>
	</div>
	
	<%--
		<form name="frm2" action="Controller" method="post">
		<input type="hidden" name="type"/>
		<input type="hidden" name="fname"/>
		<input type="hidden" name="o_idx" value="<%=vo.getO_idx()%>"/>
	</form>
	 --%>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script type="text/javascript" src="/js/bootstrap.js"></script>
            
       <!-- 제이쿼리 -->
       <script
       src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
       </script>

       <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
       </script>
       
       
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        <script>
	
	
		function sendData(){
			document.frm.type.value ="aoSave";
			document.frm.submit();
		}
		function listooss(){
			document.frm.type.value = "aoView";
			document.frm.submit();
		}
	</script>
</body>
</html>
<%
	}else
		response.sendRedirect("Controller"); // 강제로 목록화면으로 간다.
%>
