<%@page import="admin.ExhibitionDTO"%>
<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_admin_top.jsp"%>
<!-- exhibition_content.jsp -->
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
		width: 100%;
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
<%
	String exhnum = request.getParameter("enum");
	
	ExhibitionDAO edao= ExhibitionDAO.getInstance();
	ExhibitionDTO edto = edao.getExhibitionByNum(exhnum);
%>

<td>
<div class="title">
<a id="title2">전시 관리</a><br>
</div>
<div class="add">
<form method="post" action="exhibition_updateProc.jsp"  enctype="multipart/form-data">
<a id="title"> 전시 수정</a>&ensp;
<input type="submit" id="submit" value="수정">
<input type="button" id="submit" value="취소" onClick="location.href='exhibition_list.jsp'">	
<div style="padding-bottom:10px"></div>
<table cellspacing="0" width="80%" id="AddForm">
	<tr>
		<td>전시 이름</td>
		<td colspan="3"><input type="text" id="text" name="ename" value="<%=edto.getEname()%>"></td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td><input type="text" id="text" name="ecategory" value="<%=edto.getEcategory()%>"></td>
		<td>전시 코드</td>
		<td>
			<input type="text" id="text" name="ecode" value="<%=edto.getEcode()%>" disabled>
			<input type="hidden" id="text" name="ecode" value="<%=edto.getEcode()%>">
		</td>
		<td>전시 포스터</td>
		<td>
			<%-- <img src="<%=request.getContextPath()%>/images/<%=edto.getEposter()%>" width="150px"> --%>
			<input type="text" id="text" style="width:40%" name="eposter" value="<%=edto.getEposter()%>">
			<input type="file" name="eposterNew" value="파일 선택">
		</td>
	</tr>
	<tr>
		<td>전시 장소</td>
		<td><input type="text" id="text" name="eplace" value="<%=edto.getEplace()%>"></td>
		<td>전시 기간</td>
		<td><input type="text" id="text" name="eperiod" value="<%=edto.getEperiod()%>"></td>
		<td>담당 부서</td>
		<td><input type="text" id="text" name="edepart" value="<%=edto.getEdepart()%>"></td>
	</tr>
	<tr>
		<td valign="top">전시 설명</td>
		<td colspan="5"><textarea name="einfor" cols="140" rows="5" style="resize:none"><%=edto.getEinfor()%></textarea></td>
	</tr>
</table>
</form>
</div>