	
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
	
	console.log($('#addr_general').val());
	$('#user_addr').val(($('#addr_general').val() + ' ' + $('#addr_detail').val()));
}

function idCheck(){
	
	let id = $('#user_id').val();

	$.ajax({
		type: "GET",
		dataType: "json",
		url: "user_join_idcheck.do?user_id=" + id,
		success: function(data){
			if(data.result > 0)
				alert('사용 중인 아이디입니다');
			else
				alert('사용가능한 아이디입니다');
		},
		error: function(){alert('통신실패')}
	});	
}

function emailCheck(){
	
	let email = $('#user_email').val();

	$.ajax({
		type: "GET",
		dataType: "json",
		url: "user_join_emailcheck.do?user_email=" + email,
		success: function(data){
			console.log(data);
			
			if(data.result > 0)
				alert('이미 가입되어있는 이메일입니다');
			else
				alert('사용가능한 이메일입니다');
		},
		error: function(){alert('통신실패')}
	});	
}