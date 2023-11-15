<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.header table a {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20;
		font-weight: 500;
		text-decoration-line: none;
		color: #000;
	}
	.sidebar {
		color: #fff;
		font-family: 'Noto Sans KR', sans-serif;
		padding: 10px;
	}
	#bar_title {
		font-size: 20;
		font-weight: 500;
		text-align: left;
	}
	.sidebar ul {
		font-size: 16;
		font-weight: 300;
		text-align: left;
		list-style: none;
		padding: 0;
	}
	.sidebar li>a {
		color: #fff;
		text-decoration-line: none;
	}
</style>
<div class="header">
<a href="<%=request.getContextPath()%>/museum/main.jsp">
	<img src="<%=request.getContextPath()%>/images/img_logo.png" width="10%">
</a>				
</div>
<hr>
<table width=100%>
	<tr>
		<td width=15% valign="top" bgcolor="#000">
			<div class="sidebar">
				<ul>
					<a id="bar_title">전시 관리</a>
					<li><a href="exhibition_category_list.jsp">전시 카테고리 등록</a></li>
					<li><a href="exhibition_list.jsp">전시 등록</a></li>
				</ul>
				<ul>
					<a id="bar_title">뮤지엄 샵 관리</a>
					<li><a href="shop_category_list.jsp">상품 카테고리 등록</a></li>
					<li><a href="shop_list.jsp">상품 등록</a></li>
				</ul>
				<ul>
					<a id="bar_title">회원 관리</a>
					<li><a href="members_list.jsp">회원 목록</a></li>
					<li><a href="members_reservation_list.jsp">전시 예약 내역</a></li>
					<li><a href="members_order_list.jsp">상품 주문 내역</a></li>
				</ul>
			</div>
		</td>
