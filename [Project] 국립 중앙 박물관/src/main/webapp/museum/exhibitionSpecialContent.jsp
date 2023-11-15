<%@page import="admin.ExhibitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- exhibitionSpecialContent.jsp -->
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
		vertical-align: top;
	}
	.visitMenu a {
		text-decoration-line: none;
		color: #FC3;
	}
	.visitMenu td {
		padding: 5px;
	}
	.specialContent {
		padding-top: 100px;
		padding-bottom: 100px;
	}
	.specialContent table {
		width: 60%;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: left;
	}
	.specialContent td:last-child {
		padding: 2%;
		padding-left: 3%;
	}
	#content1 {
		font-size: 30px;
		font-weight: 500;
	}
	#content2 {
		font-size: 21px;
		font-weight: 400;
	}
	#content3 {
		font-size: 18px;
		font-weight: 500;
	}
	#content4 {
		font-size: 18px;
		font-weight: 300;
	}
	#submit_reser {
		width: 150px;
		height: 40px;
		border-radius: 4px;
		border: 0px;
		background: #E7E6E6;
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
		cursor: pointer;
	}
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="29%"></td>
			<td width="14%">
				<a  href="exhibitionPermanent.jsp">상설 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionSpecial.jsp" style="text-decoration: underline; text-underline-offset : 5px;">특별 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionReservation.jsp">예약하기</a>
			</td>
			<td width="29%"></td>
		</tr>
	</table>
</div>
<%
	String exhnum = request.getParameter("enum");

	ExhibitionDAO edao = ExhibitionDAO.getInstance();
	ExhibitionDTO edto = edao.getExhibitionByNum(exhnum);
%>
<div class="specialContent">
	<table>
		<tr>
			<td align="center" width="30%">
				<img src="<%=request.getContextPath()%>/images/<%=edto.getEposter()%>" width="100%">
			</td>
			<td valign="top">
				<a id="content1"><%=edto.getEname()%></a><br><br>
				<a id="content2"><%=edto.getEinfor()%></a><br>
				<div style="padding:12px"></div>
				<a id="content3">전시 장소</a>&emsp;<a id="content4"><%=edto.getEplace()%></a><br>
				<a id="content3">전시 기간</a>&emsp;<a id="content4"><%=edto.getEperiod()%></a><br>
				<a id="content3">담당 부서</a>&emsp;<a id="content4"><%=edto.getEdepart()%></a><br>
				<div style="padding:12px"></div>
				<input type="button" id="submit_reser" value="예약하기" onClick="location.href='exhibitionReservation.jsp?enum=<%=exhnum%>'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="main_bottom.jsp"%>