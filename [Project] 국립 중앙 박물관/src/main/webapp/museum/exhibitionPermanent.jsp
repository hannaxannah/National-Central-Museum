<%@page import="admin.ExhibitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.ExhibitionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- exhibitionPermanent.jsp -->
<%@ include file="exhibition_top.jsp"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
	.visitMenu table {
		color: #FC3;
		background: #000;
		width: 100%;
		border-collapse: collapse;
		border: 0px solid black;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20;
		text-align: center;
	}
	.visitMenu a {
		text-decoration-line: none;
		color: #FC3;
	}
	.visitMenu td {
		padding: 5px;
	}
	.permanent {
		padding-top: 50px;
		padding-bottom: 100px;
	}
	.permanent table {
		width: 90%;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: left;
	}
	.permanent td {
		padding: 1%;
		
	}
	.permanent tr:nth-child(odd) td {
		padding-bottom: 7%;
	}
	#bold1 {
		font-size: 23;
		font-weight: 500;
	}
	#bold2 {
		font-size: 20;
		font-weight: 500;
	}
	#ename {
		font-size: 27;
		font-weight: 500;
		text-decoration-line: none;
		color: #000;
	}
	#permsg1 {
		font-size: 24;
		font-weight: 400;
	}
	#permsg2 {
		font-size: 32;
		font-weight: 600;
	}
	#normal {
		font-size: 20;
		font-weight: 300;
	}
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="29%"></td>
			<td width="14%">
				<a style="text-decoration: underline; text-underline-offset : 5px;">상설 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionSpecial.jsp">특별 전시</a>
			</td>
			<td width="14%">
				<a href="exhibitionReservation.jsp?enum=1">예약하기</a>
			</td>
			<td width="29%"></td>
		</tr>
	</table>
</div>
<br>
<%
	String ecategory = "상설전시";

	ExhibitionDAO edao = ExhibitionDAO.getInstance();
	ArrayList<ExhibitionDTO> lists = edao.getAllExhibitionByCtgr(ecategory);
%>
<div class="permanent">
<table>
	<tr>
		<td colspan="3">
			<a id="permsg1">
			국립중앙박물관의 상설전시장은 <font color="#970119">총 7개의 관과 39개의 실로 구성되어 9,884점의 유물</font>을 전시하여 제공하고 있으며 전시물은 외부전시일정
			<br>및 유물의 보존 상태를 위하여 주기적으로 교체하고 있습니다. 상설 전시장은 <font color="#970119">누구나 무료</font>로 관람하실 수 있습니다.
			</a>
		</td>
	</tr>
<%
/* 
	String[] a = {"1","2","3"};
	String[] b = {"1층","1층","2층","2층","2층","3층","3층"};
	
	for(int i=0;i<a.length;i++) {
	    System.out.println("***"+a[i]+"***");
	    for(int j=0;j<b.length;j++) {
	        if(b[j].contains(a[i])) {
	            System.out.println(b[j]);
	        }
	    }
	}
*/
	String[] floor = {"1","2","3"};
		
	for(int i=0; i<floor.length; i++) {
%>
	<tr>
		<td colspan="3">
			<a id="permsg2">&ensp;<%=floor[i]%>층</a>
			<hr style="height:2; background:#000;">
		</td>
	</tr>
	<tr>
<%
		for(ExhibitionDTO edto : lists) {
%>

<%
			if(edto.getEplace().contains(floor[i])) {
%>
		<td>
			<a href="exhibitionPermanentContent.jsp?enum=<%=edto.getExhnum()%>">
				<img src="<%=request.getContextPath()%>/images/<%=edto.getEposter()%>" width="100%">
			</a>
			<div style="padding:5px"></div>
			<a id="ename" href="exhibitionPermanentContent.jsp?enum=<%=edto.getExhnum()%>"><!-- content.jsp?num=enum -->
				<%=edto.getEname()%>
			</a>
			<div style="padding:5px"></div>
			<%-- <a id="bold2">기간</a>&ensp;<a id="normal"><%=edto.getEperiod()%></a><br> --%>
		</td>
<%
			} //if
%>

<%
		} //for_in
%>
	</tr>
<%
	} //for_out
%>
</table>
</div>
<%@ include file="main_bottom.jsp"%>