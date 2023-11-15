<%@page import="museum.OrderDAO"%>
<%@page import="admin.ShopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage_payProc.jsp -->
<%	
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="Cart" class="museum.CartDTO" scope="session"/>
<%	
	ArrayList<ShopDTO> clists = Cart.getAllGoods();
	String sid = (String)session.getAttribute("sid");
	
	String omemo = request.getParameter("omemo");
	String pay = request.getParameter("pay");
	String condition = "결제완료";

	OrderDAO odao = OrderDAO.getInstance();
	int cnt = odao.insertOrder(sid, omemo, pay, condition, clists);
	
	String msg, url;
	
	if(cnt >= 0) {
		msg="결제가 완료되었습니다.";
		url="mypage_purchase.jsp";
		Cart.removeAllGoods();
	} else {
		msg="결제가 실패했습니다.";
		url="mypage_cart.jsp";
	}
%>
<script type="text/javascript">
	alert=('<%=msg%>');
	location.href="<%=url%>";
</script>	
