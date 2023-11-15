<%@page import="admin.ShopCategoryDTO"%>
<%@page import="admin.ShopCategoryDAO"%>
<%@page import="admin.ShopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ShopDAO"%>
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
	#selectBox {
  		width: 100%;
  		height: 30px;
  		border: 1px solid #595959;
  		padding-left: 5px;
  		font-family: 'Noto Sans KR', sans-serif;
  		font-weight: 300;
  		font-size: 15;
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
<td>
<div class="title">
<a id="title2">뮤지엄 샵 관리</a><br>
</div>
<%
	ShopCategoryDAO scdao = ShopCategoryDAO.getInstance();
	ArrayList<ShopCategoryDTO> clists = scdao.getAllShopCategory();
%>
<div class="add">
<form method="post" action="shop_inputProc.jsp"  enctype="multipart/form-data">
<a id="title">상품 등록</a>&ensp;
<input type="submit" id="submit" value="등록">
<input type="reset" id="submit" value="취소">	
<div style="padding-bottom:10px"></div>
<table cellspacing="0" width="80%" id="AddForm">
	<tr>
		<td width="15%">상품 이름</td>
		<td colspan="5"><input type="text" id="text" name="gname" style="width:400px"></td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td>
			<select name="gcategory" id="selectBox">
			<%
				if(clists.size() == 0) {
			%>
				<option value="">카테고리 없음</option>
			<%
				}
				else {
					for(ShopCategoryDTO scdto : clists) {
			%>
				<option value="<%=scdto.getGcname() %>"><%=scdto.getGcname() %></option>
			<%
					}
				}
			%>
			</select>
		</td>
		<td width="10%">상품 코드</td>
		<td colspan="3"><input type="text" id="text" name="gcode"></td>
	</tr>
	<tr>
		<td>상품 가격</td>
		<td><input type="text" id="text" name="gprice"></td>
		<td>상품 수량</td>
		<td><input type="text" id="text" name="gqty"></td>
		<td width="15%">상품 이미지</td>
		<td><input type="file" name="gposter" value="파일 선택"></td>
	</tr>
	<tr>
		<td>상품 설명</td>
		<td colspan="5"><textarea name="ginfor" cols="135" rows="5" style="resize:none"></textarea></td>
	</tr>
</table>
</form>
</div>
<%
	ShopDAO sdao = ShopDAO.getInstance();
	ArrayList<ShopDTO> lists = sdao.getAllGoods();
%>
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
<div class="view">
<form name="list" action="shop_deleteAll.jsp" method="post">
<a id="title"> 상품 목록</a>&ensp;
<input type="button" id="submit" value="조회" onClick="location.reload()">
<input type="button" id="submit" value="삭제" onClick="selectDelete()">
<div style="padding-bottom:10px"></div>
<table border="1" cellspacing="0" width="85%">
	<tr>
		<th><input type="checkbox" id="allCheck" onClick="allDelete()"></th>
		<th>번호</th>
		<th>상품 이름</th>
		<th>카테고리</th>
		<th>상품 코드</th>
		<th>상품 이미지</th>
		<th>상품 가격</th>
		<th>상품 수량</th>
	</tr>
<%
	for(int i=0; i<lists.size(); i++) {
%>
	<tr>
		<td><input type="checkbox" id="selectCheck" value="<%=lists.get(i).getGnum()%>"></td>
		<td><%=i+1%></td>
		<td>
			<a href="shop_update.jsp?gnum=<%=lists.get(i).getGnum()%>">
				<%=lists.get(i).getGname() %>
			</a>
		</td>
		<td><%=lists.get(i).getGcategory() %></td>
		<td><%=lists.get(i).getGcode() %></td>
		<td><%=lists.get(i).getGposter() %></td>
		<td><%=lists.get(i).getGprice() %></td>
		<td><%=lists.get(i).getGqty() %></td>
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