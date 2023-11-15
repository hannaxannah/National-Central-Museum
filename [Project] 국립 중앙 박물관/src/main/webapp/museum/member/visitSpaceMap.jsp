<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- visit.jsp -->
<%@ include file="visit_top.jsp"%>
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
	.visitInfor table {
		width: 70%;
		margin: auto;
		border-top: 2px solid #000;
		border-bottom: 2px solid #000;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.visitInfor td {
		padding: 30px;
		padding-top: 30px;
		padding-bottom: 50px;
		border-bottom: 1px solid #D9D9D9;
	}
	.visitInfor td:first-child {
		width: 30%;
		border-right: 1px solid #D9D9D9;
	}
	.visitInfor tr:last-child>td:first-child,tr:last-child>td:last-child {
		border-bottom: 0px;
	}
	#bold1 {
		font-size: 23;
		font-weight: 500;
	}
	#bold2 {
		font-size: 20;
		font-weight: 500;
	}
	#normal {
		font-size: 20;
		font-weight: 300;
	}
	.map {
		padding-top: 50px;
	}
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="29%"></td>
			<td width="14%">
				<a href="visitInfor.jsp">관람 안내</a>
			</td>
			<td width="14%">
				<a href="visitGuidedTour.jsp">전시 해설</a>
			</td>
			<td width="14%">
				<a  style="text-decoration: underline; text-underline-offset : 5px;">시설 안내</a>
			</td>
			<td width="29%"></td>
		</tr>
	</table>
</div>
<br>
<div class="map">
	<table width="70%" align="center">
		<tr>
			<td align="left">
				<a id="bold1">&emsp;<b>전시 및 야외 시설</b></a>
				<hr style="height:2; background:#000;">
			</td>
		</tr>
		<tr>
			<td>
				<img src="<%=request.getContextPath()%>/images/m_bg_fullmap_img_1.jpg" width="100%">
			</td>
		</tr>
		<tr>
			<td style="padding:50px"></td>
		</tr>
		<tr>
			<td align="left">
				<a id="bold1">&emsp;<b>휴게 공간</b></a>
				<hr style="height:2; background:#000;">
			</td>
		</tr>
		<tr>
			<td>
				<img src="<%=request.getContextPath()%>/images/bg_restaurant_img_1.jpg" width="100%">
			</td>	
		</tr>
		<tr>
			<td style="padding:50px"></td>
		</tr>
		<tr>
			<td align="left">
				<a id="bold1">&emsp;<b>식당</b></a>
				<hr style="height:2; background:#000;">
			</td>
		</tr>
		<tr>
			<td>
				<img src="<%=request.getContextPath()%>/images/bg_restaurant_img_2.jpg" width="100%">
			</td>	
		</tr>
		<tr>
			<td style="padding:50px"></td>
		</tr>
		<tr>
			<td align="left">
				<a id="bold1">&emsp;<b>카페/기타</b></a>
				<hr style="height:2; background:#000;">
			</td>
		</tr>
		<tr>
			<td>
				<img src="<%=request.getContextPath()%>/images/bg_restaurant_img_3.jpg" width="100%">
			</td>	
		</tr>
		<tr>
			<td style="padding:50px"></td>
		</tr>
	</table>
</div>

<%@ include file="../main_bottom.jsp"%>