<%@page import="java.text.DecimalFormat"%>
<%@page import="admin.ShopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shopMenuContent.jsp -->
<%@ include file="shop_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.all {
		width: 80%;
		font-family: 'Noto Sans KR', sans-serif;
		margin: auto;
	}
	.all table	{
		width: 100%;
		margin: auto;
		border-collapse: collapse;
		table-layout: fixed;
	}
	.all td	{
		width: 25%;
		padding: 2%;
		border: 0px solid black;
		vertical-align: top;
		padding-top: 5%;
	}
	.all td	a {
		color: #000;
		text-decoration-line: none;
	}
	.all td img {
		width: 100%;
		border: 1px solid #F2F2F2;
	}
	#price {
		font-size: 18px;
		font-weight: 500;
	}
	#goodsName {
		font-size: 20px;
		font-weight: 500;
	}
</style>
<%
	String gcategory = request.getParameter("gcategory");
	System.out.println(gcategory);

	ShopDAO sdao = ShopDAO.getInstance();
	ArrayList<ShopDTO> lists = sdao.getGoodsByCtgr(gcategory);
	DecimalFormat df = new DecimalFormat("###,###");
%>
<div class="all">
<table>
	<tr>
<%
		int count = 0;
		for(ShopDTO sdto : lists) {
			count++;
%>
		<td>
			<a href="shopContent.jsp?gnum=<%=sdto.getGnum()%>&gqty=<%=sdto.getGqty()%>">
				<img src="<%=request.getContextPath()%>/images/<%=sdto.getGposter()%>">
			</a>
			<div style="padding:5px"></div>
			<a id="price"><%=df.format(Integer.parseInt(sdto.getGprice()))%>원</a><br>
			<a id="goodsName" href="shopContent.jsp?gnum=<%=sdto.getGnum()%>&gqty=<%=sdto.getGqty()%>">
				<%=sdto.getGname()%>
			</a>
		</td>
<%
			if(count % 4 == 0) {
				out.println("</tr><tr>");
			} //if
		} //for
		if((count%4) < 4) {
			for(int i=0; i<4-(count%4); i++) {
				out.println("<td></td>");
			}
		} 
%>
	</tr>
</table>
</div>
<div style="padding:100px"></div>
<%@ include file="main_bottom.jsp"%>