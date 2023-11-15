<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	.loginForm {
		padding-top: 100px;
		padding-bottom: 100px;
		text-align: center;
	}
	.loginForm table {
		width: 30%;
		border: 0px solid #000;
		border-collapse: collapse;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20;
		font-weight: 400;
	}
	.loginForm td {
		padding: 10px;
		border: 0px solid #000;
	}
	#login1 {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 50;
		font-weight: 600;
	}
	#login2 {
		text-decoration-line: none;
		font-size: 18;
		font-weight: 300;
		color: #7F7F7F;
	}
	#text_login {
		width: 90%;
		height: 35px;
	    padding: 6px 9px;
	    font-size: 15px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #595959;
	    border-radius: 4px;
	}
	#submit_login {
		width: 150px;
		height: 40px;
		border-radius: 4px;
		border: 0px;
		background: #E7E6E6;
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 18;
		font-weight: 500;
		cursor: pointer;
	}
	.loginMessage {
		width: 60%;
		margin: auto;
		padding: 50px;
		background: #f8f8f8;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20;
		font-weight: 300;
		color: #595959;
	}
	#loginmsg {
		font-size: 25;
		font-weight: 500;
		color: #000; 
	}
</style>
<!-- main_loginForm.jsp -->
<hr>
<div class="loginForm">
<table>
	<tr>
		<td align="right" width="42%">
			<img src="<%=request.getContextPath()%>/images/img_login_login.svg" width="70px">
		</td>
		<td align="left"><a id="login1">로그인</a></td>
	</tr>
</table>
<div style="padding:10px"></div>
<form name="login" method="post" action="main_loginProc.jsp">
<table>
	<tr>
		<td align="right" width="27%">아이디</td>
		<td>
			<input type="text" id="text_login" name="id">
	</tr>
	<tr>
		<td align="right">비밀번호</td>
		<td>
			<input type="password" id="text_login" name="password">
	</tr>
	<tr>
		<td colspan="2" align="center">
			<div style="padding:10px"></div>
			<input type="submit" id="submit_login" value="로그인">
			<div style="padding:10px"></div>
			<a id="login2" href="">아이디 찾기</a>
			<a id="login2">&nbsp;|&nbsp;</a>
			<a id="login2" href="">비밀번호 찾기</a>
			<a id="login2">&nbsp;|&nbsp;</a>
			<a id="login2" href="">회원가입</a>
		</td>
	</tr>
</table>
</form>
</div>
<div class="loginMessage">
	<a id="loginmsg">국립중앙박물관 홈페이지의 회원으로 가입하시면 다음의 혜택을 받으실 수 있습니다.</a><br>
	<div style="padding:15px"></div>
	<a>&nbsp;국립중앙박물관 관련기관의 교육, 행사, 전시 등을 내용으로 메일링 서비스가 제공됩니다.</a><br>
	<div style="padding:8px"></div>
	<a>&nbsp;소장품, 출판물, 기타 자료 정보의 습득이 쉽습니다.</a><br>
	<div style="padding:8px"></div>
	<a>&nbsp;마이페이지를 통해 회원님의 맞춤정보를 제공합니다.</a><br>
	<div style="padding:8px"></div>
	<a>&nbsp;로그인 후 사용하는 서비스에 별도로 개인정보를 입력하실 필요가 없습니다.</a>
</div>
<div style="padding-top:100px"></div>
<%@ include file="main_bottom.jsp"%>
