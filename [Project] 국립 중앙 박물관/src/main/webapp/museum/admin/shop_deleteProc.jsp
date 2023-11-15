<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<jsp:useBean id="sdao" class="admin.ShopDAO"/>
<%
	String gnum = request.getParameter("fnum");

	int cnt = sdao.deleteGoods(gnum);
	if(cnt > 0) {
		response.sendRedirect("select.jsp");
	}
%>
