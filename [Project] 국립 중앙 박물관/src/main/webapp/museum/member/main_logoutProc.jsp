<%@page import="museum.MembersDTO"%>
<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main_logoutProc.jsp -->
<%
	session.removeAttribute("sid");
	session.removeAttribute("sno");
%>
<script type="text/javascript">
	location.href="<%=request.getContextPath()%>/museum/main.jsp";
</script>