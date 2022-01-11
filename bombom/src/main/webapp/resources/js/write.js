const $submit_btn = document.querySelector(".submit_btn");
const $editor = document.querySelector("#editor");

function submitPost(e) {
  if (confirm("글을 등록할까요?")) {
	const $cont = document.querySelector('#contValue');
	$cont.value = editor.getHTML();
	document.postForm.submit();
  }
}

$submit_btn.addEventListener("click", submitPost);