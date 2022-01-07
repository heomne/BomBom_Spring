const $submit_btn = document.querySelector(".submit_btn");
const $goBack_btn = document.querySelector(".goBack_btn");
const $editor = document.querySelector("#editor");

function submitPost(e) {
  if (confirm("글을 등록하시겠습니까?")) {
	const $cont = document.querySelector('#contValue');
	$cont.value = editor.getHTML();
	console.log($cont.value);
    document.postForm.submit();
  }
}

$submit_btn.addEventListener("click", submitPost);