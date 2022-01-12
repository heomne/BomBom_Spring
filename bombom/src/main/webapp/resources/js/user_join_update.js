	
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
           
            document.getElementById("addr_general").value = data.address;
            document.getElementById("addr_detail").focus();
        }
    }).open({left: '640', top: '200', popupTitle: '봄봄 - 주소 찾기'});
}

//기본주소와 상세주소를 합쳐주는 함수
function addAddr(){
	
	$('#user_addr').val(($('#addr_general').val() + ' ' + $('#addr_detail').val()));
	
	if($('#user_addr') == null){	//입력주소가 없을 시 기존 주소를 입력
		$('#user_addr').val(($('#addr_original')));
	}
}

//비밀번호 비교
function checkPwd(){
	
	if($('#user_pwd').val() == $('#pwd_original').val()){
		return true;
	}else{
		return false;
	}
}

function validate(){
	
	let reg_phone = /^[0-9]{8,13}$/;// 휴대폰 번호 숫자만

	
	if(!reg_phone.test($('#user_phone').val())){
		$('.toast').empty().append('휴대폰 번호는 특수문자를 제외하고 숫자로만 작성해주세요.').fadeIn(500).delay(3000).fadeOut(500);
		$('#user_phone').focus();
		return false;
	}
	
	if(!checkPwd()){
		$('.toast').empty().append('비밀번호가 틀립니다. 다시 입력해주세요.').fadeIn(500).delay(3000).fadeOut(500);
		$('#user_pwd').focus();
		return false;
	}
	
	
	return true;
}
