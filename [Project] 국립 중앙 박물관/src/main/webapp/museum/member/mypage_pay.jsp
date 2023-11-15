<%@page import="museum.MembersDTO"%>
<%@page import="museum.MembersDAO"%>
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
	.mypagePay {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 100px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.OrderIdInfo table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
		border-top: 1px solid #BFBFBF;
		color: #262626;
	}
	.OrderIdInfo td {
		padding: 1%;
		text-align: left;
		border-bottom: 1px solid #D9D9D9;
	}
	.OrderIdInfo td:first-child  {
		width: 12%;
		padding-left: 2%;
		padding-right: 2%;
		font-weight: 500;
		background: #f8f9fa;
	}
	.OrderIdInfo tr:last-child td {
		border-bottom: 1px solid #BFBFBF;
	}
	.OrderIdInfo td[colspan="2"] {
		background: none;
		color: #000;
		font-weight: 600;
		border-bottom: 1px solid #BFBFBF;
	}
	.OrderGoodsInfo table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
		border-bottom: 1px solid #BFBFBF;
		color: #262626;
	}
	.OrderGoodsInfo td {
		padding: 1%;
		border-bottom: 0px solid #BFBFBF;
		border: 0px solid #BFBFBF;
	}
	.OrderGoodsInfo th {
		height: 30px;
		border-top: 1px solid #BFBFBF;
		border-bottom: 1px solid #D9D9D9;
		background: #f8f9fa;
	}
	.OrderGoodsInfo td:first-child {
		width: 10%;
		text-align: center;
	}
	.OrderGoodsInfo td[colspan="5"] {
		background: none;
		color: #000;
		font-weight: 600;
		padding-left: 2%;
		border-top: 1px solid #BFBFBF;
		border-bottom: 1px solid #BFBFBF;
		text-align: left;
	}
	.OrderGoodsInfo td img {
		width: 100%;
	}
	#text_order {
	    padding: 6px 10px;
	    font-size: 16px;
	    font-weight: 400;
	    color: #212529;
	    border: 1px solid #ced4da;
	    border-radius: 2px;
	    outline: none;
	}
	.orderPay table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
		border-top: 1px solid #BFBFBF;
		color: #262626;
	}
	.orderPay td {
		padding: 1%;
		padding-left: 2%;
		padding-right: 2%;
		border-bottom: 1px solid #D9D9D9;
	}
	.orderPay td:first-child  {
		width: 14%;
		font-weight: 500;
		background: #f8f9fa;
		text-align: left;
	}
	.orderPay tr:last-child td {
		border-bottom: 1px solid #BFBFBF;
	}
	.orderPay td[colspan="2"] {
		background: none;
		color: #000;
		font-weight: 600;
		border-bottom: 1px solid #BFBFBF;
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
<hr>
<jsp:useBean id="Cart" class="museum.CartDTO" scope="session"/>
<%
	ArrayList<ShopDTO> clists = Cart.getAllGoods();
	DecimalFormat df = new DecimalFormat("###,###");
	
/* 	MembersDAO mdao = MembersDAO.getInstance();
	MembersDTO mdto = mdao.getMembersById(sid); */
%>
<div class="mypagePay">
<a style="font-size:50; font-weight:500;">결제하기</a>
<form action="mypage_payProc.jsp" method="post">
<div class="orderIdInfo">
<div style="padding:30px"></div>
<table>
	<tr>
		<td colspan="2">주문자 정보</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" id="text_order" name="name" style="width:100px" value="<%=mdto.getName()%>" disabled></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>
			<input type="text" id="text_order" name="hp1" style="width:70px" value="<%=mdto.getHp1()%>" disabled>&nbsp;
			<input type="text" id="text_order" name="hp2" style="width:70px" value="<%=mdto.getHp2()%>" disabled>&nbsp;
			<input type="text" id="text_order" name="hp3" style="width:70px" value="<%=mdto.getHp3()%>" disabled>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" id="text_order" name="email" style="width:224px" value="<%=mdto.getEmail()%>" disabled></td>
	</tr>
	<tr>
		<td>배송지</td>
		<td>
			우편번호&ensp;<input type="text" id="text_order" name="zipcode" style="width:70px" value="<%=mdto.getZipcode()%>" disabled>&ensp;&ensp;
			주소1&ensp;<input type="text" id="text_order" name="address1" style="width:200px" value="<%=mdto.getAddress1()%>" disabled>&ensp;&ensp;
			주소2&ensp;<input type="text" id="text_order" name="address2" style="width:330px" value="<%=mdto.getAddress2()%>" disabled>
		</td>
	</tr>
	<tr>
		<td>배송 메모</td>
		<td><input type="text" id="text_order" name="omemo" style="width:800px"></td>
	</tr>
</table>
</div>
<div class="OrderGoodsInfo">
<div style="padding:30px"></div>
<table>
	<tr>
		<td colspan="5">주문상품</td>
	</tr>
	<tr>
		<th width="10%">번호</th>
		<th colspan="2">상품명</th>
		<th width="15%">수량</th>
		<th width="15%">금액</th>
	</tr>
	<%
		int totalPrice = 0;
		for(int i=0; i<clists.size(); i++) {
			int price = clists.get(i).getGqty()*Integer.parseInt(clists.get(i).getGprice());	
	%>
	<tr>
		<td><%=i+1%></td>
		<td width="15%"><img src="<%=request.getContextPath()%>/images/<%=clists.get(i).getGposter()%>"></td>
		<td style="font-weight:500"><%=clists.get(i).getGname()%><input type="hidden" name="gnum" value="<%=clists.get(i).getGnum()%>"></td>
		<td align="center"><%=clists.get(i).getGqty()%></td>
		<td align="center"><%=df.format(price)%></td>
	</tr>
	<%
			totalPrice += price;
		}
		int deliveryFee = 0;
		if(clists.size() != 0 && totalPrice < 30000) {
			deliveryFee = 3000;
		}
	%>
</table>
</div>
<div style="padding:30px"></div>
<div class="orderPay">
	<table>
		<tr>
			<td colspan="2">결제상세</td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td>
				<input type="radio" id="radio" name="pay" value="신용카드">신용카드&ensp;
				<input type="radio" id="radio" name="pay" value="휴대폰">휴대폰&ensp;
				<input type="radio" id="radio" name="pay" value="계좌이체">계좌이체			
			</td>
		</tr>
		<tr>
			<td>주문금액</td>
			<td align="right"><%=df.format(totalPrice)%>원</td>
		</tr>
		<tr>
			<td>배송비</td>
			<td align="right"><%=df.format(deliveryFee)%>원</td>
		</tr>
		<tr>
			<td>최종결제금액</td>
			<td align="right">
				<a style="font-size:x-large; font-weight:500; color:#F2B300;"><%=df.format(totalPrice+deliveryFee)%></a>
				<a style="color:#262626;">&nbsp;원</a>
			</td>
		</tr>
	</table>
</div>
	<div style="padding:25px"></div>
	<input type="submit" id="order" value="결제하기">
</form>
</div>
<%@ include file="../main_bottom.jsp"%>