<%@page import="museum.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	BoardDAO bdao = BoardDAO.getInstance();
%>
<jsp:useBean id="bdto" class="museum.BoardDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<%
	bdto.setReg_date(new Timestamp(System.currentTimeMillis()));
	bdto.setIp(request.getRemoteAddr());
	
	int cnt = bdao.replyArticle(bdto);
	
	String msg = "작성 실패";
	String url="mypage_serviceReplyForm.jsp?ref="+bdto.getRef()+"&re_step="+bdto.getRe_step()+"&re_level="+bdto.getRe_level()+"&pageNum="+pageNum;
	
	if(cnt == 1){
		msg = "작성 성공";
		url = "mypage_service.jsp?pageNum="+pageNum;
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>