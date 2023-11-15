<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- visit.jsp -->
<%@ include file="introduce_top.jsp"%>
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
	#normal2 {
		font-size: 18;
		font-weight: 300;
		color: #595959;
	}
	.titlemessage {
		padding-top: 50px;
		text-align: center;
	}
	.direction {
		padding-top: 100px;
		padding-bottom: 100px;
	}
	.direction table {
		width: 70%;
		margin: auto;
		border-top: 2px solid #000;
		border-bottom: 2px solid #000;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.direction td {
		padding: 30px;
		padding-top: 30px;
		padding-bottom: 50px;
		border-bottom: 1px solid #D9D9D9;
	}
	.direction td:first-child {
		width: 30%;
		border-right: 1px solid #D9D9D9;
	}
	.direction tr:last-child>td:first-child,tr:last-child>td:last-child {
		border-bottom: 0px;
	}	 
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="36%"></td>
			<td width="14%">
				<a href="introduceMessage.jsp">인사말</a>
			</td>
			<td width="14%">
				<a style="text-decoration: underline; text-underline-offset : 5px;">오시는 길</a>
			</td>
			<td width="36%"></td>
		</tr>
	</table>
</div>
<br>
<div class="direction">
	<table>
		<tr>
			<td valign="top"><a id="bold1">국립중앙박물관 주소</a></td>
			<td>
				<a id="bold2">위치&ensp;</a>
				<a id="normal2">04383 서울시 용산구 서빙고로 137 (용산동6가 168-6)</a><br>
				<div style="padding-bottom:10px"></div>
				<a id="bold2">전화&ensp;</a>
				<a id="normal2">02)2077-9000</a>
			</td>
		</tr>
		<tr>
			<td valign="top"><a id="bold1">지하철</a></td>
			<td>
				<a id="bold2" style="color:#2D74DC">4호선</a>
				<a id="bold2">&ensp;·&ensp;</a>
				<a id="bold2" style="color:#05A59D">경의중앙선(문산-용문)</a><br>
				<div style="padding-bottom:10px"></div>
				<a id="normal2">이촌역 2번출구 방향 '박물관 나들길'⇔박물관 서문</a><br>
				<a id="normal2">이촌역 2번출구⇔박물관 서문</a><br>
				<br>
				<a id="normal2">※ 엘리베이터 이용안내 : 이촌역 1번출구, 이촌역 2번출구 방향 '박물관 나들길' 에 위치</a><br>
				<a id="normal2">※ 나들길 개방시간 : 07:00 ~ 23:00 (휴관시 미개방)</a><br>
				<div style="padding-bottom:30px"></div>
				<a id="bold2" style="color:#0041AA">1호선</a>
				<a id="normal2">&ensp;용산역 하차 -> 경의중앙선 환승 -> 이촌역 하차</a><br>
				<div style="padding-bottom:10px"></div>
				<a id="bold2" style="color:#FF7F14">3호선</a>
				<a id="normal2">&ensp;옥수역 하차 -> 경의중앙선 환승 -> 이촌역 하차</a><br>
				<div style="padding-bottom:10px"></div>
				<a id="bold2" style="color:#9A5E33">6호선</a>
				<a id="normal2">&ensp;삼각지역 환승 -> 이촌역 하차</a><br>
				<div style="padding-bottom:10px"></div>
				<a id="bold2" style="color:#788900">7호선</a>
				<a id="normal2">&ensp;총신대입구(이수)역 환승 -> 이촌역 하차</a><br>
				<div style="padding-bottom:10px"></div>
				<a id="bold2" style="color:#BD9900">9호선</a>
				<a id="normal2">&ensp;동작역 환승 -> 이촌역 하차</a><br>
			</td>
		</tr>
		<tr>
			<td valign="top"><a id="bold1">버스</a></td>
			<td>
				<a id="bold2">간선버스</a>
				<div style="padding-bottom:10px"></div>
				<a id="bold2">400번</a>
				<a id="normal2">&ensp;서빙고동 - 서빙고역1번출구 - <font color="#970119">국립중앙박물관</font>, 용산가족공원 - 이촌역 - 용산세무서 - 용산공고</a>
				<div style="padding-bottom:10px"></div>
				<a id="bold2">502번</a>
				<a id="normal2">&ensp;이수교 - 서빙고역 - <font color="#970119">국립중앙박물관</font>, 용산가족공원 - 이촌역 - 용산세무서 - 용산공고</a>
			</td>
		</tr>
	</table>
</div>
<%@ include file="main_bottom.jsp"%>