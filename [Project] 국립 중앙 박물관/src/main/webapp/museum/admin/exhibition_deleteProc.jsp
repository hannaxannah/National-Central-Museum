<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- exhibition_deleteProc.jsp -->

<%
	ExhibitionDAO edao = ExhibitionDAO.getInstance();
	
	String[] exhnum = request.getParameterValues("selectCheck");
	for(int i=0; i<exhnum.length; i++){
		System.out.println(exhnum[i]);
	}
	int cnt = edao.deleteCheckExhibition(exhnum); 
	if(cnt > 0){
		response.sendRedirect("exhibition_list.jsp");
	}
%>
