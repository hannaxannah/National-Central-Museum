<%@page import="museum.MembersDTO"%>
<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.mypageServiceReply {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 200px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypageServiceReply table {
		margin: auto;
		width: 80%;
		border-collapse: collapse;
		border-top: 1px solid #BFBFBF;
		color: #262626;
	}
	.mypageServiceReply td {
		padding: 1%;
		text-align: left;
		border-bottom: 1px solid #D9D9D9;
	}
	.mypageServiceReply td:first-child  {
		width: 12%;
		padding-left: 2%;
		padding-right: 2%;
		font-weight: 500;
	}
	.mypageServiceReply tr:last-child td {
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageServiceReply td[colspan="2"]:first-child {
		background: none;
		color: #000;
		font-weight: 600;
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageServiceWriteForm { 
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
	#content_service {
		padding: 6px 10px;
	    font-size: 16px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 2px;
	    outline: none;
	    resize: none;
	    width: 600px;
	    height: 200px;
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
	#register2 {
		text-decoration-line: none;
		font-size: 14;
		font-weight: 400;
		color: #404040;
	}
</style>
<hr>

<div class="mypageServiceReply">
<a style="font-size:50; font-weight:500;">1:1 문의</a>
<div style="padding:30px"></div>
<%
	String ref = request.getParameter("ref");
	String re_step = request.getParameter("re_step");
	String re_level = request.getParameter("re_level");
	String pageNum = request.getParameter("pageNum");
	System.out.println("[replyForm] pageNum:"+pageNum);
	System.out.println("replyForm:"+ref+","+re_step+","+re_level); //부모 정보
	
	MembersDAO mdao = MembersDAO.getInstance();
	MembersDTO mdto = mdao.getMembersById(sid);
%>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<div class="mypageServiceWriteForm">
<form method="post" name="writeForm" action="mypage_serviceReplyProc.jsp" onSubmit="writeSave()">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table>
	<tr>
		<td colspan="2" align="left">답변 작성
	</tr>
	<tr>
		<td align="center">이름</td>
		<td><input type="text" id="text_service" name="writer" value="<%=mdto.getName()%>"></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><input type="text" id="text_service" name="subject" style="width:600px" value="[답글] "></td>
	</tr>
	<tr>
		<td align="center" valign="top">내용</td>
		<td><textarea name="content" id="content_service"></textarea></td>
	</tr>
	<tr>
		<td align="center">Email</td>
		<td>
			<input type="email" id="text_service" name="email" value="<%=mdto.getEmail()%>">
			&ensp;<a id="register2">* 문의 답변이 완료되면 Email로 안내드립니다.</a><br>
		</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td><input type="password" id="text_service" name="passwd"></td>
	</tr>
</table>
<div style="padding:40px"></div>
<input type="submit" id="submit_write" value="답변작성">&emsp;
<input type="reset" id="submit_write" value="다시작성">&emsp;
<input type="button" id="submit_write" value="목록보기" onClick="location.href='mypage_service.jsp?pagenum=<%=pageNum%>'">
</form>
</div>
</div>
<%@ include file="../main_bottom.jsp"%>