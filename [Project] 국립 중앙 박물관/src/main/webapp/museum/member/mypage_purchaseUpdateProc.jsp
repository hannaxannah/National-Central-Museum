<%@page import="museum.OrderDAO"%>
<%@page import="admin.ShopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage_payProc.jsp -->
<%	
	request.setCharacterEncoding("UTF-8");

	String orderId = request.getParameter("orderId");

	OrderDAO odao = OrderDAO.getInstance();
	int cnt = odao.updateOrder(orderId);
	
	String msg, url;
	
	if(cnt >= 0) {
		msg="결제 취소가 완료되었습니다.";
		url="mypage_purchase.jsp";
	} else {
		msg="결제 취소가 실패했습니다.";
		url="mypage_purchase.jsp";
	}
%>
<script type="text/javascript">
	alert=('<%=msg%>');
	location.href="<%=url%>";
</script>	
