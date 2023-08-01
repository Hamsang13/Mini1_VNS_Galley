<%@page import="mybatis.vo.memberVO"%>
<%@page import="mybatis.vo.questionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><%! 
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
 <style>
 	
 	

 </style>       
    </head>
    
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
                <div class="list-group list-group-flush">
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
                <%
	                Object obj = request.getAttribute("vo");
					questionVO[] ar = null;
					
					if(obj != null){
						ar = (questionVO[])obj;
					
						for(questionVO vo : ar){
							
					 
					 for(memberVO mvo : vo.getMvolist()){
					 
                %>
                <!-- Page content-->
                <div class="container-fluid">
                <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-6">
                	<h1 class="mt-4" style="font-size: 30px">문의 상세보기</h1>
                </div>
                <div class="col-md-4" style="padding-top: 20px">
                	
                		<%
			                    	if(vo.getP_wait().equals("1")){
			                    %>
			                    <input type="button" id="btn-open-popup" class="btn btn-dark" value="답변"/>
			                	<%
			                    	}else{
			                   	%>
			                   	<input style="visibility: hidden;" type="button" id="btn-open-popup" class="btn btn-dark" value="답변" disabled="disabled"/>
			                    <%		
			                    	}
			                	%>
                	<input type="button" value="목록" class="btn btn-dark" onclick="javascript:location.href='Controller?type=aqList'"/>  
                </div>
                <div class="col-md-2">	
                	<h3>
                		
                	</h3>
                </div>
                
                </div>
                
                
                <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                <hr/>
                
                
                	<table>
                		
                		<colgroup>
                			<col width="200px" >
							<col width="1500px" >
                		</colgroup>
                	
                   <tbody>
                    	<tr>
                    		<td>제목</td>
                    		<td> <%=vo.getP_title() %> </td>
                    		
                    	</tr>
                    	<tr>
                    		<td colspan="2"><br></td>
                    	</tr>
                    	<tr>
                    		<td>회원아이디(닉네임)</td>
                    		<td> <%=mvo.getM_id() %>(<%=mvo.getM_name() %>) </td>
                    	</tr>
                    	<tr>
                    		<td colspan="2"><br></td>
                    	</tr>
                    	<tr>
                    		<td>내용</td>
                    		<td> <%=vo.getP_content() %> </td>
                    	</tr>
                    	<tr>
                    		<td colspan="2"><br></td>
                    	</tr>
                    	
                    	<tr>
                    		<td colspan="2"><hr></td>
                    	</tr>
                    	
                    	
                    
                    
				</tbody> 
                  
                    <%
	                    Object obj2 = request.getAttribute("avo");
						questionVO[] ar2 = null;
						if(obj2 != null){
							ar2 = (questionVO[])obj2;
						
							for(questionVO avo : ar2){
                    %>
                    <tfoot>
                    	<tr>
                    		<td colspan="2"><br></td>
                    	</tr>
                    
	                    <tr>
	                    	<td>답변 제목</td>
	                    	<td><%=avo.getP_title() %></td>
	                    </tr>
	                    <tr>
                    		<td colspan="2"><br></td>
                    	</tr>
	                    <tr>
	                    	<td>답변 내용</td>
	                    	<td><%=avo.getP_content() %></td>
	                    </tr>
	                    <tr>
                    		<td colspan="2"><br></td>
                    	</tr>
                     	
                    
                    
                   <tr>
                   <td colspan="2">
                <div id="delete" title="삭제">
					<form action="Controller" method="post">
						<input type="hidden" name="type" value="delAnswer"/>
						<input type="hidden" name="del_idx" value="<%=avo.getP_idx()%>"/>
						<input type="hidden" name="p_idx" value="<%=vo.getP_idx()%>"/>
						<input type="hidden" name="m_idx" value="<%=vo.getM_idx()%>"/>
						<input type="button" class="btn btn-dark" value="삭제" onclick="del(this.form)"/>
					</form>
				</div>
				</td>
				</tr>
				</tfoot>
				
                        
                    
                
				
				
     		<%
				}
				}
            %> 
	            <div class="modal">
				<div class="modal-dialog" role="document" style="position: fixed; top: 40%; left: 50%; transform: translate(-50%, -50%); ">
				<form action="Controller" method="post">
			    
    		    <div class="modal-content" style="margin-top: 5px;" >
    		    <div class="modal-header">			
							<h5 class="modal-title">답변</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" >
					          	<span aria-hidden="true"></span>
					        </button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="type" value="answer"/>
						<input type="hidden" name="oval" value="<%=vo.getP_idx() %>"/>
						<input type="hidden" name="secret" value="<%=vo.getP_secret() %>"/>
						<input type="hidden" name="m_idx" value="<%=smvo.getM_idx() %>"/>
						
						<label for="q_title">제목:</label>
						<input type="text" id="title" name="title" ><br/>
						
						
						<label for="q_fname" >내용: </label>
						
						<input type="text" id="content" name="content" style="width: 400px; height: 120px; margin-top: 3px;" /><br/>
				        
				    </div>
						<div class="modal-footer">
					        <input type="button" id="save_bt" class="btn btn-primary" value="SAVE" onclick="add(this.form)"/>
					      	<button type="button" id= close_bt class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					      </div>
						
					
					
				</div>	
					</form>
				</div>	
				</div>	
				
				
				<%	
					 }
					}//for문의 끝
				}//if문의 끝
				%>
		
        </table>
        		</div>
                </div>
                </div>
            </div>
        </div>
        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
            
       <!-- 제이쿼리 -->
       <script
       src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
       </script>

       <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
       
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	    <script src="js/bootstrap.min.js"></script>
       
        
        <script>
	        
	        function add(frm) {
				//frm.submit();
				let res = confirm("저장하시겠습니까?");
				//console.log(res);
				if(res){
				 
				let oval = frm.oval.value;
				let secret = frm.secret.value;
				let m_idx = frm.m_idx.value;
				let title = frm.title.value;
				let content = frm.content.value;
				
				
				
				//비동기식 통신을 이용하여 파일을 서버로 보낸다.
				$.ajax({
					url: "Controller",
					data: {'type':'answer', 'oval':oval, 'secret':secret, 'm_idx':m_idx, 'title':title, 'content':content},// 파라미터(파일일 담긴 폼)
					type: "post", //전송방식
					dataType: "json", // 서버로부터 받을 데이터 형식
				}).done(function(data){
					//자바스크립트에서 보내는 sendRedirect!
					// 이걸 하지 않으면, 기존의 forward된 정보를 다시 수행하기 때문에 댓글이 계속 저장된다.
					//location.href="Controller?type=aqView&p_idx="+oval+"&m_idx="+m_idx;
					
					location.href="Controller?type=aqList";
				})
				}
			}
	        
	        function del(frm){
				let res = confirm("삭제하시겠습니까?");
				//console.log(res);
				if(res){
					frm.submit();
				}
					
			}
	        
	        const modal = document.querySelector('.modal');
	        const btnOpenPopup = document.querySelector('#btn-open-popup');
	        btnOpenPopup.addEventListener('click', () => {
	          modal.style.display = 'block';
	        });
	        
	        const closeBtn = modal.querySelector(".btn-close")
	        closeBtn.addEventListener("click", e => {
	            modal.style.display = "none"
	        });
	        
	        const closeBtn2 = modal.querySelector("#close_bt")
	        closeBtn2.addEventListener("click", e => {
	            modal.style.display = "none"
	        });
	        
	        
	      
	       
        </script>
    </body>
</html>
