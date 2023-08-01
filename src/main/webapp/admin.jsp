<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%! 
	memberVO  mvo = null;
			%>

<%mvo = (memberVO)session.getAttribute("mvo");
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
        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  
  		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  		<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script> 
  		
  		 <!-- 차트 링크 -->
  		 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  		 <!-- 아이콘 링크 -->
  		
    	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    	 
    	 <style type="text/css">
    	 .odiv {
    	 	height: 150px;
    	 	text-align: center;
    	 	line-height:
    	 }
    	 .o1{background-color: #333;}
    	 .o2{background-color: #666;}
    	 .o3{background-color: #999;}
    	 .o4{background-color: #ccc;}
    	 </style>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=admin">관리자 메인 페이지</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aviewList">상품 현황</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aoList">주문 현황</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aqList">문의 현황</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=amList">회원 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=shop">판매 페이지 돌아가기</a>
                </div>
            </div>
            <!-- Page content wrapper-->
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
                <!-- Page content-->
                <c:set var="countV" value="${requestScope.countmap}"/>
                <div class="container-fluid">
                    <div class= "row">
                    	<div class = "col-md-1"></div>
                    	<div class = "col-md-8">
	                    	<div class="row">
	                    		<p/>
	                    		<p/>
	                    		
	                    		<div class="12">
	                    			<div class ="row">
  											<h1>DASHBOARD</h1>
  											<p><br/></p>
  											<p><br/></p>
  											<hr/>
  											<br/>
  											<h4>주문현황</h4>
  											<p><br/></p>
	                    				<div class="row justify-content-center">
	                    					
	                    					<div class="card text-white bg-dark m-2" style="max-width: 16rem;">
            									<div class="card-header"><br/><h3 class="card-title">주문 완료</h3></div>
           										<div class="card-body">
              									<p class="card-text">
              									 	<i class="fas fa-sharp fa-shopping-cart fa-3x"></i>
           											<h3 style="text-align: right;">${countV.oof} 건&nbsp;</h3>
           										</p>
              									</div>
          									</div>
          									&nbsp;
	                    					<div class="card text-white bg-dark m-2" style="max-width: 16rem;">
            									<div class="card-header"><br/><h3 class="card-title">배송 준비중</h3></div>
           										<div class="card-body">
             									<p class="card-text">
              									 	<i class="fas fa-box fa-3x"></i>
           											<h3 style="text-align: right;">${countV.osr}건&nbsp;</h3>
           										</p>
          									</div>
          									</div>
          									&nbsp;
	                    					<div class="card text-white bg-dark m-2" style="max-width: 16rem;">
            									<div class="card-header"><br/><h3 class="card-title">배송 중</h3></div>
           										<div class="card-body">
             									<p class="card-text">
              									 	<i class="fas fa-truck fa-3x"></i>
           											<h3 style="text-align: right;">${countV.osn}건&nbsp;</h3>
           										</p>
          									</div>
          									</div>
          									&nbsp;
	                    					<div class="card text-white bg-dark m-2" style="max-width: 16rem;">
            									<div class="card-header text-white"><br/><h3 class="card-title">배송 완료</h3></div>
           										<div class="card-body">
             									<p class="card-text">
              									 	<i class="fas fa-check fa-3x"></i>
           											<h3 style="text-align: right;">${countV.oof}건&nbsp;</h3>
           										</p>
          									</div>
          									</div>
  											
 											<!-- <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p> -->
										</div>
	                    			</div>
	                    		</div>
	                    	</div>
	                    	<br/>
	                    	<br/>
	                    	<br/>
	                    	
	                    	<hr/>
                    		<div class = "row">
                    			<div class = "col-md-12">
                    				<div class = "row pied">
                    					  <div class="container">
        										<div class="row my-3">
           											<div class="col-12">
                										<h4>Chart</h4>
            										</div>
       											</div>
        									<div class="row my-2">
            									<div class="col-lg-6">
                									<div class="card">
                    									<div class="card-body bg-">
                        									<canvas id="myChart1"></canvas>
                    										<div class="card-body d">
                    											<div class="row">
                    												<div class ="col-md-4"></div>
                    												<div class ="col-md-5">
                    													<br/>
                    													<i class="fas fa-solid fa-stop text-primary"><a>&nbsp;판매완료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${countV.pso}</a></i>
                    													<i class="fas fa-solid fa-stop text-secondary"><a>&nbsp;판매중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${countV.ps}</a></i>
                    												</div>
                    											</div>
                    										</div>
                    									</div>
                    									
                    									<div class="card-footer text-center text-white bg-dark">
                      										<h3>상품 현황</h3>
                    									</div>
                									</div>
            									</div>
            									<div class="col-lg-6">
                									<div class="card">
                    									<div class="card-body">
                        									<canvas id="myChart2"></canvas>
                        									<div class="card-body d">
                    											<div class="row">
                    												<div class ="col-md-4"></div>
                    												<div class ="col-md-5">
                    													<br/>
                    													<i class="fas fa-solid fa-stop text-primary"><a>&nbsp;답변완료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${countV.qaf}</a></i>
                    													<i class="fas fa-solid fa-stop text-secondary"><a>&nbsp;답변대기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${countV.qar}</a></i>
                    												</div>
                    											</div>
                    										</div>
                    									</div>
                    									<div class="card card-footer text-center text-white bg-dark">
                      										<h3>문의 현황</h3>
                    									</div>
                									</div>
            									</div>
        									</div>
    									</div>
                    				</div><%--row productpie의 끝 --%>
                    			</div>
                    		<p><br/></p>
                    		<p/>
                    		<hr/>
                    		</div>
                    	
                    	</div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<!-- Core theme JS-->
		<script src="js/scripts.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		
		<%--차트 --%>
		<script>
		data = {
		        datasets: [{
		            backgroundColor: ['silver','dark'],
		            data: [ ${countV.qar}, ${countV.qaf}]
		        }],       
		        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
		        labels: ['답변대기','답변완료'] 
		    };
		data2 = {
		        datasets: [{
		            backgroundColor: ['silver','dark'],
		            data: [${countV.ps}, ${countV.pso}]
		        }],       
		        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
		        labels: ['판매중','판매완료'] 
		    };

		  // 가운데 구멍이 없는 파이형 차트
		  var ctx1 = document.getElementById("myChart1");
		  var myPieChart = new Chart(ctx1, {
		      type: 'pie',
		      data: data2,
		      options: {}
		  });
		  // 도넛형 차트
		  var ctx2 = document.getElementById("myChart2");
		  var myDoughnutChart = new Chart(ctx2, {
		      type: 'doughnut',
		      data: data,
		      options: {}
		  });
		</script>
    </body>
</html>
