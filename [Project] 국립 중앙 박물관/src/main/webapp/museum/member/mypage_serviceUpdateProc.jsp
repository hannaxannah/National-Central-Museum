<%@page import="museum.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bdto" class="museum.BoardDTO"/>
<jsp:setProperty property="*" name="bdto"/>

<%
	BoardDAO bdao = BoardDAO.getInstance();
	String pageNum = request.getParameter("pageNum");
	System.out.println("[updateProc] pageNum:"+pageNum);
	
	int cnt = bdao.updateArticle(bdto);
	
	String url;
	
	if (cnt == 1) {
%>
	<script type="text/javascript">
		alert("수정이 완료되었습니다.");
		location.href="mypage_service.jsp?pageNum=<%=pageNum%>";
	</script>
<%
	} else {
%>
	<script>
		alert("비밀번호가 일치하지 않습니다");
		<%-- location.href = "updateForm.jsp?num=+<%=bb.getNum()%>"; --%>
		history.go(-1);
	</script>
<%
	}
%>
