<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	System.out.println("userid:"+userid);

	MembersDAO mdao = MembersDAO.getInstance();
	boolean isCheck = mdao.searchId(userid);
	String str = "";
	if(isCheck) {
		str = "NO";
		out.print(str);
		System.out.println(str);
	} else if(userid.equals("")) {
		str = "NULL";
		out.print(str);
		System.out.println(str);
	} else {
		str = "YES";
		out.print(str);
		System.out.println(str);
	}
%>
