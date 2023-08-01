<%@page import="VNS.util.Paging"%>
<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! 
	memberVO  smvo = null;
			%>

<%smvo = (memberVO)session.getAttribute("mvo");
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
      	<link href="css/bootstrap.css" rel="stylesheet" />
  		
  <!-- 새로추가 --> 
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>       
   
        
    <style>
    
 

	table{
		width: 600px;
	border-collapse: collapse;
		line-height: 1.5;
	}
		
	table th, table td{
		/*border: 1px solid black; */
		padding: 4px;
	}
	table caption{
		text-indent: -9999px;
		height: 0;
	}
	
	.popup{
		display: none;
	}
	
	/* paging */
	
 /*  tfoot ol.paging {
    justify-content: flex-start;
  }

	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	    text-decoration: none
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	    text-decoration: none
	    
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	 /*   border:1px solid #ff4aa5; */
	 	border : 1px solid #808080;
	    background:#808080;
	    color:white;
	    font-weight:bold;
	}
	 */
	.empty{
		height: 50px;
		color: #ababab;
	}

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
                <div class="container-fluid">
                    <div class = "row">
                    <div class ="col-md-1"></div>
                    <div class="col-md-4">
                    <h1 class="mt-4">회원 관리</h1>
                    </div>
                    
                    <p>
                    </div>
                    <!-- 새로추가한거 -->
               <form action="Controller" method="get" class="form-inline" name="frm">
               <div class="row">
               <div class="col-md-1"></div>
               <div class="col-md-7 col-md-offset-5">
                 <input type="hidden" name="type" value="amList"/> 
                 
                 <!------------------------------------- 라디오 버튼 추가 -->
                 <div class="form-check">
		            <input class="form-check-input" type="radio" name="m_status" id="all" value="100">
		            <label class="form-check-label" for="all">전체</label>
		         </div>
                
                 <div class="form-check">
 	            	<input class="form-check-input" type="radio" name="m_status" id="member" value="1">
		            <label class="form-check-label" for="member">회원</label>
		         </div>
		        
		         <div class="form-check">
		            <input class="form-check-input" type="radio" name="m_status" id="admin" value="0">
		            <label class="form-check-label" for="admin">관리자</label>
		         </div>
		        
		         <div class="form-check">
		            <input class="form-check-input" type="radio" name="m_status" id="account_suspension" value="3">
		            <label class="form-check-label" for="account_suspension">계정정지</label>
		         </div>
		         <br/>
		        </div>
               </div>
                 <!------------------------------------ 라디오 버튼 추가 끝 -->

                     <div class="row">
                     	<div class="col-md-1"></div>
                        <div class="col-md-3 col-md-offset-3">
                           <select id="searchType" name="searchType" class="form-select">
                              <option value="0">아이디</option>
                              <option value="1">이름</option>
                              <option value="2">핸드폰</option>
                           </select>
                        </div>
                        <div class="col-md-5">
                           <div class="input-group">
                           <input class="form-control" placeholder="검색어를 입력하세요" aria-describedby="button-addon" type="text" 
                              id="searchValue" name="searchValue" /> 
                           <input type="button" class="btn btn-dark" onclick="search(this.form)"
                              value="검색" />
                           </div>
                        </div>
                     </div>
                     
                     <input type="hidden" id="m_status_chk" value="${requestScope.m_status }"/>
                     
                  </form>
            
            

                    
                
                    <!-- 새로추가 -->
                    <div class="row">
                	<div class="col-md-1"></div>
                	<div class="col-md-9">
                    
                    
                        <form action="" method="get">
                        
                     <!-- 그냥 table에서 수정 -->   
                        <table class="table table-hover">
                        
                       <caption>회원정보</caption>
                         <colgroup>
                         	<col width="40px"/>
						    <col width="60px"/>
						    <col width="70px"/>
						    <col width="90px"/>
						    <col width="100px"/>
                         </colgroup>
                         <thead>
                    
                         <tr>
                         <td colspan="5">
                    
<!-- 원래 있던곳  -->
            		

                
                     </td>
                     </tr>
                         
                         <tr>
                          <th>번호</th>
                          <th>아이디</th>
                          <th>이름</th>
                          <th>핸드폰</th>
						  <th>가입일</th>
						</tr>
             
                         </thead>
                         
						
						
						<%
							Object pp = request.getAttribute("page");
							Paging pvo = null;
							if(pp != null){
								pvo = (Paging)pp;
								//  [<]  [1]  [2]  [3]  [>]
						%>
						
						
                    
                         
                <tbody>
				<%
					Object obj = request.getAttribute("ar");
					memberVO[] ar = null;
					if(obj != null){
						ar = (memberVO[])obj; 
						int i=0;
						for(memberVO mvo : ar){
							int num=pvo.getTotalRecord()-((pvo.getNowPage()-1)*pvo.getNumPerPage()+i);
						//	int num = (pvo.getNowPage() - 1) * pvo.getNumPerPage() + i + 1;
				%>
					<tr>
						<td><%=num %></td>
					<%-- 	<td><a href="Controller?type=amDetail&m_idx=<%=mvo.getM_idx()%>"
						onclick="javascript:location.href='amDetailpage.jsp'"><%=mvo.getM_id() %></a></td> --%>
						
						<td><a href="Controller?type=amDetail&m_idx=<%=mvo.getM_idx()%>"><%=mvo.getM_id() %></a></td>
				
						
						<td><%=mvo.getM_name() %></td>
						<td><%=mvo.getM_phone() %></td>
						<td><%=mvo.getM_joindate() %></td>
					</tr>
				<%	
						++i;
						}//for의 끝
					}else{
				%>
				<tr>
					<td colspan="5" class="empty">현재 등록된 게시물이 없습니다.</td>
				</tr>
				<%		
					}//if문의 끝
				%>
				</tbody>
			
                         
                        </table>
                        </form>
                        <table>
                        
                        </table>
                    </p>
                </div>
           		<div class= "row">
           			<div class = "col-md-5"></div>
           			<div class = "col-md-4">
           				<table>
           					<tbody>
           						
					<tr>
					<td colspan="5">
					<ol class="pagination">
						<%
								if(pvo.getStartPage()<pvo.getPagePerBlock()){
								%>
								<li class="page-item disabled"><a class= "page-link">&lt;</a></li>
							<%
							}else{
							%>
							<li class="page-item"><a class="page-link" href="Controller?type=amList&cPage=<%=pvo.getStartPage()-pvo.getPagePerBlock()%>">&lt;</a></li>
							<%
							}
							for(int i=pvo.getStartPage(); i<=pvo.getEndPage(); i++){
									
									if(i == pvo.getNowPage()){
							%>
								<li class="page-item active"><a class= "page-link"><%=i %></a></li>	
							<%			
									}else{
							%>	
								<li class="page-item"><a class= "page-link" href="Controller?type=amList&cPage=<%=i%>"><%=i %></a></li>
							<%
									}
								}//for의 끝
								
							
								if(pvo.getEndPage()<pvo.getTotalPage()){
							%>	
							 <li class="page-item"><a class="page-link" href="Controller?type=amList&cPage=<%=pvo.getStartPage()+pvo.getPagePerBlock()%>">&gt;</a></li>
							<%
								}else{
							%>
								<li class="page-item disabled"><a class= "page-link">&gt;</a></li>
						<%				
								}// if문의 끝
							}
						%>	
							</ol>
						</td>
					</tr>
				
           					</tbody>
           				</table>
           			</div>
           		
           		</div>	
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        <!-- 새로추가 -->
               <script type="text/javascript" src="js/bootstrap.js"></script>
        
      
<!--       <div id="search_popup" class="popup" title="회원 검색">
		<div id="content">
		<form action="Controller" method="post">
			<input type="hidden" name="type" value="amList"/>
			<select id="searchType" name="searchType">
				<option value="0">아이디</option>
				<option value="1">이름</option>
				<option value="2">핸드폰</option>
			</select>
			<input type="text" id="searchValue" name="searchValue"/><br/>
			<input type="button" value="검색" onclick="search(this.form)"/>
		</form>
		</div>
	</div> -->
      
      
        <script>
     /*    function searchWin(){
			$( "#search_popup" ).dialog();
		} */
		
        function search(frm){
			var value = $("#searchValue").val();
			
			if(value.trim().length < 1){
				alert("검색단어를 입력하세요");
				$("#searchValue").focus();
				return;
			}
			frm.submit();
		}
	
	      $(function () {// jquery도입부분이며 무조건 수행하는 곳
	    	  
	    	  let mStatus = $("#m_status_chk").val();
	      
	      	  $("#all").attr("checked", false);
	      	  $("#member").attr("checked", false);
	      	  $("#admin").attr("checked", false);
	      	  $("#account_suspension").attr("checked", false);
	      	  
	      	  switch(mStatus){
	      	  	case "100":
	      	  		$("#all").attr("checked", true);
	      	  		break;
	      	  	case "1":
	      	  		$("#member").attr("checked", true);
	      	  		break;
	      	  	case "0":
	      	  		$("#admin").attr("checked", true);
	      	  		break;
	      	  	case "3":
	      	  		$("#account_suspension").attr("checked", true);
	      	  		break;
	      	  		
	      	  }
	      
	    	  
	        $('#member, #all, #admin, #account_suspension').click(function () {
				document.frm.submit();
	        });

	    
	      });
		
		
		
		<!--
        </script>
    </body>
</html>
