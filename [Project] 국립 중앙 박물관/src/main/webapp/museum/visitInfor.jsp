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
	.visitInfor {
		padding-top: 50px;
		padding-bottom: 100px;
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
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="29%"></td>
			<td width="14%">
				<a style="text-decoration: underline; text-underline-offset : 5px;">관람 안내</a>
			</td>
			<td width="14%">
				<a href="visitGuidedTour.jsp">전시 해설</a>
			</td>
			<td width="14%">
				<a href="visitSpaceMap.jsp">시설 안내</a>
			</td>
			<td width="29%"></td>
		</tr>
	</table>
</div>
<br>
<div class="visitInfor">
<table>
	<tr>
		<td valign="top"><a id="bold1">관람시간</a></td>
		<td>
			<a id="bold2">월, 화, 목, 금, 일요일</a><a id="normal">: 10:00 ~ 18:00 (입장 마감: 17:30)</a><br>
			<a id="bold2">수, 토요일</a><a id="normal">: 10:00 ~ 21:00 (입장 마감: 20:30)</a><br>
			<a id="normal">* 옥외 전시장(정원)은 오전 7시부터 관람하실 수 있습니다.</a>
		</td>
	</tr>
	<tr>
		<td valign="top"><a id="bold1">휴관일 및 휴실일</a></td>
		<td>
			<a id="bold2">휴관일</a><a id="normal">: 1월1일, 설날(1.22.), 추석(9.29.)</a><br>
			<br>
			<a id="bold2">상설전시관 정기휴실일</a>
			<a id="normal">: 매년 4월, 11월(첫째 월요일)<br>상설전시관 내 특별전시실 휴실<br>기획전시관(특별전시 미운영시 휴실), 야외전시장은 정상 개관</a><br>
			<br>
			<a id="normal">* 2023년 휴실일: 4.3.(월), 11.6.(월)</a>
		</td>
	</tr>
	<tr>
		<td valign="top"><a id="bold1">관람료</a></td>
		<td>
			<a id="bold2">무료</a>&ensp;<a id="normal">상설전시관, 어린이박물관, 무료 특별전시 해당</a><br>
			<a id="bold2">유료</a>&ensp;<a id="normal">유료 특별전시 해당</a><br>
			<br>
			<a id="bold2">관람권 구입하는 곳</a>&ensp;<a id="normal">: 기획전시실 앞 매표소</a><br>
			<br>
			<a id="bold2">관람권 판매시간</a>&ensp;<a id="normal">: 관람 종료 30분 전까지</a><br>
		</td>
	</tr>
	<tr>
		<td valign="top"><a id="bold1">학생단체관람 안내</a></td>
		<td>
			<a id="normal">초·중·고 학생단체(30명 이상)의 박물관 관람은 사전예약제로 운영합니다.<br>(사전예약하지 않은 학생단체는 입장 불가)</a><br>
		</td>
	</tr>
</table>
</div>
<%@ include file="main_bottom.jsp"%>