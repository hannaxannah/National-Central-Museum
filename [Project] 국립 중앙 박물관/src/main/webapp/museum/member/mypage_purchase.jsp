<%@page import="java.text.DecimalFormat"%>
<%@page import="admin.ShopDTO"%>
<%@page import="admin.ShopDAO"%>
<%@page import="museum.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="museum.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.mypageReservation {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 200px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypageReservation table {
		margin: auto;
		width: 60%;
		border-collapse: collapse;
		border-top: 1px solid #262626;
	}
	.mypageReservation td {
		padding: 2%;
		border-bottom: 1px solid #BFBFBF;
	}
	.mypageReservation td:first-child {
		width: 10%;
		border-right: 1px solid #BFBFBF;
		text-align: center;
	}
	.mypageReservation td:last-child {
		padding-left: 0px;
	}
	.mypageReservation tr:last-child td {
		border-bottom: 1px solid #262626;
	}
	#nolists {
		border-right: none;
		text-align: center;
		height: 50px;
	}
	#reser1 {
		color: #404040;
		font-size: 16;
		font-weight: 300;
	}
	#reser2 {
		color: #404040;
		font-size: 18;
		font-weight: 500;
	}
	#reser3 {
		color: #404040;
		font-size: 18;
		font-weight: 300; 
		text-decoration-line: none;
	}
	#cancel {
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
</style>
<hr>
<%
	OrderDAO odao = OrderDAO.getInstance();
	ArrayList<OrderDTO> lists = odao.getOrderByMemid(sid);
	
	ShopDAO sdao = ShopDAO.getInstance();
	DecimalFormat df = new DecimalFormat("###,###");
%>
<div class="mypageReservation">
<a style="font-size:50; font-weight:500;">구매 내역</a>
<div style="padding:30px"></div>
<table>
	<%
		if(lists.size()==0) {
	%>
	<tr>
		<td id="nolists" colspan="3"><a id="reser3">구매한 내역이 없습니다.</a></td>
	</tr>
	<%
		}
	
		for(int i=0; i<lists.size(); i++) {
			ShopDTO sdto = sdao.getGoodsByNum(String.valueOf(lists.get(i).getGnum()));
	%>
	<tr>
		<td><a id="reser3"><%=i+1%></a></td>
		<td width="18%"><img src="<%=request.getContextPath()%>/images/<%=sdto.getGposter()%>" width="100%"></td>
		<td>
			<a id="reser2">상품명</a>&emsp;<a id="reser3"><%=sdto.getGname()%></a><br>
			<div style="padding:1px"></div>
			<a id="reser2">구매 개수</a>&emsp;<a id="reser3"><%=lists.get(i).getQty()%></a><br>
			<div style="padding:1px"></div>
			<a id="reser2">결제 금액</a>&emsp;<a id="reser3"><%=df.format(lists.get(i).getAmount())%></a><br>
			<div style="padding:1px"></div>
			<a id="reser2">결제 수단</a>&emsp;<a id="reser3"><%=lists.get(i).getPay()%></a><br>
			<div style="padding:1px"></div>
			<%
				if(lists.get(i).getCondition().equals("결제취소")) {
			%>
			<a id="reser2">상태</a>&emsp;<a id="reser3" style="color:red"><%=lists.get(i).getCondition()%></a><br>
			<%
				} else {
			%>
			<a id="reser2">상태</a>&emsp;<a id="reser3"><%=lists.get(i).getCondition()%></a><br>
			<%
				}
			%>
		</td>
		<td align="right" valign="bottom">
			<input type="button" id="cancel" value="결제취소" onClick="location.href='mypage_purchaseUpdateProc.jsp?orderId=<%=lists.get(i).getOrderId()%>'">
		</td>
	</tr>
	<%
		}
	%>
</table>
</div>
<%@ include file="../main_bottom.jsp"%>