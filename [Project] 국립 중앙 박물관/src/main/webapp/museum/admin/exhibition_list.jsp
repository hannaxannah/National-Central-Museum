<%@page import="admin.ExhibitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_admin_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	td {
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 19;
		font-weight: 400;
		padding: 3px;
	}
	.title,.add,.view {
		padding-top: 20px;
		padding-left: 20px;
	}
	#title {
		font-size: 22;
		font-weight: 500;
	}
	#title2 {
		font-size: 25;
		font-weight: 600;
	}
	#AddForm td:nth-child(odd){
		width: 100px;
		text-align: center;
	}
	#AddForm td:first-child{
		width: 100px;
	}
	#text {
    	border: 1px solid #595959;
    	/* margin: 8px 0; */
    	padding: 4px 10px;
    	font-weight: 300;
    	font-family: 'Noto Sans KR', sans-serif;
	}
	#submit {
		width: 70px;
		height: 30px;
		border-radius: 4px;
		border: 0px;
		background: #E7E6E6;
		color: #000;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
		cursor: pointer;
	}
	.view th {
		font-size: 16;
		font-weight: 400;
	}
	.view td {
		font-size: 16;
		font-weight: 300;
		text-align: center;
		padding: 10px;
	}
	.view td>a {
		color: #000;
		text-decoration-line: none;
	}
</style>
<script type="text/javascript">
	function allDelete() {
		var check = document.list.allcheck.checked;
		alert(check);
		
		var chkObj = document.getElementsByName("selectCheck");
		
		if(document.list.allcheck.checked) { //전체 체크 설정
			for(i=0;i<chkObj.length;i++){
				chkObj[i].checked = true;
			}
		}else { //전체 체크 해제
			for(i=0;i<chkObj.length;i++){
				chkObj[i].checked = false;
			}
		}
	}
	
	function selectDelete() {
		var chkObj = document.getElementsByName("selectCheck");
		flag = false;
		for(i=0;i<chkObj.length;i++) {
			if(chkObj[i].checked){
				flag = true;
			}
		}
		
		if(!flag) { 
			alert('삭제할 체크박스 하나라도 선택하세요');
			return;
		}
		
		document.list.submit(); 
	}
</script>
<td>
<div class="title">
<a id="title2">전시 관리</a><br>
</div>
<div class="add">
<form method="post" action="exhibition_inputProc.jsp"  enctype="multipart/form-data">
<a id="title">전시 등록</a>&ensp;
<input type="submit" id="submit" value="등록">
<input type="reset" id="submit" value="취소">	
<div style="padding-bottom:10px"></div>
<table cellspacing="0" width="80%" id="AddForm">
	<tr>
		<td width="">전시 이름</td>
		<td colspan="5"><input type="text" id="text" name="ename"></td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td><input type="text" id="text" name="ecategory"></td>
		<td width="15%">전시 코드</td>
		<td><input type="text" id="text" name="ecode"></td>
		<td width="15%">전시 포스터</td>
		<td><input type="file" name="eposter" value="파일 선택"></td>
	</tr>
	<tr>
		<td>전시 장소</td>
		<td><input type="text" id="text" name="eplace"></td>
		<td>전시 기간</td>
		<td><input type="text" id="text" name="eperiod"></td>
		<td>담당 부서</td>
		<td><input type="text" id="text" name="edepart"></td>
	</tr>
	<tr>
		<td valign="top">전시 설명</td>
		<td colspan="5"><textarea name="einfor" cols="135" rows="5" style="resize:none"></textarea></td>
	</tr>
</table>
</form>
</div>
<%
	ExhibitionDAO edao = ExhibitionDAO.getInstance();
	ArrayList<ExhibitionDTO> lists = edao.getAllExhibition();
%>
<div class="view">
<form name="list" action="exhibition_deleteProc.jsp" method="post">
<a id="title">전시 목록</a>&ensp;
<input type="button" id="submit" value="조회" onClick="location.reload()">
<input type="button" id="submit" value="삭제" onClick="selectCheck()">
<div style="padding-bottom:10px"></div>
<table border="1" cellspacing="0" width="90%">
	<tr>
		<th><input type="checkbox" name="allCheck" onClick="allDelete()"></th>
		<th>번호</th>
		<th>전시 이름</th>
		<th>카테고리</th>
		<th>전시 코드</th>
		<th>전시 포스터</th>
		<th>전시 장소</th>
		<th>전시 기간</th>
		<th>담당 부서</th>
	</tr>
<%
	for(int i=0; i<lists.size(); i++) {
%>
	<tr>
		<td><input type="checkbox" name="selectCheck" value="<%=lists.get(i).getExhnum()%>">
		<td><%=i+1%></td>
		<td>
			<a href="exhibition_update.jsp?enum=<%=lists.get(i).getExhnum() %>">
				<%=lists.get(i).getEname() %>
			</a>
		</td>
		<td><%=lists.get(i).getEcategory() %></td>
		<td><%=lists.get(i).getEcode() %></td>
		<td><%=lists.get(i).getEposter() %></td>
		<td><%=lists.get(i).getEplace() %></td>
		<td><%=lists.get(i).getEperiod() %></td>
		<td><%=lists.get(i).getEdepart() %></td>
	</tr>
<%
	}
%>
</table>
</form>
</div>
</td>
</tr>
</table>