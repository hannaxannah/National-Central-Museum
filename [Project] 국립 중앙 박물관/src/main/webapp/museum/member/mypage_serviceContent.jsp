<%@page import="museum.BoardDTO"%>
<%@page import="museum.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.mypageService {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 200px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypageService table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
	}
	.mypageService td {
		padding: 5px;
		padding-left: 2%;
		border: 0px solid #BFBFBF;
		border-right: 1px solid #BFBFBF;
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageService tr:first-child td{
		border-bottom: 1px solid #262626;
	}
	.mypageService tr:last-child th {
		border-bottom: 1px solid #262626;
	}
	.mypageService tr:last-child td {
		border-bottom: 1px solid #262626;
	}
	.mypageService th {
		padding: 5px;
		border: 1px solid #BFBFBF;
		background: #f8f9fa;
	}
	.mypageService th:nth-child(odd) {
		border-left: 0px;
	}
	.mypageService td:last-child {
		border-right: 0px;
	}
	#write {
		width: 100px;
		height: 35px;
		border: 0px;
		border-radius: 4px;
		background: #E7E6E6;
		color: #262626;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: medium;
		font-weight: 500;
		cursor: pointer;
	}
</style>
<hr>
<div class="mypageService">
<a style="font-size:50; font-weight:500;">1:1 문의</a>
<div style="padding:30px"></div>
<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	System.out.println("[content] num:"+num+", pageNum:"+pageNum);

	BoardDAO bdao = BoardDAO.getInstance();
	BoardDTO article = bdao.getArticleByNum(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<table>
	<tr>
		<td colspan="5" align="right">
			<input type="button" id="write" value="답글쓰기" onClick="location.href='mypage_serviceReplyForm.jsp?pageNum=<%=pageNum%>&ref=<%=article.getRef()%>&re_step=<%=article.getRe_step()%>&re_level=<%=article.getRe_level()%>'">
			<div style="padding:5px"></div>
		</td>
	</tr>
	<tr>
		<th width="10%">글번호</th>
		<td width="40%"><%=article.getNum() %></td>
		<th width="10%">조회수</th>
		<td width="40%"><%=article.getReadcount() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=article.getWriter() %></td>
		<th>작성일</th>
		<td><%=sdf.format(article.getReg_date())%></td>
	</tr>
	<tr>
		<th>글제목</th>
		<td colspan="3"><%=article.getSubject() %></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td colspan="3" height="200px"><%=article.getContent() %></td>
	</tr>
</table>
<div style="padding:20px"></div>
<input type="button" id="write" value="글수정" onClick="location.href='mypage_serviceUpdateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">&emsp;
<input type="button" id="write" value="글삭제" onClick="location.href='mypage_serviceDeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">&emsp;
<input type="button" id="write" value="글목록" onClick="location.href='mypage_service.jsp?pageNum=<%=pageNum%>'">
</div>
<%@ include file="../main_bottom.jsp"%>