<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="main_top_logined.jsp"%>
<!-- exibition_top.jsp -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.visit {
		position: relative;
	}
	.visit_text {
		color: #fff;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 50;
		font-weight: 500;
		position: absolute;
		top: 73%;
		left: 5%;		
	}
	.visit_hr {
		background: #fff;
		width: 85%;
		height: 2px;
		top: 90%;
		left: 3%;
		position: absolute;
	}
</style>
<div class="visit">
	<img src="<%=request.getContextPath()%>/images/img_room.jpg" width="100%" style="margin-top: 10px">
	<a class="visit_text">전시 안내</a>
	<hr class="visit_hr">
</div>