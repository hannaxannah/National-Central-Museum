<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- visit_top.jsp -->
<%@ include file="main_top_logined.jsp"%>
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
		top: 74%;
		left: 5%;		
	}
	.visit_hr {
		background: #fff;
		width: 85%;
		height: 3px;
		top: 90%;
		left: 3%;
		position: absolute;
	}
	#bold1 {
		font-size: 23;
		font-weight: 500;
	}
	#bold2 {
		font-size: 20;
		font-weight: 500;
	}
	#normal {
		font-size: 20;
		font-weight: 300;
	}
</style>
<div class="visit">
	<img src="<%=request.getContextPath()%>/images/img_chaek2.jpg" width="100%" style="margin-top: 10px">
	<a class="visit_text">관람 정보</a>
	<hr class="visit_hr">
</div>