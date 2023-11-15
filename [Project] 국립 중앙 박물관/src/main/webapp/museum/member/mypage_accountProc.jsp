<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main_registerProc.jsp -->
<jsp:useBean id="mdto" class="museum.MembersDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<%
	request.setCharacterEncoding("UTF-8");

	String sid = (String)session.getAttribute("sid");

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
	int cnt = mdao.updateMembers(mdto);

	String msg;
	String url;

	if (cnt == 1) {
		msg = "수정을 완료했습니다";
		url = request.getContextPath()+"/museum/member/mypage_main.jsp";
	} else {
		msg = "수정이 실패했습니다";
		url = request.getContextPath()+"/museum/member/mypage_account.jsp?id="+sid;
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href = '<%=url%>';
</script>
