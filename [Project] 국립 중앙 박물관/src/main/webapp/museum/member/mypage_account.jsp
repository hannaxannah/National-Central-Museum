<%@page import="museum.MembersDTO"%>
<%@page import="museum.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.mypageAccount {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 50px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypageAccountForm{
		width: 65%;
		margin: auto;
		padding-top: 50px;
		padding-bottom: 10px;
		text-align: center;
		background: #f8f9fa;
		border-radius: 10px;
	}
	.mypageAccountForm table {
		width: 80%;
		border: 0px solid #000;
		border-collapse: collapse;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 19;
		font-weight: 400;
	}
	.mypageAccountForm td {
		padding: 15px;
		border: 0px solid #000;
	}
	#register1 {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 50;
		font-weight: 600;
	}
	#register2 {
		text-decoration-line: none;
		font-size: 14;
		font-weight: 400;
		color: #404040;
	}
	#text_register {
	    display: block;
	    width: 40%;
	    padding: 6px 10px;
	    font-size: 16px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	}
	#text_register2 {
	    padding: 6px 10px;
	    font-size: 16px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	}
	#submit_register {
		width: 150px;
		height: 40px;
		border-radius: 4px;
		background: #262626;
		color: #fff;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
	}
</style>
<hr>
<%
	/* MembersDAO mdao = MembersDAO.getInstance();
	MembersDTO mdto = mdao.getMembersById(sid); */
%>
<div class="mypageAccount">
<a style="font-size:50; font-weight:500;">계정 관리</a>
</div>
<div style="padding:30px"></div>
<div class="mypageAccountForm">
<form method="post" action="mypage_accountProc.jsp">
<table>
<tr>
		<td width="18%">이름</td>
		<td>
			<input type="text" id="text_register" name="name" value="<%=mdto.getName()%>" disabled>
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top:19px">아이디</td>
		<td>
			<input type="text" id="text_register" name="id" value="<%=mdto.getId()%>" disabled>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" id="text_register" name="password">
		</td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td>
			<input type="password" id="text_register" name="pwcheck">
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top:19px">연락처</td>
		<td>
			<input type="text" id="text_register2" name="hp1" style="width:15%" value="<%=mdto.getHp1()%>">&nbsp;
			<input type="text" id="text_register2" name="hp2" style="width:15%" value="<%=mdto.getHp2()%>">&nbsp;
			<input type="text" id="text_register2" name="hp3" style="width:15%" value="<%=mdto.getHp3()%>">
			<div style="padding:4px"></div>
			<a id="register2">예약확인 및 로그인 관련정보를 SMS로 전송합니다.</a><br>
			<input type="checkbox" name="smsAgree" <% if(mdto.getSmsAgree().equals("yes")) { %> checked <% } %>>
			<a id="register2">국립중앙박물관 홍보용 문자 수신여부 (알림톡 포함)</a>
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top:15px">주소</td>
		<td colspan="2" style="font-size:18">
			우편번호&ensp;<input type="text" id="text_register2" name="zipcode" style="width:15%" value="<%=mdto.getZipcode()%>">&ensp;&ensp;
			주소1&ensp;<input type="text" id="text_register2" name="address1" style="width:50%" value="<%=mdto.getAddress1()%>">
			<div style="padding:4px"></div>
			주소2&ensp;<input type="text" id="text_register2" name="address2" style="width:80.4%" value="<%=mdto.getAddress2()%>">
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top:17px">이메일</td>
		<td>
			<input type="email" id="text_register2" name="email" style="width:50%" value="<%=mdto.getEmail()%>"><br>
			<input type="checkbox" name="emailAgree" <% if(mdto.getEmailAgree().equals("yes")) { %> checked <% } %>>
			<a id="register2">박물관 소식지를 수신합니다</a>
		</td>
	</tr>
</table>
<div style="padding:40px"></div>
<input type="submit" id="submit_register" value="수정하기">
</form>
</div>
<%@ include file="../main_bottom.jsp"%>