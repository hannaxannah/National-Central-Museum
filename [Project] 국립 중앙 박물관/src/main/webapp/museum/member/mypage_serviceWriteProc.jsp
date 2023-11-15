<%@page import="museum.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	BoardDAO bdao = BoardDAO.getInstance();
%>
<jsp:useBean id="bdto" class="museum.BoardDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<%
	bdto.setReg_date(new Timestamp(System.currentTimeMillis()));
	//System.out.println(new Timestamp(System.currentTimeMillis()));
	bdto.setIp(request.getRemoteAddr());
	
	int cnt = bdao.insertArticle(bdto);
	
	String msg, url;

	if (cnt == 1) {
		msg = "작성이 완료되었습니다.";
		url = "mypage_service.jsp";
	} else {
		msg = "작성이 실패했습니다.";
		url = "mypage_serviceWriteForm.jsp";
	}
%>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>