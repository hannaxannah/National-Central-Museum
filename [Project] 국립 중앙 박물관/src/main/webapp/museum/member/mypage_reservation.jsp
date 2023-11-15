<%@page import="admin.ExhibitionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="museum.ReservationDTO"%>
<%@page import="museum.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.mypageReservation {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 200px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypageReservation table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
		border-top: 1px solid #262626;
	}
	.mypageReservation td {
		padding: 2%;
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageReservation td:first-child {
		padding: 2%;
		width: 10%;
		border-right: 1px solid #BFBFBF;
		text-align: center;
	}
	.mypageReservation td:last-child {
		padding-left: 3%;
	}
	.mypageReservation tr:last-child td {
		border-bottom: 1px solid #262626;
	}
	#nolists {
		border-right: none;
		text-align: center;
		height: 50px;
	}
	#reser1 {
		color: #404040;
		font-size: 16;
		font-weight: 300;
	}
	#reser2 {
		color: #404040;
		font-size: 18;
		font-weight: 500;
	}
	#reser3 {
		color: #404040;
		font-size: 18;
		font-weight: 300; 
		text-decoration-line: none;
	}
</style>
<hr>
<%
	ReservationDAO rdao = ReservationDAO.getInstance();
	ArrayList<ReservationDTO> lists = rdao.getReservationById(sid);
	
	String[] date = null;
	
	ExhibitionDAO edao = ExhibitionDAO.getInstance();	
	String rcategory = null;
%>
<div class="mypageReservation">
<a style="font-size:50; font-weight:500;">예약 내역</a>
<div style="padding:30px"></div>
<table>
	<%
		if(lists.size()==0) {
	%>
	<tr>
		<td id="nolists" colspan="2"><a id="reser3">예약된 내역이 없습니다.</a></td>
	</tr>
	<%
		}
	
		for(ReservationDTO rdto : lists) {
			date = rdto.getRdate().split("-");
			rcategory = edao.getCtgrByName(rdto.getProgram());
	%>
	<tr>
		<td><a id="reser3"><%=rdto.getRownum()%></a></td>
		<td>
			<a id="reser1"><%=rcategory%> 관람</a><br>
			<div style="padding:3px"></div>
			<a id="reser2">프로그램</a>&emsp;<a id="reser3" href="mypage_reservationUpdate.jsp?rno=<%=rdto.getRno()%>"><%=rdto.getProgram()%></a><br>
			<div style="padding:1px"></div>
			<a id="reser2">관람일자</a>&emsp;<a id="reser3"><%=date[0]%>년 <%=date[1]%>월 <%=date[2]%>일 <%=rdto.getRtime()%></a><br>
			<div style="padding:1px"></div>
			<a id="reser2">관람인원</a>&ensp;
			<!-- 성인/성인+초등학생/성인+영유아/초등학생 -->
			<%	if(rdto.getToddler()==0) {
					if(rdto.getJunior()==0) { //성인O, 초등학생X, 영유아X
			%>
						<a id="reser3">성인 <%=rdto.getAdult()%></a><br>
			<%
					} else if(rdto.getAdult()==0) { //성인X, 초등학생O, 영유아X
			%>
						<a id="reser3">초등학생 <%=rdto.getJunior()%></a><br>
			<%
					} else { //성인O, 초등학생O, 영유아X
			%>
						<a id="reser3">성인 <%=rdto.getAdult()%> 초등학생 <%=rdto.getJunior()%></a><br>
			<%		
					}
				} else { //성인O, 초등학생O, 영유아O
			%>
						<a id="reser3">성인 <%=rdto.getAdult()%> 초등학생 <%=rdto.getJunior()%> 영유아 <%=rdto.getToddler()%></a><br>
			<%
				}
			%>
			<!-- 
			<div style="padding:1px"></div>
			<a id="reser2">결제금액</a>&emsp;<a id="reser3">6,000</a><br>
			 -->
			<div style="padding:1px"></div>
			<%
				if(rdto.getCondition().equals("예약취소")) {
			%>
			<a id="reser2">상태</a>&emsp;<a id="reser3" style="color:red"><%=rdto.getCondition()%></a><br>
			<%
				} else {
			%>
			<a id="reser2">상태</a>&emsp;<a id="reser3"><%=rdto.getCondition()%></a><br>
			<%
				}
			%>
		</td>
	</tr>
	<%
			date = null;
		}
	%>
</table>
</div>
<%@ include file="../main_bottom.jsp"%>