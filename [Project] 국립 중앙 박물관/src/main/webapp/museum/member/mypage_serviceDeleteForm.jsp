<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.mypageServiceDelete {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 200px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypageServiceDelete table {
		margin: auto;
		width: 80%;
		border-collapse: collapse;
		border-top: 1px solid #BFBFBF;
		color: #262626;
	}
	.mypageServiceDelete td {
		padding: 1%;
		text-align: left;
		border-bottom: 1px solid #D9D9D9;
	}
	.mypageServiceDelete td:first-child  {
		width: 12%;
		padding-left: 2%;
		padding-right: 2%;
		font-weight: 500;
	}
	.mypageServiceDelete tr:last-child td {
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageServiceDelete td[colspan="2"]:first-child {
		background: none;
		color: #000;
		font-weight: 600;
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageServiceDeleteForm {
		width: 65%;
		margin: auto;
		padding-top: 50px;
		padding-bottom: 10px;
		text-align: center;
		background: #f8f9fa;
		border-radius: 10px;
	}
	#text_service {
	    padding: 6px 10px;
	    font-size: 16px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 2px;
	    outline: none;
	}
	#submit_write {
		width: 100px;
		height: 35px;
		border-radius: 4px;
		background: #262626;
		color: #fff;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: medium;
		font-weight: 500;
		cursor: pointer;
	}
</style>
<hr>

<div class="mypageServiceDelete">
<a style="font-size:50; font-weight:500;">1:1 문의</a>
<div style="padding:30px"></div>
<% 
	String num = request.getParameter("num"); 
	String pageNum = request.getParameter("pageNum"); 
%>
<div class="mypageServiceDeleteForm">
<form name="deleteForm" action="mypage_serviceDeleteProc.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table>
	<tr>
		<td colspan="2" align="left">문의 글 삭제
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="text_service" name="passwd"></td>
	</tr>
</table>
<div style="padding:40px"></div>
<input type="submit" id="submit_write" value="글삭제">&emsp;
<input type="button" id="submit_write" value="글목록" onClick="mypage_service.jsp?pageNum=<%=pageNum%>">
</form>
</div>
</div>
<%@ include file="../main_bottom.jsp"%>