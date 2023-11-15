function writeSave() {
	//아이디, 비번, 이름
	var pwuse;
	
	if($('input[name=name]').val() == "") {
		$('input[name=name]').focus();
		alert("이름이 누락되었습니다");
		return false;
	}
	
	if($('input[name=id]').val() == "") {
		$('input[name=id]').focus();
		alert("아이디가 누락되었습니다");
		return false;
	}
		
	if($('input[name=password]').val() == "") {
		$('input[name=password]').focus();
		alert("비밀 번호가 누락되었습니다");
		return false;
	}
	
	if($('input[name=passwordCheck]').val() == "") {
		$('input[name=passwordCheck]').focus();
		alert("비밀 번호 확인이 누락되었습니다");
		return false;
	}
	
	//if($('input[name=passwordCheck]').val() != $('input[name=password]').val()) {
	if(pwsame == "nosame") {
		alert("비밀 번호가 일치하지 않습니다");
		return false;
	}
	
	if($('input[name=hp1]').val() == "") {
		$('input[name=hp1]').focus();
		alert("연락처가 누락되었습니다");
		return false;
	}
	
	if($('input[name=hp2]').val() == "") {
		$('input[name=hp2]').focus();
		alert("연락처가 누락되었습니다");
		return false;
	}
	
	if($('input[name=hp3]').val() == "") {
		$('input[name=hp3]').focus();
		alert("연락처가 누락되었습니다");
		return false;
	}
	
	if($('input[name=zipcode]').val() == "") {
		$('input[name=zipcode]').focus();
		alert("우편번호가 누락되었습니다");
		return false;
	}
	
	if($('input[name=address1]').val() == "") {
		$('input[name=address1]').focus();
		alert("주소1이 누락되었습니다");
		return false;
	}
	
	if($('input[name=address2]').val() == "") {
		$('input[name=address2]').focus();
		alert("주소2가 누락되었습니다");
		return false;
	}
	
	if($('input[name=email]').val() == "") {
		$('input[name=email]').focus();
		alert("email이 누락되었습니다");
		return false;
	}
} //writeSave

function duplicate() {
	//alert(2);
	checked = true;
	
	if($("input[name=id]").val() == "") {
				$('#idmessage').html("<font color=green>아이디를 입력하세요. </font>");
				$('#idmessage').show();			
	}
	
	$.ajax({
		url: "<%=request.getContextPath()%>/museum/id_check_proc.jsp",
		data: ({
				userid: $('input[name=id]').val()
		}),
		success: function(data){
			if($.trim(data) == 'YES') {
				$('#idmessage').html("<font color=blue>사용 가능한 아이디입니다. </font>");
				$('#idmessage').show();
			} else if($.trim(data) == 'NO') {
				$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다. </font>");
				$('#idmessage').show();
			} else if($.trim(data) == 'NULL') {
				$('#idmessage').html("<font color=green>아이디를 입력하세요. </font>");
				$('#idmessage').show();	
			}
		}
				
	}); //ajax
} //duplicate
		
function keydown() {
	$('#idmessage').css('display','none');
		checked = false; 	
} //keydown

function pwcheck() {
	//alert(3);
	//영문 소문자/숫자 조합 3~8자
	pw = $('input[name=password]').val();
	//올바른형식 : a123
	//잘못된형식 : a1, aaa
	var regexp = /^[a-z0-9]{8,12}$/i; //i:대/소문자/숫자
	//if(pw.search(regexp)==-1) {
	if(!regexp.text(pw)) {
		$('#pwmessage').html("<font color=red>비밀번호 형식이 틀렸습니다.</font>");
		$('#pwmessage').show();
		return;
	} else {
		pwuse = "";
	}
	
	var chk_num = pw.search(/[0-9]/);
	var chk_eng = pw.search(/[a-z]/i); //대/소문자 무시하고 모두
	
	//alert(chk_num+","+chk_eng);
	
	if(chk_num < 0 || chk_eng < 0) {
		alert('비밀번호는 영문자와 숫자의 조합으로 작성하세요');
		$('#pwmessage').html("<font color=red>비밀번호 형식이 틀렸습니다.</font>");
		$('#pwmessage').show();
	}
	
} //pwcheck

function pw2check() { //a123 -> 4번 호출
	//alert('pw2check');
	
	if($('input[name=password]').val() == $('input[name=passwordCheck]').val()) {
		$('#pwckmessage').html("<font color=blue>비밀번호가 일치합니다.</font>");
		$('#pwckmessage').show();
		pwsame = "same";
	} else {
		$('#pwckmessage').html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
		$('#pwckmessage').show();
		pwsame = "nosame";
	}
} //pw2check