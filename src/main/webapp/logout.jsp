<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String m_id = request.getParameter("m_id");

	session.removeAttribute("mvo");
	
	response.sendRedirect("mainLogin.jsp");
%>
</body>
</html>