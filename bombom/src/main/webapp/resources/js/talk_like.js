const $like_btn = document.querySelector('#like_btn');
const $user_id = document.querySelector('#user_id');
const $talk_no = document.querySelector('#talk_no');
const $subhead_like = document.querySelector('.info_right .like');

/**
 * class가 like일 때 : ajax로 좋아요 증가시키는 기능 구현
 * class가 like_active 일 때 : ajax로 좋아요 감소시키는 기능 구현
 * session에 유저 id가 없는 경우 = 비로그인상태 > alert 출력
 */

function likeControl() {

	if($user_id.value === "") {
		alert('로그인 후 좋아요 버튼을 누를 수 있습니다.');
		return;
	}
	
	const className = $like_btn.className;
	
	if(className === 'like') {
		addLike();
		return;
	} else if (className === 'like_active') {
		cancelLike()
		return;
	}
}

function addLike() {
	
	$.ajax({
		type: "post",
		url: "/bombom/add_like.do",
		data: { "user_id" : $user_id.value,
				"talk_no" : $talk_no.value },
	    success: function (likeCount) {
	    	$like_btn.className = 'like_active';
	    	$like_btn.innerHTML = '👍' + likeCount;
	    	$subhead_like.innerHTML = '👍' + likeCount;
	  },
	    error: function() {
	    alert('서버 통신 중 오류가 발생했습니다.');
	  }
	});
	
}

function cancelLike() {
	
	$.ajax({
		type: "post",
		url: "/bombom/cancel_like.do",
		data: { "user_id" : $user_id.value,
				"talk_no" : $talk_no.value },
	    success: function (likeCount) {
	    	$like_btn.className = 'like';
	    	$like_btn.innerHTML = '👍  ' + likeCount;
	    	$subhead_like.innerHTML = '👍  ' + likeCount;
	  },
	    error: function() {
	    alert('서버 통신 중 오류가 발생했습니다.');
	  }
	});
	
}

$like_btn.addEventListener('click', likeControl);