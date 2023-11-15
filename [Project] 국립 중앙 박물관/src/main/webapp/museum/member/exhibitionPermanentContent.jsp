<%@page import="admin.ExhibitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- exhibitionPermanentContent.jsp -->
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
	.permanentContent {
		padding-top: 100px;
		padding-bottom: 100px;
	}
	.permanentContent table {
		width: 70%;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: left;
	}
	.permanentContent td {
		padding: 1%;
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
				<a  href="exhibitionPermanent.jsp" style="text-decoration: underline; text-underline-offset : 5px;">상설 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionSpecial.jsp">특별 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionReservation.jsp?enum=1">예약하기</a>
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
<div class="permanentContent">
	<table>
		<tr>
			<td align="center" width="50%">
				<img src="<%=request.getContextPath()%>/images/<%=edto.getEposter()%>" width="100%">
			</td>
			<td valign="top">
				<a id="content1"><%=edto.getEname()%></a><br><br>
				<a id="content2"><%=edto.getEinfor()%></a>
				<div style="padding:12px"></div>
			<%
				if(edto.getEname().equals("기증관")) {
			%>
				<a id="content3">전시 해설</a>&emsp;<a id="content4">(수,금) 11:00</a><br>
			<%
				} else {
			%>
				<a id="content3">전시 해설</a>&emsp;<a id="content4">11:00 13:00 15:00</a><br>
			<%
				}
			%>
				<div style="padding:12px"></div>
				<input type="button" id="submit_reser" value="예약하기" onClick="location.href='exhibitionReservation.jsp?enum=<%=exhnum%>'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../main_bottom.jsp"%>