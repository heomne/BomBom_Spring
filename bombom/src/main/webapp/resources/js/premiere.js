// 모달창 열기
function openModal(modalname){
  document.get
  $("#modal").show();
  $("."+modalname).show();
  
  //body 스크롤 방지
  document.body.classList.add("stop-scroll");
}

// 모달창 닫기(검은 바탕 눌러도 닫힐 수 있게)
function closeAllModal(){
  document.get
  $("#modal").hide();
  $(".modal-con").hide();
  //body 스크롤 방지 해제
  document.body.classList.remove("stop-scroll");
}