<%@page import="admin.ShopDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- exhibition_input.jsp -->

<%
	String configFolder = config.getServletContext().getRealPath("/images/");
	
	int maxSize = 1024*1024*5;
	String encoding="UTF-8";
	
	String msg = "";
	
	try{
		MultipartRequest mr = new MultipartRequest(request,
									  configFolder,
									  maxSize,
									  encoding
									  );
	
		ShopDAO sdao = ShopDAO.getInstance();
		int cnt = sdao.insertGoods(mr); 
		
		if(cnt == 1) {
			msg = "상품 등록 성공";
		} else {
			msg = "상품 등록 실패";
		}
	} catch(Exception e) {
	}
%>
<script type="text/javascript">
	alert="<%=msg%>";
	location.href="shop_list.jsp";
</script>