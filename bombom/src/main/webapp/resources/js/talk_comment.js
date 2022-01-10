const $comment_insert = document.querySelector('#comment_insert');
const $comment_cont = document.querySelector('#comment_cont');
const $cmt_list = document.querySelector('.cmt_list');
const $comment_count = document.querySelector('.comment_count');

function addComment() {
	
	if($comment_cont.value === "") {
		alert('등록할 댓글의 내용을 입력해주세요.');
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "/bombom/add_comment.do",
		data: $("#comment_form").serialize(),
		dataType: "text",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    success: function (data) {
	    	if(data === "") {
	    		alert('로그인 후 댓글을 등록할 수 있습니다.');
	    		return;
	    	} else if (data === 'error') {
	    		alert('서버 통신 중 오류가 발생했습니다.');
	    		return;
	    	} else if (data === 'success') {
	    		loadComments();
	    		$comment_cont.value = "";
	    	}
	  },
	    error: function(request, status, error) {
	    	alert(status + ", " + error);
	  }
	});
	
}

function loadComments() {
	
	$.ajax({
		type: "POST",
		url: "/bombom/get_comments.do",
		dataType: "json",
		data: $("#comment_form").serialize(),
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    success: function (data) {
	    	console.log('comments load');
	    	console.log(data);

	    	if(data.length > 0) {
	    		
	    		let html = "";
	    		
	    		for(let i=0; i<data.length; i++) {
	    			html += '<div class="cmt_unit">';
		    		html += '<div class="cmt_header">';
		            html += '<strong class="cmt_writer">' + data[i].user_nickname + '</strong>';
//		            html += '<div class="modify_remove">';
//		            html += '<a href="#modify">수정</a>';
//		            html += '<a href="#remove">삭제</a>';
//		            html += '</div>';
		            html += '</div>';
		            html += '<div class="cmt_content">';
		            html += data[i].comment_cont;
		            html += '<div class="cmt_date">';
		            html += '<span class="date_time">' + data[i].comment_date.substring(10, 16) + '</span>';
		            html += '</div>';
		            html += '<div class="cmt_btns">';
		            html += '<button type="button">답글</button>';
//		            html += '<button type="button">👍 +0</button>';
		            html += '</div>';
		            html += '</div>';
		            html += '</div>';
	    		}
	    		
	    		$cmt_list.innerHTML = html;
	    		$comment_count.innerHTML = '(' + data.length + ')';
	    		
	    	}
	  },
	  	error: function(request, status, error) {
		alert(request.status + ", " + request.responseText + ", " + error);
	  }
	});
}

$comment_insert.addEventListener('click', addComment);
window.addEventListener('load', loadComments);
