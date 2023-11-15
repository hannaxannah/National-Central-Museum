<%@page import="admin.ExhCategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ExhCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_admin_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	td, th {
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 19;
		font-weight: 400;
		padding: 3px;
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
	#AddForm {
		vertical-align: middle;
	}
	#text {
		width: 100%;
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
<div class="title">
<a id="title2">전시 관리</a><br>
</div>
<div class="add">
<a id="title">전시 카테고리 등록</a>
<div style="padding-bottom:10px"></div>
<form method="post" action="">
<table border="0" cellspacing="0" width="80%" id="AddForm">
	<tr>
		<td width="14%" align="center">전시 카테고리 코드</td>
		<td width="20%"><input type="text" id="text" name="ccode"></td>
		<td width="2%"></td>
		<td width="14%" align="center">전시 카테고리 이름</td>
		<td width="20%"><input type="text" id="text" name="cname"></td>
		<td width="2%"></td>
		<td width="10%"><input type="submit" id="submit" value="등록"></td>
	</tr>
</table>
</form>
</div>
<%
	ExhCategoryDAO ecdao = ExhCategoryDAO.getInstance();
	ArrayList<ExhCategoryDTO> lists = ecdao.getAllExhCategory();
%>
<div class="view">
<a id="title"> 전시 카테고리 목록</a>&ensp;
<input type="button" id="submit" value="조회" onClick="location.reload()">
<div style="padding-bottom:10px"></div>
<table border="1" cellspacing="0" width="80%" id="categoryList">
	<tr>
		<th>번호</th>
		<th>카테고리 코드</th>
		<th>카테고리 이름</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
<%
	for(ExhCategoryDTO ecdto : lists) {
%>
	<tr>
		<td><%=ecdto.getCnum()%></td>
		<td><%=ecdto.getCcode()%></td>
		<td><%=ecdto.getCname()%></td>
		<td><a href="">수정</a></td>
		<td><a href="">삭제</a></td>
	</tr>
<%
	}
%>
</table>
</div>
</td>
</tr>
</table>