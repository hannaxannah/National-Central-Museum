<%@page import="admin.ExhibitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- exhibitionSpecial.jsp -->
<%@ include file="exhibition_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.visitMenu table {
		color: #FC3;
		background: #000;
		width: 100%;
		border-collapse: collapse;
		border: 0px solid black;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20;
		text-align: center;
	}
	.visitMenu a {
		text-decoration-line: none;
		color: #FC3;
	}
	.visitMenu td {
		padding: 5px;
	}
	.special {
		padding-top: 100px;
		padding-bottom: 100px;
	}
	.special table {
		width: 90%;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.special td {
		padding: 1%;
		padding-bottom: 100px;
	}
	#bold1 {
		font-size: 23;
		font-weight: 500;
	}
	#bold2 {
		font-size: 20;
		font-weight: 500;
	}
	#ename {
		font-size: 27;
		font-weight: 500;
		text-decoration-line: none;
		color: #000;
	}
	#permsg1 {
		font-size: 24;
		font-weight: 400;
	}
	#permsg2 {
		font-size: 32;
		font-weight: 600;
	}
	#normal {
		font-size: 20;
		font-weight: 300;
	}
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="29%"></td>
			<td width="14%">
				<a href="exhibitionPermanent.jsp">상설 전시</a>
			</td>
			<td width="14%">
				<a style="text-decoration: underline; text-underline-offset : 5px;">특별 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionReservation.jsp?enum=1">예약하기</a>
			</td>
			<td width="29%"></td>
		</tr>
	</table>
</div>
<%
	String ecategory = "특별전시";

	ExhibitionDAO edao = ExhibitionDAO.getInstance();
	ArrayList<ExhibitionDTO> lists = edao.getAllExhibitionByCtgr(ecategory);
%>
<div class="special">
<table>
	<tr>
<%
		int count = 0;
		for(ExhibitionDTO edto : lists) {
			count++;
%>
		<td valign="top">
			<a href="exhibitionSpecialContent.jsp?enum=<%=edto.getExhnum()%>">
				<img src="<%=request.getContextPath()%>/images/<%=edto.getEposter()%>" width="80%">
			</a>
			<div style="padding:5px"></div>
			<div style="text-align:left; padding-left:10%; padding-right:10%">
			<a id="ename" href="exhibitionSpecialContent.jsp?enum=<%=edto.getExhnum()%>"><!-- content.jsp?num=enum -->
				<%=edto.getEname()%>
			</a>
			<div style="padding:5px"></div>
			<a id="bold2">기간</a>&ensp;&ensp;&ensp;<a id="normal"><%=edto.getEperiod()%></a><br>
			<a id="bold2">장소</a>&ensp;&ensp;&ensp;<a id="normal"><%=edto.getEplace()%></a><br>
			</div>
		</td>
<%
			if(count % 3 == 0) {
				out.println("</tr><tr>");
			} //if
		} //for
%>
	</tr>
</table>
</div>
<%@ include file="main_bottom.jsp"%>