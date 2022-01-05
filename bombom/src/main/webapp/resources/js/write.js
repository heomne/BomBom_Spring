const $submit_btn = document.querySelector(".submit_btn");
const $goBack_btn = document.querySelector(".goBack_btn");

function logging(e) {
  if (confirm("글을 등록하시겠습니까?")) {
    console.log(editor.getHTML());
  }
}

function fetch_test() {
  editor.setHTML(
    "<p>내용을 입력합니다</p><p><br></p><p>dfdfd</p><p>fdfdf</p><p><br></p><p><br></p><p>dfdfdfdfd</p>"
  );
}

$submit_btn.addEventListener("click", logging);
$goBack_btn.addEventListener("click", fetch_test);
