<%@page import="admin.ShopDTO"%>
<%@page import="admin.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage_cartDel.jsp -->
<jsp:useBean id="Cart" class="museum.CartDTO" scope="session"/>
<%
	String gnum = request.getParameter("gnum");

	Cart.removeGoods(gnum);
	response.sendRedirect("mypage_cart.jsp");
%>