<%@page import="museum.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardDAO bdao = BoardDAO.getInstance();

	String num = request.getParameter("num");
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	int cnt = bdao.deleteArticle(num, passwd);
	
	if (cnt == 1) { //삭제 성공했을 때
		int pageSize = 5;
		int count = bdao.getArticleCount(); //16-1=>15>3페이지
		int pageCount = count / pageSize + (count%pageSize == 0?0:1);
		
		if(pageNum > pageCount) { //4>3
	response.sendRedirect("mypage_service.jsp?pageNum="+(pageNum-1));
		} else {
	response.sendRedirect("mypage_service.jsp?pageNum="+pageNum);
		}
	} else {
		//response.sendRedirect("updateForm.jsp?num="+bb.getNum());
%>
	<script>
		alert("비밀번호가 일치하지 않습니다");
		<%-- location.href = "updateForm.jsp?num=+<%=bb.getNum()%>"; --%>
		history.go(-1);
	</script>
<%
	}
%>