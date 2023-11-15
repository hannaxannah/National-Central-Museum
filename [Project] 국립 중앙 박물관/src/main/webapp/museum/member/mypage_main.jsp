<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.mypage {
		margin: auto;
		padding-top: 100px;
		padding-bottom: 200px;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
	}
	.mypage table {
		margin: auto;
		width: 80%;
	}
	.mypage td {
		padding: 2%;
	}
	#bold1 {
		font-size: 23;
		font-weight: 700;
	}
	#bold2 {
		font-size: 20;
		font-weight: 700;
	}
	#normal {
		font-size: 20;
		font-weight: 400;
	}

</style>
<hr>
<div class="mypage">
<a style="font-size:50; font-weight:500;">마이페이지</a>
<div style="padding:30px"></div>
<table>
	<tr>
		<td>
			<a href="mypage_account.jsp?id=<%=sid%>">
				<img src="<%=request.getContextPath()%>/images/btn_account.png" width="90%">
			</a>
		</td>
		<td>
			<a href="mypage_reservation.jsp">
				<img src="<%=request.getContextPath()%>/images/btn_reservation.png" width="90%">
			</a>
		</td>
		<td>
			<a href="mypage_purchase.jsp">
				<img src="<%=request.getContextPath()%>/images/btn_purchase.png" width="90%">
			</a>
		</td>
		<td>
			<a href="mypage_cart.jsp">
				<img src="<%=request.getContextPath()%>/images/btn_cart.png" width="90%">
			</a>
		</td>
		<td>
			<a href="mypage_service.jsp?pageNum=1">
				<img src="<%=request.getContextPath()%>/images/btn_service.png" width="90%">
			</a>
		</td>
	</tr>
</table>
</div>
<%@ include file="..//main_bottom.jsp"%>