<%@page import="java.text.SimpleDateFormat"%>
<%@page import="museum.BoardDTO"%>
<%@page import="museum.BoardDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="admin.ShopDTO"%>
<%@page import="admin.ShopDAO"%>
<%@page import="museum.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="museum.OrderDAO"%>
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
	.mypageService a {
		text-decoration-line: none;
		color: #262626;
	}
	.mypageService table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
		color: #262626;
	}
	.mypageService th {
		padding: 5px;
		border-top: 1px solid #262626; 
		border-bottom: 1px solid #262626;
		border-right: 1px solid #BFBFBF;
		background: #f8f9fa;
	}
	.mypageService th:last-child {
		border-right: 0px;
	}
	.mypageService td {
		padding: 5px;
		border: 0px solid #BFBFBF;
		border-right: 1px solid #BFBFBF;
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageService tr:frist-child td {
		padding: none;
		border-bottom: 1px solid #262626;
	}
	.mypageService tr:last-child td {
		border-bottom: 1px solid #262626;
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
	int pageSize = 5; //한페이지에 보이는 레코드 수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	String pageNum = request.getParameter("pageNum"); //pageNum : 내가 선택한 페이지 번호
	System.out.println("pageNum:"+pageNum);
	if(pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	//startRow : 6
	//endRow : 10 
	
	BoardDAO bdao = BoardDAO.getInstance();
	ArrayList<BoardDTO> lists = null;
	int count = bdao.getArticleCount();
	if(count>0) {
		lists = bdao.getArticles(startRow,endRow);
	}
	int number = count-(currentPage-1) * pageSize;
	//1페이지 : 19-(1-1)*5 = 19
	//2페이지 : 19-(2-1)*5 = 14
%>
<%-- <b>글목록(전체 글:<%=count%>)</b> --%>
<table>
	<tr>
		<td colspan="5" align="right">
			<input type="button" id="write" value="글쓰기" onClick="location.href='mypage_serviceWriteForm.jsp'">
			<div style="padding:5px"></div>
		</td>
	</tr>
<%
	if(count==0) {
%>
	<tr>
		<td align="center">
			작성한 문의가 없습니다.
		</td>
	</tr>
<%
	} else {
%>
	<tr align="center">
		<th width="7%">번호</th>
		<th>제목</th>
		<th width="11%">작성자</th>
		<th width="17%">작성일</th>
		<th width="7%">조회</th>
		<th width="7%">ref</th>
		<th width="7%">re_step</th>
		<th width="7%">re_level</th>
	</tr>
	<% for(BoardDTO bdto : lists) { %>
	<tr align="center">
		<td><%=number--%></td>
		<td align="left">
			<%
				if(bdto.getRe_level() > 0) { //답글, 답답글, ...
					for(int i=0; i<bdto.getRe_level(); i++) {
						out.println("&emsp;");
					}
				}
			%>
			<a href="mypage_serviceContent.jsp?num=<%=bdto.getNum()%>&pageNum=<%=pageNum%>"><%=bdto.getSubject()%></a>
			<%
				if(bdto.getReadcount() >= 10) {	
			%>
					<!-- <img src="images/hot.gif" height="15"> -->	
			<%			
				}
			%>
			<!-- content.jsp?num=20&pageNum=2 (get방식 표기법) -->
		</td>
		<td><%=bdto.getWriter()%></td>
		<td><%=sdf.format(bdto.getReg_date())%></td>
		<td><%=bdto.getReadcount()%></td>
		<td><%=bdto.getRef()%></td>
		<td><%=bdto.getRe_step()%></td>
		<td><%=bdto.getRe_level()%></td>
	</tr>
	<% } %>
</table>
<div style="padding:10px"></div>
<%
	} //else
		
	//페이지 설정
	if(count > 0) {
		int pageCount = count / pageSize + (count%pageSize == 0?0:1);
		//필요한 전체 페이지 수 ex)레코드 23개 -> 23/5=4 ...3 => pageCount=4+1=5
			
		int pageBlock = 3;
		//한번에 보여줄 페이지 목록 개수 ex)pageCount=5 [이전] 1 2 3 [다음] & [이전] 4 5 [다음]
				
		int startPage = ((currentPage-1)/pageBlock*pageBlock)+1;
		int endPage = startPage + pageBlock -1;
		
		/*
		1페이지 => startPage:1 endPage:3
		3페이지 => startPage:1 endPage:3
		8페이지 => startPage:7 endPage:9
		레코드갯수 : 37개
		필요한 페이지 수 : 8
		[7][8][9] 안되겠다 -> [7][8]
		시작페이지 :
			 1 2 3
		[이전]4 5 6
		[이전]7 8 9
		[이전]10 ~
		if(pageCount < endPage) {
			endPge = pageCount;
		}
		*/
		if(pageCount < endPage) { //마지막 페이지
			endPage = pageCount;
		}
		
		if(startPage > 3) {
	%>
			<a href="mypage_service.jsp?pageNum=<%=startPage-3%>">[이전]</a>
	<%
			
		} //if
		
		for(int i=startPage;i<=endPage;i++){
		%>
			<a href="mypage_service.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		<%
		} //for
	
		if(endPage < pageCount) {
	%>
			<a href="mypage_service.jsp?pageNum=<%=startPage+3%>">[다음]</a>
<%-- 		<a href="mypage_service.jsp?pageNum=<%=endPage+1%>">[다음]</a> --%>
	<%
			
		} //if
		
	} //if(count > 0)
%>
</div>
<%@ include file="../main_bottom.jsp"%>