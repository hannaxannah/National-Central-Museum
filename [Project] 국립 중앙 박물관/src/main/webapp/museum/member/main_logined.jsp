<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.simpleInfor {
		padding: 10px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.simpleInfor td{
		padding: 5px;
		vertical-align: middle;
	}
	#bold1 {
		font-size: 23;
		font-weight: 700;
	}
	#bold2 {
		font-size: 20;
		font-weight: 700;
	}
	#normal {
		font-size: 20;
		font-weight: 400;
	}
</style>
<!-- main_logined.jsp<br> -->
<%
	System.out.println("main_logined.jsp?id="+sid);
%>
<img src="<%=request.getContextPath()%>/images/img_main.jpg" width="100%" style="margin-top: 10px">
<div class="simpleInfor">
	<table>
		<tr>
			<td align="right">
				<img src="<%=request.getContextPath()%>/images/ico_main_cont_img_1.png" width="62%">
			</td>
			<td><a id="bold1">관람시간&emsp;</a></td>
			<td>
				<a id="bold2">월/화/목/금/일</a>&emsp;<a id="normal">10:00 ~ 18:00</a>&emsp;
				<a id="bold2">수/토</a>&emsp;<a id="normal">10:00 ~ 21:00&emsp;* 입장 마감은 폐관30분 전까지</a> 
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="<%=request.getContextPath()%>/images/ico_main_cont_img_2.png" width="62%">
			</td>
			<td><a id="bold1">관람료&emsp;</a></td>
			<td>
				<a id="bold2">무료</a>&emsp;<a id="normal">특별 전시는 유료</a>&emsp;
			</td>
		</tr>
	</table>
</div>
<%@ include file="../main_bottom.jsp"%>