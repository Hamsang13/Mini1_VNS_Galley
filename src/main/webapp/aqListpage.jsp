<%@page import="mybatis.vo.memberVO"%>
<%@page import="mybatis.vo.writelogVO"%>
<%@page import="VNS.util.Paging"%>
<%@page import="mybatis.vo.questionVO"%>
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
        <link href="css/bootstrap.css" rel="stylesheet"/>
  <!-- 새로추가 --> 
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

	
    
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
                <div class="container-fluid">
                	<div class="row">
                	<div class="col-md-1"></div>
					<div class="col-md-10">
						
				<table summary="게시판 목록" class="table table-hover">
					
						 <colgroup>
							<col width="100px">
							<col width="*">
							<col width="130px">
							<col width="130px">
							<col width="160px">
							
						</colgroup>
						
							<thead>
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: left;">문의</th>
									<th style="text-align: center;">비밀글</th>
									<th style="text-align: center;">상태</th>
									<th style="text-align: center;">게시일</th>
								</tr>
						
							</thead>
							
						
                          <%
                          	// 페이징을 위해 request에 page라는 이름으로 저장된 객체 가져오기
                          	Object pp = request.getAttribute("page");
                          	Paging pvo = null;
                          	if(pp != null){
                          		pvo = (Paging)pp;
                          		//System.out.println(pvo.getTotalRecord());
                          		//만약! page가 가지고 있는 startPage가 1이면 
                          		// 이전 기능을 부여하면 안된다.
                          	%>
						
			
                <!-- Page content-->
                <div class="">
                <h1 class="mt-4" style="font-size: 30px">문의 현황</h1>
                <hr/>
                <%
	                Object obj = request.getAttribute("vo");
					questionVO[] ar = null;
					if(obj != null) {
						ar = (questionVO[])obj;
						int i = 0;
						for(questionVO vo:ar){ 
							int num = pvo.getTotalRecord() - ((pvo.getNowPage()-1)*pvo.getNumPerPage()+i);
                %>
                </div>	
               	
						
		               		
                	
                    	
               <tbody>
                   
                    <tr>
	                   	<td style="text-align: center;">
	                   		<%=num %>
	                   	</td>
	                   	<td style="text-align: left;">
	                   		<a href="Controller?type=aqView&p_idx=<%=vo.getP_idx() %>&m_idx=<%=vo.getM_idx() %>" > <%=vo.getP_title() %> </a>
	                   	</td>
	                   	 <% 
	                    if(vo.getP_secret().equals("0")){
	                   	%>
	                   	<td></td>
	                   	<% }else{%>
	                   	<td style="text-align: center;">비밀글</td>
                  	 	<%} %>
                    	
                    	
	                   	 <% 
	                    if(vo.getP_wait().equals("1")){
	                   	%>
	                   	<td></td>
	                   	<% }else{%>
	                   	<td style="text-align: center;">답변완료</td>
                  	 	<%} %>
                    	<td style="text-align: center;"><%=vo.getWl_date() %></td>
                    <tr/>
                 
                 
                    
                 <%	
               		
                 		++i;
					}//for문의 끝
				}else{
				%>
				
				<tr>
					<td colspan="4" class="empty">현재 등록된 문의가 없습니다.</td>
				</tr>
				<%
					}//if문의 끝
				%>
				</tbody>
				 </table>
				 
				 </div>
				</div> 
				 
				 
				 <div class="row">
					<div class="col-md-5"></div>
					<div class="col-md-4">
				 
				 <table>
				 	<tbody >
                      <tr>
                          <td colspan="4">
                              <ol class="pagination" >
                          <%	
                          		if(pvo.getStartPage() < pvo.getPagePerBlock()){
                          %>
                          		
                          		<li class="page-item disabled"><a class="page-link">&lt;</a></li><%-- 이전기능을 비활성화 함 --%>
                          <%			
                          		}else{                          		
                          %>    
								<li class="page-item"><a class="page-link" href="Controller?type=aqList&cPage=<%=pvo.getStartPage()-pvo.getPagePerBlock()%>">&lt;</a></li>
						  <%
                          		}// 이전기능 활성화 확인하는 if문의 끝
                          		
                          		for(int i=pvo.getStartPage(); i<=pvo.getEndPage(); i++){
                          			
                          			//현재 i의 값이 현재페이지값과 같으면 
                          			// 링크를 걸지 않아야 한다.
                          			if(i == pvo.getNowPage()){
						  %>
								<li class="page-item active"><a class="page-link"><%=i %></a></li>
         				  <%
                          			}else{
                          %>
                          		<li class="page-item"><a class="page-link" href="Controller?type=aqList&cPage=<%=i%>"><%=i %></a></li>
                          <%				
                          			}//if문의 끝
                          		}//페이지 번호 출력하는 반복문의 끝
                          		
                          		//다음블럭 으로 이동하는 기능을 부여해야 할지? 하지 말아야 할지?는
                          		//endPage가 totalPage보다 작을 경우에만 기능을 부여한다.
                          		
                          		if(pvo.getEndPage() < pvo.getTotalPage()){
         				  %>	
								<li class="page-item"><a class="page-link" href="Controller?type=aqList&cPage=<%=pvo.getStartPage()+pvo.getPagePerBlock()%>">&gt;</a></li>
						  <%
                          		}else{
                          %>
                          		<li class="page-item disabled"><a class="page-link">&gt;</a></li>
                          <%			
                          		}
                          	}// if의 끝
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
            </div>
            
        <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript"></script>
	
    </body>
</html>
