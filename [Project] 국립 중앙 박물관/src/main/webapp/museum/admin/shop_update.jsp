<%@page import="admin.ShopCategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ShopCategoryDAO"%>
<%@page import="admin.ShopDTO"%>
<%@page import="admin.ShopDAO"%>
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
	String gnum = request.getParameter("gnum");
	//System.out.println("gnum:"+gnum);

	ShopDAO sdao= ShopDAO.getInstance();
	ShopDTO sdto = sdao.getGoodsByNum(gnum);
%>

<td>
<div class="title">
<a id="title2">뮤지엄 샵 관리</a><br>
</div>
<div class="add">
<form method="post" action="shop_updateProc.jsp"  enctype="multipart/form-data">
<input type="hidden" name="gnum" value="<%=sdto.getGnum()%>">
<a id="title">상품 수정</a>&ensp;
<input type="submit" id="submit" value="수정">
<input type="button" id="submit" value="취소" onClick="location.href='shop_list.jsp'">	
<div style="padding-bottom:10px"></div>
<table cellspacing="0" width="80%" id="AddForm">
	<tr>
		<td>상품 이름</td>
		<td colspan="3"><input type="text" id="text" name="gname" value="<%=sdto.getGname()%>"></td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td>
			<select name="gcategory" id="selectBox">
			<%
				ShopCategoryDAO scdao = ShopCategoryDAO.getInstance();
				ArrayList<ShopCategoryDTO> clists = scdao.getAllShopCategory();
				
				String[] category = new String[clists.size()];
				
				for(int i=0;i<clists.size();i++) {
					category[i] = clists.get(i).getGcname();
				}
				
				for(String s : category) {
			%>
				<option value="<%=s%>" <% if(s.equals(sdto.getGcategory())) { %> selected <% } %>><%=s%></option>
			<%
				}
			%>
			</select>
		</td>
		<td>상품 코드</td>
		<td>
			<input type="text" id="text" name="gcode" value="<%=sdto.getGcode()%>">
		</td>
	</tr>
	<tr>
		<td>상품 가격</td>
		<td><input type="text" id="text" name="gprice" value="<%=sdto.getGprice()%>"></td>
		<td>상품 수량</td>
		<td><input type="text" id="text" name="gqty" value="<%=sdto.getGqty()%>"></td>
		<td>상품 이미지</td>
		<td>
			<%-- <img src="<%=request.getContextPath()%>/images/<%=edto.getEposter()%>" width="150px"> --%>
			<input type="text" id="text" style="width:40%" name="gposter" value="<%=sdto.getGposter()%>">
			<input type="file" name="gposterNew" value="파일 선택">
		</td>
	</tr>
	<tr>
		<td valign="top">전시 설명</td>
		<td colspan="5"><textarea name="ginfor" cols="140" rows="5" style="resize:none"><%=sdto.getGinfor()%></textarea></td>
	</tr>
</table>
</form>
</div>