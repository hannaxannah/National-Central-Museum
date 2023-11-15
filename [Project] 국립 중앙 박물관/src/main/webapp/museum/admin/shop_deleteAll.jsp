<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="admin.ShopDAO"/>
<%
	String[] num = request.getParameterValues("selectCheck");
	for(int i=0; i<num.length; i++){
		System.out.println(num[i]);
	}
	int cnt = sdao.deleteCheckData(num); 
	if(cnt > 0){
		response.sendRedirect("shop_list.jsp");
	}
%>