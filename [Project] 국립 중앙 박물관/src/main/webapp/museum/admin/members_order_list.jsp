<%@page import="museum.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="museum.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_admin_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	td {
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 19;
		font-weight: 400;
		padding: 3px;
		vertical-align: top;
	}
	.title,.add,.view {
		padding-top: 20px;
		padding-left: 20px;
	}
	#title {
		font-size: 22;
		font-weight: 500;
	}
	#title2 {
		font-size: 25;
		font-weight: 600;
	}
	#AddForm td:nth-child(odd){
		width: 100px;
		text-align: center;
	}
	#AddForm td:first-child{
		width: 100px;
	}
	#text_search {
		width: 30%;
    	border: 1px solid #595959;
    	/* margin: 8px 0; */
    	padding: 4px 10px;
    	font-weight: 300;
    	font-family: 'Noto Sans KR', sans-serif;
	}
	#submit {
		width: 70px;
		height: 30px;
		border-radius: 4px;
		border: 0px;
		background: #E7E6E6;
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
		cursor: pointer;
	}
	#submit2 {
		width: 100px;
		height: 30px;
		border-radius: 4px;
		border: 0px;
		background: #E7E6E6;
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
		cursor: pointer;
	}
	.view th {
		font-size: 16;
		font-weight: 400;
	}
	.view td {
		font-size: 16;
		font-weight: 300;
		text-align: center;
		padding: 10px;
	}
	.view td>a {
		color: #000;
		text-decoration-line: none;
	} 
</style>
<td>
<%
	OrderDAO odao = OrderDAO.getInstance();
	ArrayList<OrderDTO> lists = odao.getOrderLists();
	ArrayList<OrderDTO> listsById = null;
	
	String searchId = request.getParameter("searchId");
	
	if(searchId != null) {
		listsById = odao.getOrderListsByMemid(searchId);
	}
%>
<div class="title">
<a id="title2">회원 관리</a><br>
</div>
<div class="add">
<a id="title">조회할 회원 검색</a>&emsp;
<form method="post" action="members_order_list.jsp">
<div style="padding-bottom:10px"></div>
<table cellspacing="0" width="80%" id="AddForm">
	<tr>
		<td>회원 아이디</td>
		<td><input type="text" id="text_search" name="searchId">&emsp;<input type="submit" id="submit" value="검색"></td>
	</tr>
</table>
</form>
</div>
<div class="view">
<a id="title">구매 내역 조회</a>&ensp;
<input type="button" id="submit2" value="전체 조회" onClick="location.href='members_order_list.jsp'">
<div style="padding-bottom:10px"></div>
<table border="1" cellspacing="0" width="90%">
	<tr>
		<th>번호</th>
		<th>회원 이름</th>
		<th>회원 아이디</th>
		<th>구매 상품</th>
		<th>구매 개수</th>
		<th>구매 금액</th>
		<th>결제 수단</th>
		<th>결제상태</th>
	</tr>
<%
	if(searchId == null) {
		for(int i=0; i<lists.size(); i++) {
%>
	<tr>
		<td><%=i+1%></td>
		<td><%=lists.get(i).getMemname()%></td>
		<td><%=lists.get(i).getMemid()%></td>
		<td><%=lists.get(i).getGname()%></td>
		<td><%=lists.get(i).getQty()%></td>
		<td><%=lists.get(i).getAmount()%></td>
		<td><%=lists.get(i).getPay()%></td>
		<%
			if(lists.get(i).getCondition().equals("결제취소")) {
		%>
				<td style="color:red"><%=lists.get(i).getCondition() %></td>
		<%
			} else {
		%>
				<td style="color:blue"><%=lists.get(i).getCondition() %></td>
		<%
			}
		%>
	</tr>
<%
		} //for
	}
	else {
		for(int i=0; i<listsById.size(); i++) {
%>
	<tr>
		<td><%=i+1%></td>
		<td><%=lists.get(i).getMemname()%></td>
		<td><%=lists.get(i).getMemid()%></td>
		<td><%=lists.get(i).getGname()%></td>
		<td><%=lists.get(i).getQty()%></td>
		<td><%=lists.get(i).getAmount()%></td>
		<td><%=lists.get(i).getPay()%></td>
		<%
			if(lists.get(i).getCondition().equals("결제취소")) {
		%>
				<td style="color:red"><%=lists.get(i).getCondition() %></td>
		<%
			} else {
		%>
				<td style="color:blue"><%=lists.get(i).getCondition() %></td>
		<%
			}
		%>
	</tr>
<%
		} //for
	} //if
%>
</table>
</div>
</td>
</tr>
</table>