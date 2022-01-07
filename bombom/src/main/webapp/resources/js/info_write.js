const $submit_btn = document.querySelector(".submit_btn");
const $goBack_btn = document.querySelector(".goBack_btn");

function logging(e) {
  if (confirm("글을 등록하시겠습니까?")) {
    document.postForm.submit();
  }
}


$submit_btn.addEventListener("click", logging);
$goBack_btn.addEventListener("click", fetch_test);