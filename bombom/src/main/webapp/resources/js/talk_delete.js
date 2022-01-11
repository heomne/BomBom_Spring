function delete_post(e) {
	if(confirm('게시글을 삭제할까요?')) {
		
		const $talkNo = document.querySelector('#talkNo');
		
		$.ajax({
			type: "post",
			url: "/bombom/user_delete.do",
			data: { "id" : $talkNo.value },
		    success: function (response) {
		    	if(response == 200) {
		    		alert('게시글이 삭제되었습니다.');
		    		location.replace("/bombom/user_talk.do");
		    	} else if(response == 400) {
		    		alert('잘못된 요청입니다.');
		    		location.replace("/bombom/user_talk.do");
		    	}
		  },
		    error: function() {
		    alert('게시글 삭제 중 에러가 발생했습니다.');
		  }
		});
	}
}