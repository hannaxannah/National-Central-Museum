<%@page import="museum.MembersDTO"%>
<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main_loginProc.jsp -->
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MembersDAO mdao = MembersDAO.getInstance();
	MembersDTO mdto = mdao.getMembersInfo(id, password);
	
	String viewPage = null;
	
	if(mdto != null) { //존재한다 = 찾았다 = 등록회원
		String _id = mdto.getId();
		int no = mdto.getNo();
		
		if(_id.equals("admin")) { //관리자 = admin
			viewPage = request.getContextPath()+"/museum/admin/main_admin.jsp";
		} else { //일반사용자
			viewPage = request.getContextPath()+"/museum/member/main_logined.jsp";
		}
		session.setAttribute("sid", id); //sid = hong, admin
		session.setAttribute("sno", no); //sno //로그인한 회원의 번호 //결제할 때 필요
		
	} else { //존재 안한다
		viewPage = request.getContextPath()+"/museum/main_loginForm.jsp";
%>
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다.");
		</script>
<%
	}
%>
<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>