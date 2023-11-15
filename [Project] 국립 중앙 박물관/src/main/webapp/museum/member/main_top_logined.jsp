<%@page import="museum.MembersDTO"%>
<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	.top_menu table {
		width: 100%;
		text-align: center;
		vertical-align: middle;
	}
	.top_menu td {
		width: 14%;
	}
	.top_menu a {
		color: #000000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 23;
		font-weight: 700;
		text-align: center;
		text-decoration-line: none;
	}
	.top_menu td:nth-child(6) {
		position: relative;
		text-align: left;
		padding-left: 10px;
	}
	.top_menu td:nth-child(6) img {
		position: absolute;
		width: 10%;
		top: 25%;
		right: 7%;
	}
	#search {
		width: 80%;
    	border-radius: 12px;
    	border: 2px solid #404040;
    	/* margin: 8px 0; */
    	padding: 4px 10px;
    	font-weight: 300;
    	font-family: 'Noto Sans KR', sans-serif;
	}
	

</style>
<!-- main_top.jsp -->
<div class="top_menu">
<table>
	<tr>
		<td>
			<a href="main_logined.jsp">
				<img src="<%=request.getContextPath()%>/images/img_logo.png" width="80%">
			</a>
		</td>
		<td>
			<a href="visitInfor.jsp">관람 정보</a>
		</td>
		<td>
			<a href="exhibitionPermanent.jsp">전시 안내</a>
		</td>
		<td>
			<a href="introduceMessage.jsp">박물관 소개</a>
		</td>
		<td>
			<a href="shopAll.jsp">뮤지엄 샵</a>
		</td>
		<td>
				<!-- 검색 -->
				<input type="search" id="search">
				<!-- 돋보기 아이콘 버튼 -->
				<a href=""><!-- javascript:goSearch() -->
					<img src="<%=request.getContextPath()%>/images/btn_search_open.png">
				</a>
		</td>
		<td>
			<!-- 마이페이지 | 로그아웃 -->
			<%
				String sid = (String)session.getAttribute("sid");
			
				MembersDAO mdao = MembersDAO.getInstance();
				MembersDTO mdto = mdao.getMembersById(sid);
				
				if (sid == null) {
					response.sendRedirect(request.getContextPath()+"/museum/main.jsp");
				} else {
			%>
			<a href="mypage_main.jsp?id=<%=sid%>" style="font-size:18; font-weight: 500;"><%=mdto.getName()%>님</a>
			<%
				}
			%>
			&ensp;
			<a href="main_logoutProc.jsp" style="font-size:18; font-weight: 500;">로그아웃</a>
		</td>
	</tr>
</table>
</div>