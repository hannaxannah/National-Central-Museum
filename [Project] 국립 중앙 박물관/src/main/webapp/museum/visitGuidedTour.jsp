<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- visitGuidedTour.jsp -->
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
	.guidedTour {
		padding-top: 50px;
		padding-bottom: 100px;
	}
	.guidedTour table {
		width: 75%;
		margin: auto;
		border-collapse: collapse;
		border-top: 2px solid #000;
		border-bottom: 2px solid #000;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.guidedTour td {
		padding: 15px;
		border-bottom: 1px solid #D9D9D9;
		border-right: 1px solid #D9D9D9;
	}
	.guidedTour td:last-child {
		border-right: none;
	}
	.guidedTour tr:first-child td:last-child {
		border-left: 1px solid #D9D9D9;
	}
	.guidedTour tr:last-child td{
		border-bottom: none;
	}
	.guidedTour tr:first-child, tr:nth-child(2) {
		background: #f8f8f8;
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
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="29%"></td>
			<td width="14%">
				<a href="visitInfor.jsp">관람 안내</a>
			</td>
			<td width="14%">
				<a  style="text-decoration: underline; text-underline-offset : 5px;">전시 해설</a>
			</td>
			<td width="14%">
				<a href="visitSpaceMap.jsp">시설 안내</a>
			</td>
			<td width="29%"></td>
		</tr>
	</table>
</div>
<br>
<div class="guidedTour">
	<table>
		<tr>
			<td rowspan="2"><a id="bold2">해설코스</a></td>
			<td rowspan="2"><a id="bold2">모이는 곳</a></td>
			<td colspan="2"><a id="bold2">정기 해설 시간</a></td>
			<td rowspan="2"><a id="bold2">4월중 해설 없는 시간</a></td>
		</tr>
		<tr>
			<td width="15%"><a id="bold2">월~금</a></td>
			<td width="15%"><a id="bold2">주말 및 공휴일</a></td>
		</tr>
		<tr>
			<td><a id="bold1">선사·고대관</a></td>
			<td><a id="normal">구석기실 앞<br>(101호)</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">-</a></td>
		</tr>
		<tr>
			<td><a id="bold1">중·근세관</a></td>
			<td><a id="normal">고려Ⅰ실 앞<br>(113호)</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal"><font color="#970119">7일 (금, 13:00, 15:00)</font></a></td>
		</tr>
		<tr>
			<td><a id="bold1">서화관</a></td>
			<td><a id="normal">서화Ⅰ실 앞<br>(201호)</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">-</a></td>
		</tr>
		<tr>
			<td><a id="bold1">기증관</a></td>
			<td><a id="normal">이홍근실 앞<br>(205호)</a></td>
			<td><a id="normal">(수,금)<br>11:00</a></td>
			<td><a id="normal">-</a></td>
			<td><a id="normal">-</a></td>
		</tr>
		<tr>
			<td><a id="bold1">조각·공예관</a></td>
			<td><a id="normal">불교조각실 앞<br>(301호)</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">-</a></td>
		</tr>
		<tr>
			<td><a id="bold1">세계문화관</a></td>
			<td><a id="normal">메소포타미아 앞<br>(306호)</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal">11:00<br>13:00<br>15:00</a></td>
			<td><a id="normal"><font color="#970119">11일 (화, 13:00, 15:00)</font></a></td>
		</tr>
	</table>
	<div style="padding:20px; padding-left:15%;">
		<a id="bold2"><font color="#7f7f7f">※ 일정은 매월 변경되며, 박물관 사정에 따라 해설시간은 변경될 수 있습니다. (관람 소요시간: 약 1시간)</font></a>
	</div>
</div>

<%@ include file="main_bottom.jsp"%>