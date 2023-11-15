<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main_registerProc.jsp -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="museum.MembersDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<%
	System.out.println(mdto.getSmsAgree());
	System.out.println(mdto.getEmailAgree());
	
	//checked:on unchecked:null
	if(mdto.getSmsAgree() == null) {
		mdto.setSmsAgree("no");
	} else if(mdto.getSmsAgree().equals("on")){
		mdto.setSmsAgree("yes");
	}
	
	if(mdto.getEmailAgree() == null) {
		mdto.setEmailAgree("no");
	} else if(mdto.getEmailAgree().equals("on")){
		mdto.setEmailAgree("yes");
	}
	
	MembersDAO mdao = MembersDAO.getInstance();
	int cnt = mdao.insertMembers(mdto);

	String msg;
	String url;

	if (cnt == 1) {
%>
	<script type="text/javascript">
		alert("가입이 성공되었습니다");
		location.href = 'main.jsp';
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		history.go(-1);
	</script>
<%
	}
%>
