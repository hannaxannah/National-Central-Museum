<%@page import="java.text.DecimalFormat"%>
<%@page import="admin.ShopDTO"%>
<%@page import="admin.ExhibitionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="museum.ReservationDTO"%>
<%@page import="museum.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
	.mypageCart {
		margin: auto;
		padding-top: 100px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypageCart table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
		border-bottom: 1px solid #BFBFBF;
		color: #262626;
	}
	.mypageCart td {
		padding: 1%;
		border-bottom: 0px solid #BFBFBF;
		border: 0px solid #BFBFBF;
	}
	.mypageCart td a {
		color: #262626;
		text-decoration-line: none;
	}
	.mypageCart th {
		height: 30px;
		border-top: 1px solid #BFBFBF;
		border-bottom: 1px solid #D9D9D9;
		background: #f8f9fa;
	}
	.mypageCart td:first-child {
		width: 10%;
		text-align: center;
	}
	.mypageCart td img {
		width: 100%;
	}
	#nolists {
		border-right: none;
		text-align: center;
		height: 50px;
	}
	#deleteAll {
		width: 90px;
		height: 30px;
		border: 0px;
		border-radius: 4px;
		background: #E7E6E6;
		color: #262626;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: medium;
		font-weight: 500;
		cursor: pointer;
	}
	#delete {
		width: 50px;
		height: 30px;
		border: 1px solid #E7E6E6;
		border-radius: 4px;
		background: #fff;
		color: #262626;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: medium;
		font-weight: 500;
		cursor: pointer;
	}
	#qty {
		border-collapse: collapse;
	}
	#qty td {
		border: 1px solid #E7E6E6;
		padding: 0%;
		text-align: center;
		vertical-align: middle;
	}
	#qty input[type="text"] {
		width: 40%;
		border: 0px;
		background: #fff;
		padding: 0%;
		text-align: center;
		vertical-align: middle;
		font-size: medium;
	    font-weight: 500;
	    color: #262626;
	}
	#qtyUpdate {
		width: 22px;
		height: 22px;
		border: 0px;
	    font-size: 16px;
	    font-weight: 500;
	    color: #595959;
	    background: #FBFBFB;
	    border-radius: 0px;
	    cursor: pointer;
	}
	.cartPrice {
		margin: auto;
		padding-top: 25px;
		padding-bottom: 200px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.cartPrice table {
		margin: auto;
		width: 60%;
		background: #FBFBFB;
		border-collapse: collapse;
		border-top: 2px solid #A6A6A6;
		border-bottom: 2px solid #A6A6A6;
	}
	.cartPrice td {
		border: 0px solid black;
	}
	#order {
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
<script type="text/javascript">
	function qtyUpdate(type) {
		/* var number = document.getElementById('oqty').innerText; */
		/*var number = $(num).parents("td").find("input[name='gqty']"); */
		var number = document.getElementsByName('gqty').innerText;
		
		if(type == 'add') {
		    number = parseInt(number) + 1;
		  }else if(type == 'remove')  {
		    number = parseInt(number) - 1;
		  }
		document.quertySelector('gqty').innerText = number;
	}
</script>
<hr>
<jsp:useBean id="Cart" class="museum.CartDTO" scope="session"/>
<%
	ArrayList<ShopDTO> clists = Cart.getAllGoods();
	DecimalFormat df = new DecimalFormat("###,###");
%>
<div class="mypageCart">
<a style="font-size:50; font-weight:500;">장바구니</a>
<div style="padding:30px"></div>
<table>
	<tr>
		<td colspan="6" style="text-align:right">
			<input type="button" id="deleteAll" value="전체 삭제" onClick="location.href='mypage_cartDelAll.jsp'">
			<div style="padding:5px"></div>
		</td>
	</tr>
	<tr>
		<th width="10%">번호</th>
		<th colspan="2">상품명</th>
		<th width="15%">수량</th>
		<th width="11%">금액</th>
		<th width="11%">삭제</th>
	</tr>
	<%
		int totalPrice = 0;
		if(clists.size() == 0) {
	%>
	<tr>
		<td id="nolists" colspan="6"><a id="reser3">장바구니에 담은 상품이 없습니다.</a></td>
	</tr>
	<%
		} else {
			for(int i=0; i<clists.size(); i++) {
				int price = clists.get(i).getGqty()*Integer.parseInt(clists.get(i).getGprice());	
	%>
	<tr>
		<td><%=i+1%></td>
		<td width="15%">
			<img src="<%=request.getContextPath()%>/images/<%=clists.get(i).getGposter()%>">
		</td>
		<td style="font-weight:500"><%=clists.get(i).getGname()%></td>
		<td align="center">
			<table id="qty">
				<tr>
					<td width="25%"><input type="button" id="qtyUpdate" value="-" onClick="qtyUpdate('remove')"></td>
					<td width="40%"><input type="text" name="oqty" value="<%=clists.get(i).getGqty()%>" disabled></td>
					<td width="25%"><input type="button" id="qtyUpdate" value="+" onClick="qtyUpdate('add')"></td>
				</tr>
			</table>
		</td>
		<td align="center"><%=df.format(price)%></td>
		<td align="center"><input type="button" id="delete" value="삭제" onClick="location.href='mypage_cartDel.jsp?gnum=<%=clists.get(i).getGnum()%>'"></td><!-- × -->
	</tr>
	<%
				totalPrice += price;
			}
		}
		int deliveryFee = 0;
		if(clists.size() != 0 && totalPrice < 30000) {
			deliveryFee = 3000;
		}
	%>
</table>
</div>
<div class="cartPrice">
	<table>
		<tr>
			<td rowspan="3" align="left" valign="top" width="50%" style="padding:2%; border-right:1px solid #D9D9D9;">
				<a style="font-size:x-large; font-weight:600;">총 주문금액</a>
			</td>
			<td align="left" style="padding-left:2%; padding-top:2%;">
				<a style="font-weight:500; color:#262626;">주문금액</a>
				<div style="padding:5px"></div>
				<a style="font-weight:500; color:#262626;">배송비</a>
			</td>
			<td align="right" style="padding-right:2%; padding-top:2%;">
				<a style="color:#262626;"><%=df.format(totalPrice)%>원</a>
				<div style="padding:5px"></div>
				<a style="color:#262626;"><%=df.format(deliveryFee)%>원</a>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left" style="padding-left:2%; border-bottom:1px solid #D9D9D9;">
				<a style="font-weight:300; color:#A6A6A6;">* 주문금액이 30,000원 이상일 경우 배송비가 무료입니다.</a>
				<div style="padding:30px"></div>
			</td>
		</tr>
		<tr>
			<td align="left" style="padding:2%;">
				<a style="font-size:x-large; font-weight:500;">최종결제금액</a>
			</td>
			<td align="right" style="padding:2%">
				<a style="font-size:x-large; font-weight:500; color:#F2B300;"><%=df.format(totalPrice+deliveryFee)%></a>
				<a style="color:#262626;">&nbsp;원</a>
			</td>
		</tr>
	</table>
	<div style="padding:25px"></div>
	<input type="button" id="order" value="구매하기" onClick="location.href='mypage_pay.jsp'">
</div>
<%@ include file="../main_bottom.jsp"%>