<%@page import="admin.ShopDTO"%>
<%@page import="admin.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage_cartAdd.jsp -->
<%
	String gnum = request.getParameter("gnum");
	String oqty = request.getParameter("oqty");
%>
<jsp:useBean id="Cart" class="museum.CartDTO" scope="session"/>
<%
	ShopDAO sdao = ShopDAO.getInstance();
	ShopDTO sdto = sdao.getGoodsByNum(gnum);
	
	Cart.addGoods(gnum,oqty);
%>
<script type="text/javascript">
	if(confirm('장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?')) {
		location.href="mypage_cart.jsp";
	} else {
		history.go(-1);
	}
</script>