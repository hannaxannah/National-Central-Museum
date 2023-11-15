<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_.jsp -->
<%@ include file="main_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.shopTop {
		width: 80%;
		font-family: 'Noto Sans KR', sans-serif;
		margin: auto;
		position: relative;
	}
	.shop_text {
		color: #fff;
		font-size: 50;
		font-weight: 500;
		position: absolute;
		top: 73%;
		left: 6%;		
	}
	.shop_hr {
		background: #fff;
		width: 85%;
		height: 2px;
		top: 90%;
		left: 3%;
		position: absolute;
	}
	.shopMenu {
		width: 80%;
		font-family: 'Noto Sans KR', sans-serif;
		margin: auto;
	}
	.shopMenu table {
		width: 100%;
		text-align: center;
		background: #F2F2F2;
	}
	.shopMenu td {
		width: 10%;
		height: 40px;
		font-size: 18px;
		font-weight: 500;
		color: #000;
	}
	.shopMenu table a {
		text-decoration-line: none;
		color: #000;
	}

</style>
<div style="padding:5px"></div>
<div class="shopTop">
	<img src="<%=request.getContextPath()%>/images/shop_banner3.jpg">
	<a class="shop_text">뮤지엄&nbsp;샵</a>
	<hr class="shop_hr">
</div>
<div style="padding:2px"></div>
<div class="shopMenu">
<table>
	<tr>
		<td>
			<a id="menuText" href="shopAll.jsp">전체 상품</a>
			&emsp;&emsp;&emsp;|&emsp;&emsp;&emsp;
		<%
			String[] category = {"문구/사무","패션/생활","공예품","박물관 특화상품","특별전시 상품"};
		%>
			<a id="menuText" href="shopMenuContent.jsp?gcategory=<%=category[0]%>">문구/사무</a>
			&emsp;&emsp;&emsp;|&emsp;&emsp;&emsp;
			<a id="menuText" href="shopMenuContent.jsp?gcategory=<%=category[1]%>">패션/생활</a>
			&emsp;&emsp;&emsp;|&emsp;&emsp;&emsp;
			<a id="menuText" href="shopMenuContent.jsp?gcategory=<%=category[2]%>">공예품</a>
			&emsp;&emsp;&emsp;|&emsp;&emsp;&emsp;
			<a id="menuText" href="shopMenuContent.jsp?gcategory=<%=category[3]%>">박물관 특화상품</a>
			&emsp;&emsp;&emsp;|&emsp;&emsp;&emsp;
			<a id="menuText" href="shopMenuContent.jsp?gcategory=<%=category[4]%>">특별전시 상품</a>
		</td>
	</tr>
</table>
</div>