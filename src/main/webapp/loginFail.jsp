<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="mybatis.vo.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Object obj = request.getAttribute("mvo");
    	
    	memberVO mvo = null;
    	if(obj != null){
    		mvo = (memberVO)obj;
    	}
    	session.setAttribute("mvo", mvo);  	
    	
    	
    %> 
{
	"chk":"${requestScope.cnt}"
}
