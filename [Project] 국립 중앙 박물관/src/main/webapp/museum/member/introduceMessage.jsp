<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- visit.jsp -->
<%@ include file="introduce_top.jsp"%>
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
	.titlemessage {
		padding-top: 50px;
		text-align: center;
	}
	#message_bold1 {
		font-size: 35;
		font-weight: 500;
	}
	#message_bold2 {
		font-size: 22;
		font-weight: 400;
	}
	#message_gray {
		color: #595959;
		font-size: 18;
		font-weight: 300;
	}
	.message {
		padding-top: 100px;
		text-align: center;
		padding-bottom: 100px;
	}
	.message table {
		margin: auto;
		text-align: left;
	}
	#message_bold3 {
		font-size: 17;
		font-weight: 400;
	}
	#message_bold4 {
		font-size: 18;
		font-weight: 600;
	}
</style>
<div class="visitMenu">
	<table>
		<tr>
			<td width="36%"></td>
			<td width="14%">
				<a style="text-decoration: underline; text-underline-offset : 5px;">인사말</a>
			</td>
			<td width="14%">
				<a href="introduceDirection.jsp">오시는 길</a>
			</td>
			<td width="36%"></td>
		</tr>
	</table>
</div>
<br>
<div class="titlemessage">
	<hr style="width: 100px; size: 1;">
	<br><br><br>
	<a id="message_bold2">역사와 문화가 살아 숨 쉬고, 과거와 현재, 미래가 공존하는 감동의 공간</a><br>
	<a id="message_bold1"><b style="font-size:40">국립중앙박물관</b>에 오신 것을 환영합니다.</a><br>
	<br><br><br>
	<hr style="width: 100px; size: 1;">
</div>
<div class="message">
<table>
<tr><td>
	<a id="message_bold4">국립중앙박물관 전시실에는 아주 먼 옛날부터 가까운 옛날에 이르기까지 그리고 세계 유산을 포함하여 수많은</a><br>
	<a id="message_bold4">사람들이 남긴 발자취와 전통이 여러분을 기다리고 있습니다.</a><br>
	<div style="padding-bottom:10px;"></div>
	<a id="message_bold3">박물관에 전시된 구석기시대의 손도끼, 삼국시대의 금관과 반가사유상, 고려시대의 청자, 조선시대의 그림과</a><br>
	<a id="message_bold3">글씨는 옛 사람들과 오늘날의 우리를 이어주는 연결고리이자 과거와 현재가 극적으로 만나는 지점이기도 합니다.</a><br> 
	<a id="message_bold3">박물관은 전시를 매개로 시공간을 뛰어넘어 많은 이들이 지녔던 감정과 생각, 꿈과 희망까지도 여러분과 함께</a><br> 
	<a id="message_bold3">나누고 싶습니다.</a><br>
	<div style="padding-bottom:40px;"></div>
	<a id="message_bold4">국립중앙박물관은 좋은 전시의 기본이 되는 소장품의 수집과 보존, 학술조사연구 등 여러 분야에서도 완성도를</a><br> 
	<a id="message_bold4">높이기 위해 노력하고 있습니다.</a><br>
	<div style="padding-bottom:10px;"></div>
	<a id="message_bold3">아울러 국민 여러분의 소리에 귀 기울이고 문화에 대한 바람과 수요를 실현하는 수준 높은 콘텐츠를 생산하기 위해</a><br> 
	<a id="message_bold3">최선을 다 하고 있습니다. 박물관이 갖고 있는 문화 정보와 자산을 나누고 공유하면서 현재에 활력을 불어놓고</a><br> 
	<a id="message_bold3">미래를 빛나게 하는 살아있는 열린 공간입니다.</a><br>
	<div style="padding-bottom:40px;"></div>
	<a id="message_bold4">국립중앙박물관은 우리 문화에 대한 확고한 정체성을 바탕으로 전시와 교류를 활성화함으로써 세계와 소통할 수</a><br> 
	<a id="message_bold4">있도록 더욱 힘쓰겠습니다.</a><br>
	<div style="padding-bottom:10px;"></div>
	<a id="message_bold3">오늘날 한국은 외국인들에게 대중문화와 IT의 강국으로 인식되고 있습니다. 그 원천을 우리의 유구하고 품격 있는</a><br> 
	<a id="message_bold3">문화적 전통에서 찾을 수 있다는 점을 널리 알리고자 합니다. 이와 동시에 보편성을 바탕으로 외국의 다양한 역사와</a><br> 
	<a id="message_bold3">문화를 소개하여 우리의 시야와 지식을 넓히는 일도 게을리 하지 않겠습니다.</a><br>
	<div style="padding-bottom:40px;"></div>
	<a id="message_bold4">국립중앙박물관은 누구나 언제든지 찾아와 머물다 갈 수 있는 휴식의 장소입니다.</a><br>
	<div style="padding-bottom:10px;"></div>
	<a id="message_bold3">모든 것이 급격하게 변하는 현대 사회에서 박물관은 잠시 쉬어가도 되는 곳, 뒤를 돌아다봐도 되는 곳이기도 합니다.</a><br> 
	<a id="message_bold3">찾아오는 분들이 전시를 천천히 감상하면서 정신적 위안을 받거나 진지한 사유와 성찰을 하거나 때로는 상상의</a><br> 
	<a id="message_bold3">나래를 펼쳐 빛나는 영감을 얻을 수 있는 곳이 되기를 희망합니다. 가족이나 이웃과 함께, 또는 나 홀로 여유를</a><br> 
	<a id="message_bold3">누리며 찾아오는 가까운 쉼터인 박물관에서 문화와 일상의 가치를 한껏 느껴 보시기 바랍니다.</a><br>
	<div style="padding-bottom:100px;"></div>
</td></tr>
</table>
	<a id="message_bold4">감사합니다.</a><br>
</div>
<br>

<%@ include file="../main_bottom.jsp"%>