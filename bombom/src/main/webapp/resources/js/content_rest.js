function deleteRequest() {
	const $talkNo = document.querySelector('#talkNo');
	
	$.ajax({
		type: "delete",
		url: "/bombom/user_talk.do/" + $talkNo.value,
		data: { "id" : $talkNo.value },
	    success: function (data) {
	    	console.log(data);
		},
	    error: function() {
	        alert('게시판 삭제 중 오류가 발생했습니다.');
	    }
	});
}

function putRequest() {
	const $talkNo = document.querySelector('#talkNo');
	
	$.ajax({
		type: "put",
		url: "/bombom/user_talk.do/" + $talkNo.value,
		data: { "id" : $talkNo.value },
	    success: function (data) {
	    	console.log(data);
		},
	    error: function() {
	        alert('게시판 삭제 중 오류가 발생했습니다.');
	    }
	});
}