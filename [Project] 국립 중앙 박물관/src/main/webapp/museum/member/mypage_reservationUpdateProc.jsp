<%@page import="museum.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main_registerProc.jsp -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rdto" class="museum.ReservationDTO"/>
<jsp:setProperty property="*" name="rdto"/>
<%	
	ReservationDAO rdao = ReservationDAO.getInstance();
	int cnt = rdao.updateReservation(rdto);

	String msg;
	String url;

	if (cnt == 1) {
		msg = "예약 수정을 완료했습니다";
		url = "main_logined.jsp";
	} else {
		msg = "예약 수정이 실패했습니다";
		url = "reservationUpdate.jsp?rno="+rdto.getRno();
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = '<%=url%>';
</script>
