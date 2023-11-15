<%@page import="museum.MembersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="museum.MembersDAO"%>
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
	MembersDAO mdao = MembersDAO.getInstance();
	ArrayList<MembersDTO> lists = mdao.getAllMembers();
	MembersDTO mdtoById = null;
	
	String searchId = request.getParameter("searchId");
	
	if(searchId != null) {
		mdtoById = mdao.getMembersById(searchId);
	}
%>
<div class="title">
<a id="title2">회원 관리</a><br>
</div>
<div class="add">
<a id="title">조회할 회원 검색</a>&emsp;
<form method="post" action="reservation_list.jsp">
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
<a id="title">회원 목록</a>&ensp;
<input type="button" id="submit2" value="전체 조회" onClick="location.href='members_list.jsp'">
<div style="padding-bottom:10px"></div>
<table border="1" cellspacing="0" width="90%">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>연락처</th>
		<th>sms 동의</th>
		<th>email</th>
		<th>email 동의</th>
	</tr>
<%
	if(searchId == null) {
		for(MembersDTO mdto : lists) {
%>
	<tr>
		<td><%=mdto.getRownum()%></td>
		<td><%=mdto.getName() %></td>
		<td><%=mdto.getId() %></td>
		<td><%=mdto.getHp1() %><%=mdto.getHp2() %><%=mdto.getHp3() %></td>
		<td><%=mdto.getSmsAgree()%></td>
		<td><%=mdto.getEmail()%></td>
		<td><%=mdto.getEmailAgree()%></td>
	</tr>
<%
		} //for
	}
	else {
%>
	<tr>
		<td><%=mdtoById.getRownum()%></td>
		<td><%=mdtoById.getName() %></td>
		<td><%=mdtoById.getId() %></td>
		<td><%=mdtoById.getHp1() %><%=mdtoById.getHp2() %><%=mdtoById.getHp3() %></td>
		<td><%=mdtoById.getSmsAgree()%></td>
		<td><%=mdtoById.getEmail()%></td>
		<td><%=mdtoById.getEmailAgree()%></td>
	</tr>
<%
	} //if
%>
</table>
</div>
</td>
</tr>
</table>