<%@page import="java.text.DecimalFormat"%>
<%@page import="admin.ShopDTO"%>
<%@page import="admin.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shopAll.jsp -->
<%@ include file="shop_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.shopContent {
		width: 80%;
		font-family: 'Noto Sans KR', sans-serif;
		margin: auto;
	}
	.shopContent table	{
		width: 90%;
		margin: auto;
		border-collapse: collapse;
		table-layout: fixed;
	}
	.shopContent td	{
		padding: 2%;
		border: 1px solid #F2F2F2;
		vertical-align: top;
	}
	.shopContent td	a {
		position: relative;
	}
	.shopContent td img {
		width: 100%;
		border: 1px solid #F2F2F2;
	}
	#price {
		font-size: 20px;
		font-weight: 500;
	}
	#goodsName {
		font-size: 40px;
		font-weight: 500;
	}
	#goodsInfor {
		font-size: 20px;
		font-weight: 400;
	}
	#text_qty {
		position: relative;
		width: 45px;
		height: 27px;
	    padding: 6px 10px;
	    font-size: 20px;
		font-weight: 500;
	    color: #212529;
	    border: 0px solid #ced4da;
	    text-align: center;
	    outline: none;
	}
	#submitOrder {
		width: 40%;
		height: 40px;
		border-radius: 4px;
		background: #262626;
		color: #fff;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
		cursor: pointer;
	}
	#submitCart {
		width: 40%;
		height: 40px;
		border-radius: 4px;
		background: #fff;
		color: #262626;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 16;
		font-weight: 500;
		cursor: pointer;
	}
	#qty {
		border-collapse: collapse;
		margin-right: 0px;
		width: 100px;
	}
	#qty td {
		border: 1px solid #E7E6E6;
		padding: 0%;
		text-align: center;
		vertical-align: middle;
	}
	#qtyUpdate {
		width: 25px;
		height: 27px;
		border: 0px;
	    font-size: 20px;
		font-weight: 500;
	    color: #595959;
	    background: #F2F2F2;
	    border-radius: 0px;
	    cursor: pointer;
	}
</style>
<script type="text/javascript">

	function goOrder(gnum,sid) {
		document.goods.action="shopOrder.jsp?gnum="+gnum; 
		document.goods.submit();
	} //goOrder
	
	function goCart(gnum,sid) {
		oqty = goods.oqty.value;
		if(oqty < 1) {
			alert('최소 주문수량은 1개입니다');
			location.reload();
			return;
		}
		location.href = "<%=request.getContextPath()%>/museum/member/mypage_cartAdd.jsp?gnum="+gnum+"&oqty="+oqty;		
	} //goCart
	
</script>
<%
	System.out.println("sid:"+sid);
	String gnum = request.getParameter("gnum");

	ShopDAO sdao = ShopDAO.getInstance();
	ShopDTO sdto = sdao.getGoodsByNum(gnum);
	
	DecimalFormat df = new DecimalFormat("###,###");
%>
<div style="padding:5px"></div>
<div class="shopContent">
<form name="goods" method="post">
<table>
	<tr>
		<td rowspan="3" width="50%"><!-- 상품 이미지 -->
			<img src="<%=request.getContextPath()%>/images/<%=sdto.getGposter()%>">
		</td>
		<td colspan="2"><!-- 상품 이름, 가격, 설명 -->
			<a id="goodsName"><%=sdto.getGname()%></a><br>
			<div style="padding:5px"></div>
			<a id="goodsInfor"><%=sdto.getGinfor()%></a><br>
		</td>
	</tr>
	<tr height="100px">
		<td align="right" width="70%"><!-- 가격, 구매수량 -->
			<a id="price">가격</a>
			<div style="padding:2px"></div>
			<a id="price">구매수량</a>
		</td>
		<td align="right" width="30%">
			<a id="price"><%=df.format(Integer.parseInt(sdto.getGprice()))%>원</a>
			<div style="padding:2px"></div>
			<table id="qty">
				<tr>
					<td width="25px"><input type="button" id="qtyUpdate" value="-" onClick="qtyRemove()"></td>
					<td width="50px"><input type="text" id="text_qty" name="oqty" value="1" maxlength="2"></td>
					<td width="25px"><input type="button" id="qtyUpdate" value="+" onClick="qtyAdd()"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr height="100px">
		<td colspan="2" align="center"><!-- 구매하기, 장바구니 -->
			<input type="button" id="submitOrder" value="구매하기" onClick="goOrder('<%=sdto.getGnum()%>','<%=sid%>')">&emsp;&emsp;
			<input type="button" id="submitCart" value="장바구니" onClick="goCart('<%=sdto.getGnum()%>','<%=sid%>')">
		</td>
	</tr>
</table>
</form>
</div>
<div style="padding:100px"></div>
<%@ include file="../main_bottom.jsp"%>