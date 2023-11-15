<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	.registerTitle {
		padding-top: 100px;
		padding-bottom: 50px;
		text-align: center;
	}
	.registerForm {
		width: 65%;
		margin: auto;
		padding-bottom: 10px;
		text-align: center;
		background: #f8f9fa;
		border-radius: 10px;
	}
	.registerForm table {
		width: 80%;
		border: 0px solid #000;
		border-collapse: collapse;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 19;
		font-weight: 400;
	}
	.registerForm td {
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
	#idmessage,#pwmessage,#pwckmessage {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15;
		font-weight: 400;
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
	    outline: none;
	}
	#text_register2 {
	    padding: 6px 10px;
	    font-size: 16px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	    outline: none;
	}
	#idcheck {
		width: 90px;
		height: 30px;
		border: 0px;
		border-radius: 4px;
		background: #E7E6E6;
		color: #262626;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
		font-weight: 500;
		cursor: pointer;
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
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script.js"></script>
<!-- main_registerForm.jsp -->
<hr>
<div class="registerTitle">
<a id="register1">회원가입</a>
</div>
<div class="registerForm">
<br><br><br><br>
<form name="login" method="post" action="main_registerProc.jsp" onSubmit="return writeSave()">
<table>
	<tr>
		<td width="18%">이름</td>
		<td>
			<input type="text" id="text_register" name="name">
		</td>
	</tr>
	<tr>
		<td valign="top">아이디</td>
		<td>
			<input type="text" id="text_register2" name="id">
			<input type="button" id="idcheck" value="중복체크" onClick="duplicate()">
			<span id="idmessage"></span><br>
			<div style="padding:4px"></div>
			<a id="register2">아이디는 4자~12자 이내의 영문과 숫자로 공백 없이 입력하시면 됩니다. 영문 대소문자를 구분하지 않습니다.</a>
		</td>
	</tr>
	<tr>
		<td valign="top">비밀번호</td>
		<td>
			<input type="password" id="text_register2" name="password" onBlur="pwcheck()">
			<span id="pwmessage"></span><br>
			<div style="padding:4px"></div>
			<a id="register2">비밀번호는 영문 소문자/숫자를 조합하여 8~12자 이내로 입력해주세요.</a>
		</td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td>
			<input type="password" id="text_register2" name="passwordCheck" onKeyup="pw2check()">
			<span id="pwckmessage"></span><br>
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top:19px">연락처</td>
		<td>
			<input type="text" id="text_register2" name="hp1"  maxlength="3" style="width:15%">&nbsp;
			<input type="text" id="text_register2" name="hp2"  maxlength="4" style="width:15%">&nbsp;
			<input type="text" id="text_register2" name="hp3"  maxlength="4" style="width:15%">
			<div style="padding:4px"></div>
			<a id="register2">예약확인 및 로그인 관련정보를 SMS로 전송합니다.</a><br>
			<input type="checkbox" name="smsAgree">
			<a id="register2">국립중앙박물관 홍보용 문자 수신여부 (알림톡 포함)</a>
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top:15px">주소</td>
		<td colspan="2" style="font-size:18">
			우편번호&ensp;<input type="text" id="text_register2" name="zipcode" maxlength="5" style="width:15%">&ensp;&ensp;
			주소1&ensp;<input type="text" id="text_register2" name="address1" style="width:50%">
			<div style="padding:4px"></div>
			주소2&ensp;<input type="text" id="text_register2" name="address2" style="width:80.4%">
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top:17px">이메일</td>
		<td>
			<input type="email" id="text_register2" name="email" style="width:50%"><br>
			<input type="checkbox" name="emailAgree">
			<a id="register2">박물관 소식지를 수신합니다</a>
		</td>
	</tr>
</table>
<div style="padding:40px"></div>
<input type="submit" id="submit_register" value="가입하기">
</form>
</div>
<div style="padding:70px"></div>
<%@ include file="main_bottom.jsp"%>
