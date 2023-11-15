<%@page import="admin.ExhibitionDTO"%>
<%@page import="admin.ExhibitionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="museum.ReservationDTO"%>
<%@page import="museum.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.reservation {
		width: 60%;
		margin: auto;
		padding-top: 50px;
		padding-bottom: 10px;
		text-align: center;
		background: #f8f9fa;
		border-radius: 10px;
	}
	.reservation table {
		width: 60%;
		border: 0px solid #000;
		border-collapse: collapse;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.reservation td {
		padding: 1%;
		border: 0px solid #000;
	}
	.reservation td:first-child {
		width: 20%;
		font-size: 19;
		font-weight: 400;
	}
	.reservation td:last-child pre {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15;
		font-weight: 400;
	}
	.reservation td[colspan="2"] {
		color: #595959;
		font-size: 15;
		font-weight: 400;
	}
	#text_reser {
		height: 30px;
	    padding: 6px 9px;
	    font-size: 15px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	}
	#text_reser2 {
		width: 45px;
		height: 30px;
	    padding: 6px 9px;
	    font-size: 15px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	    text-align: right;
	} 
	#text_reser3 {
		width: 80px;
		height: 30px;
	    padding: 6px 9px;
	    font-size: 15px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	    text-align: center;
	}
	#selectBox {
  		width: 100%;
  		height: 30px;
  		border: 1px solid #ced4da;
  		border-radius: 4px;
  		padding-left: 5px;
  		font-family: 'Noto Sans KR', sans-serif;
  		font-weight: 300;
  		font-size: 15;
	}
	#selectBox2 {
  		width: 106px;
  		height: 30px;
  		border: 1px solid #ced4da;
  		border-radius: 4px;
  		padding-left: 5px;
  		font-family: 'Noto Sans KR', sans-serif;
  		font-weight: 300;
  		font-size: 15;
	}
	#submit_reser {
		width: 150px;
		height: 40px;
		border-radius: 4px;
		background: #262626;
		color: #fff;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
	}
	#date {
  		height: 30px;
  		border: 1px solid #ced4da;
  		border-radius: 4px;
  		padding-left: 5px;
  		font-family: 'Noto Sans KR', sans-serif;
  		font-weight: 300;
  		font-size: 15;
	}
</style>
<script type="text/javascript">
	function cancelReser() {
		document.updateReser.condition.value="예약취소";
		
		document.updateReser.submit();
	}
</script>
<hr>
<%
	String rno = request.getParameter("rno");

	ReservationDAO rdao = ReservationDAO.getInstance();
	ReservationDTO rdto = rdao.getReservationByNo(rno);
%>
<div style="padding:50px"></div>
<div class="reservation">
<form name="updateReser" action="mypage_reservationUpdateProc.jsp" method="post">
<input type="hidden" name="rno" value="<%=Integer.parseInt(rno)%>">
<input type="hidden" name="condition" value="예약완료">
	<table border="1">
		<tr>
			<td colspan="2">관람 정보<hr></td>
		</tr>
		<tr>
			<td>프로그램</td>
			<td><%=rdto.getProgram()%></td>
		</tr>
		<tr>
			<td>관람 일자</td>
			<td><input type="date" name="rdate" id="date" max="2025-12-31" min="2023-01-01" value="<%=rdto.getRdate()%>"></td>
		</tr>
		<tr>
			<td>관람 시간</td>
			<td>
				<select name="rtime" id="selectBox2">
				<%
					String[] etime = {"10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00"};
				
					for(String s : etime) {
				%>
					<option value="<%=s%>" <% if(s.equals(rdto.getRtime())) { %> selected <% } %>><%=s%></option>	
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td valign="top">관람 인원</td>
			<td>
				<pre>성인		<input type="text" id="text_reser2" name="adult" value="<%=rdto.getAdult()%>"> 명</pre>
				<pre>초등학생	<input type="text" id="text_reser2" name="junior" value="<%=rdto.getJunior()%>"> 명</pre>
				<pre>영유아		<input type="text" id="text_reser2" name="toddler" value="<%=rdto.getToddler()%>"> 명</pre>
			</td>
		</tr>
		<tr>
			<td colspan="2"><div style="padding-top:20px"></div>예약자 정보<hr></td>
		</tr>
		<tr>
			<td>예약자 이름</td>
			<td><input type="text" id="text_reser" name="rname" value="<%=rdto.getRname()%>"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>
				<input type="text" id="text_reser3" name="hp1" value="<%=rdto.getHp1()%>">
				<input type="text" id="text_reser3" name="hp2" value="<%=rdto.getHp2()%>">
				<input type="text" id="text_reser3" name="hp3" value="<%=rdto.getHp3()%>">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" id="text_reser" name="email" value="<%=rdto.getEmail()%>"></td>
		</tr>
	</table>
	<div style="padding:40px"></div>
	<input type="submit" id="submit_reser" value="예약수정">
	&emsp;
	<input type="button" id="submit_reser" value="예약취소" onClick="cancelReser()">
</form>
</div>
<div style="padding:70px"></div>
<%@ include file="../main_bottom.jsp"%>