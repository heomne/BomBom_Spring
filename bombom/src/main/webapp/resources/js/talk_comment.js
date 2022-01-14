// $user_id talk_like.js에서 이미 선언
const $comment_insert = document.querySelector('#comment_insert');
const $comment_cont = document.querySelector('#comment_cont');
const $cmt_list = document.querySelector('.cmt_list');
const $comment_count = document.querySelector('.comment_count');
const $user_nickname = document.querySelector('#user_nickname');

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
	    	
    		const $comment = document.querySelector('.comment');
    		$comment.innerHTML = '💬' + data.length;

    		let html = "";
	    	
	    	if(data.length > 0) {
	    	
	    		for(let i=0; i<data.length; i++) {
	    			html += '<div class="cmt_unit">';
		    		html += '<div class="cmt_header">';
		    		html += '<input id="comment_no" type="hidden" value="' + data[i].comment_no + '"/>';
		            html += '<strong class="cmt_writer">' + data[i].user_nickname + '</strong>';
		            if(data[i].user_id === $user_id.value && data[i].user_nickname === $user_nickname.value) {
			            html += '<div class="modify_remove">';
			            html += '<button id="update_btn" type="button">수정</a>';
			            html += '<button id="remove_btn" type="button">삭제</a>';
			            html += '</div>';
		            } else if ($user_id.value === 'admin' && $user_nickname.value === '관리자') {
		            	html += '<div class="modify_remove">';
			            html += '<button id="remove_btn" type="button">삭제</a>';
			            html += '</div>';
		            }
		            html += '</div>';	            
		            html += '<div class="hidden">';
		            html += '<textarea cols="50" rows="4" id="comment_cont" name="comment_cont" placeholder="댓글을 입력해주세요">';
		            html += data[i].comment_cont;
		            html += '</textarea>';
		            html += '<div class="cmt_write_btns">';
		            html += '<button type="button" id="comment_update">댓글 수정</button>';
		            html += '</div>';	                 	
		            html += '</div>';
		            html += '<div class="cmt_content">';
		            html += '<span class="cmt_text">';
		            html += data[i].comment_cont;
		            html += '</span>'
		            html += '<div class="cmt_date">';
		            html += '<span class="date">' + dateResolver(data[i].comment_date);
		            if(new Date().getDate() !== parseInt(data[i].comment_date.substring(8, 10))) {
		            	html += '<span class="date_time">' + data[i].comment_date.substring(11, 16) + '</span>';
		            }
		            html += '</span>';
		            html += '</div>';
		            html += '<div class="cmt_btns">';
//		            html += '<button type="button">답글</button>';
//		            html += '<button type="button">👍 +0</button>';
		            html += '</div>';
		            html += '</div>';
		            html += '</div>';
	    		}

	    	} else {
	    		
	    		html += "";
	    		
	    	}
	    	
	    	$cmt_list.innerHTML = html;
    		$comment_count.innerHTML = '(' + data.length + ')';
	  },
	  	error: function(request, status, error) {
		alert(request.status + ", " + request.responseText + ", " + error);
	  }
	});
}

function updateForm(e) {
	
	if(e.target.id === 'update_btn') {
		const parentNode = e.target.parentNode.parentNode.parentNode;
		const $hidden = parentNode.querySelector('.hidden');
		const $cmt_content = parentNode.querySelector('.cmt_content');
		$hidden.className = 'updateForm';
		$cmt_content.className = 'hidden';
		e.target.className = 'hidden';
	}
}

function updateComment(e) {
	
	if(e.target.id === 'comment_update') {
		
		const parentNode = e.target.parentNode.parentNode.parentNode;
		const comment_no = parentNode.querySelector('#comment_no').value;
		const comment_cont = parentNode.querySelector('#comment_cont').value;
		
		let form = {
			"comment_no" : comment_no,
			"comment_cont" : comment_cont
		};
		
		$.ajax({
			type: "POST",
			url: "/bombom/update_comment.do",
			data: form,
			dataType: "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    success: function (data) {
		    	
		    	if(data === 'success') {
		    		alert('댓글이 수정되었습니다.');
		    		loadComments();

		    	} else if (data === 'error') {
		    		alert('에러가 발생했습니다. 잠시후 다시 시도해주세요.');
		    	}
		    	
		    },
		    error: function(request, status, error) {
		    	alert(status + ", " + error);
		    }
		});
	}
}


function deleteComment(e) {
	
	if(e.target.id === 'remove_btn') {
		
		if(confirm('댓글을 삭제하시겠습니까?')) {
		} else {
			return;
		}
		
		const parentNode = e.target.parentNode.parentNode;
		const comment_no = parentNode.querySelector('#comment_no').value;

		$.ajax({
			type: "POST",
			url: "/bombom/delete_comment.do",
			data: { "comment_no" : comment_no },
			dataType: "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    success: function (data) {
		    	
		    	if(data === 'success') {
		    		loadComments();
		    		alert('댓글이 삭제되었습니다.');

		    	} else if (data === 'error') {
		    		alert('에러가 발생했습니다. 잠시후 다시 시도해주세요.');
		    	}
		    	
		    },
		    error: function(request, status, error) {
		    	alert(status + ", " + error);
		    }
		});
		
	}
}

function dateResolver(dateData) {
	
	const year = parseInt(dateData.substring(0, 4));
	const month = parseInt(dateData.substring(5, 7)) - 1;
	const date = parseInt(dateData.substring(8, 10));
	
	const inputDate = new Date(year, month, date);
	const today = new Date();
	
	if(today.getYear() + 1900 !== year) {
		return dateData.substring(0, 10);
	}
	
	if(today.getMonth() !== month) {
		return dateData.substring(5, 10);
	}
	
	if(today.getDate() - date > 7) {
		return dateData.substring(5, 10);
	} else if(today.getDate() - date === 0){
		return dateData.substring(11, 16);
	} else {
		return today.getDate() - date + '일 전';
	}
	
}


$cmt_list.addEventListener('click', deleteComment);
$cmt_list.addEventListener('click', updateForm);
$cmt_list.addEventListener('click', updateComment);
$comment_insert.addEventListener('click', addComment);
window.addEventListener('load', loadComments);
