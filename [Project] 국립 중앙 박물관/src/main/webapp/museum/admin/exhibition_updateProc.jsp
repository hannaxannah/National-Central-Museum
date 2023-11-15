<%@page import="java.io.File"%>
<%@page import="admin.ExhibitionDAO"%>
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
	String url = "";
	
	try{
		MultipartRequest mr = new MultipartRequest(request,
									  configFolder,
									  maxSize,
									  encoding
									  );
	
		String eposter = mr.getParameter("eposter");
		String eposterNew = mr.getFilesystemName("eposterNew");
		String img = null;
		
		if(eposter == null) { 
			if(eposterNew != null)  { //기존이미지X, 새이미지O
				img = eposterNew;
			}
		} else {
			if(eposterNew == null) { //기존이미지O, 새이미지X
				img = eposter;
			} else { //기존이미지O, 새이미지O
				img = eposterNew;
			
				File delFile = new File(configFolder,eposter);
				delFile.delete();
			}
		}
		
		ExhibitionDAO edao = ExhibitionDAO.getInstance();
		int cnt = edao.updateExhibition(mr, img);
		
		if(cnt == 1) {
			msg = "전시 수정 성공";
			url = "exhibition_list.jsp";
		} else {
			msg = "전시 수정 실패";
			url = "exhibition_update.jsp";
		}
	} catch(Exception e) {
	}
%>
<script type="text/javascript">
	alert="<%=msg%>";
	location.href="<%=url%>";
</script>