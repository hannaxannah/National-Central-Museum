<%@page import="admin.ShopDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_updateProc.jsp -->
<%
	String configFolder = config.getServletContext().getRealPath("/images/");
	String gnum = request.getParameter("gnum");
	
	int maxSize = 1024*1024*5;
	String encoding="UTF-8";
	
	String msg = "";
	String url = "";
	
	try{
		MultipartRequest mr = new MultipartRequest(request,
									  configFolder,
									  maxSize,
									  encoding
									  );
	
		String gposter = mr.getParameter("gposter");
		String gposterNew = mr.getFilesystemName("gposterNew");
		String img = null;
		
		if(gposter == null) { 
			if(gposterNew != null)  { //기존이미지X, 새이미지O
				img = gposterNew;
			}
		} else {
			if(gposterNew == null) { //기존이미지O, 새이미지X
				img = gposter;
			} else { //기존이미지O, 새이미지O
				img = gposterNew;
			
				File delFile = new File(configFolder,gposter);
				delFile.delete();
			}
		}
		
		ShopDAO sdao = ShopDAO.getInstance();
		int cnt = sdao.updateGoods(mr, img);
		
		if(cnt == 1) {
			msg = "상품 수정 성공";
			url = "shop_list.jsp";
		} else {
			msg = "상품 수정 실패";
			url = "shop_update.jsp?gnum="+gnum;
		}
	} catch(Exception e) {
	}
%>
<script type="text/javascript">
	alert="<%=msg%>";
	location.href="<%=url%>";
</script>