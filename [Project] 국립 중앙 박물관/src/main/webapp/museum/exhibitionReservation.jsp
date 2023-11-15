<%@page import="museum.MembersDTO"%>
<%@page import="museum.MembersDAO"%>
<%@page import="admin.ExhibitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- exhibitionReservation.jsp -->
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
		cursor: pointer;
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
	#bold1 {
		font-size: 23;
		font-weight: 500;
	}
	#bold2 {
		font-size: 20;
		font-weight: 500;
	}
</style>
<script type="text/javascript">
	document.getElementById('date').value = new Date().toISOString().substring(0, 10);
</script>
<div class="visitMenu">
	<table>
		<tr>
			<td width="29%"></td>
			<td width="14%">
				<a href="exhibitionPermanent.jsp">상설 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionSpecial.jsp">특별 전시</a>
			</td>
			<td width="14%">
				<a style="text-decoration: underline; text-underline-offset : 5px;">예약하기</a>
			</td>
			<td width="29%"></td>
		</tr>
	</table>
</div>
<%
	String exhnum = request.getParameter("enum");

	ExhibitionDAO edao = ExhibitionDAO.getInstance();
	ArrayList<ExhibitionDTO> lists = edao.getAllExhibition();
	
	String sid = (String)session.getAttribute("sid");
	
	MembersDAO mdao = MembersDAO.getInstance();
	MembersDTO mdto = mdao.getMembersById(sid);
%>
<div style="padding:50px"></div>
<div class="reservation">
<form action="exhibitionReservationProc.jsp" method="post">
<input type="hidden" name="rid" value="<%=sid%>">
	<table border="1">
		<tr>
			<td colspan="2">관람 정보<hr></td>
		</tr>
		<tr>
			<td>프로그램</td>
			<td>
				<select name="program" id="selectBox">
				<%
					String rcategory = null;
				
					for(ExhibitionDTO edto : lists) {
				%>
					<option value="<%=edto.getEname()%>" <% if(edto.getExhnum() == Integer.parseInt(exhnum)) { %> selected 
					<% rcategory = edto.getEcategory(); } %> >[<%=edto.getEcategory()%>]&ensp;<%=edto.getEname()%></option>
				<%
					}
				%>
				</select>
				<input type="hidden" name="rcategory" value="<%=rcategory%>">
			</td>
		</tr>
		<tr>
			<td>관람 일자</td>
			<td><input type="date" name="rdate" id="date" max="2025-12-31" min="2023-01-01"></td>
		</tr>
		<tr>
			<td>관람 시간</td>
			<td>
				<select name="rtime" id="selectBox2">
				<%
					String[] etime = {"10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00"};
				
					for(String s : etime) {
				%>
					<option value="<%=s%>"><%=s%></option>
				<%
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td valign="top">관람 인원</td>
			<td>
				<pre>성인		<input type="text" id="text_reser2" name="adult" value="0"> 명</pre>
				<pre>초등학생	<input type="text" id="text_reser2" name="junior" value="0"> 명</pre>
				<pre>영유아		<input type="text" id="text_reser2" name="toddler" value="0"> 명</pre>
			</td>
		</tr>
		<tr>
			<td colspan="2"><div style="padding-top:20px"></div>예약자 정보<hr></td>
		</tr>
		<tr>
			<td>예약자 이름</td>
			<td><input type="text" id="text_reser" name="rname"></td>
			<!-- 로그인 했을 시, 로그인 정보에서 가져오기 -->
		</tr>
		<tr>
			<td>연락처</td>
			<td>
				<input type="text" id="text_reser3" name="hp1">
				<input type="text" id="text_reser3" name="hp2">
				<input type="text" id="text_reser3" name="hp3">
			</td>
			<!-- 로그인 했을 시, 로그인 정보에서 가져오기 -->
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" id="text_reser" name="email"></td>
			<!-- 로그인 했을 시, 로그인 정보에서 가져오기 -->
		</tr>
	</table>
	<div style="padding:40px"></div>
	<input type="submit" id="submit_reser" value="예약하기">
</form>
</div>
<div style="padding:70px"></div>
<%@ include file="main_bottom.jsp"%>