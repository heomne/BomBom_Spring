const editor = new toastui.Editor({
  el: document.querySelector("#editor"),
  height: "500px",
  initialEditType: "wysiwyg",
  placeholder: "내용을 입력해주세요",
  hooks: {
    addImageBlobHook: function (blob, callback) {
      const formData = new FormData();
      formData.append("image", blob);
      const imageURL = imageUpload(formData);
      console.log(imageURL);
      callback(imageURL, "alt text");
    },
  },
});

function imageUpload(formData) {		
  let imageURL;
  
  $.ajax({
	type: "post",
	url: "/bombom/image_upload.do",
	async: false,
	data: formData,
	processData: false,
	contentType: false,
    success: function (data) {
    imageURL = data;
    console.log(imageURL);
  },
    error: function() {
    alert('이미지 업로드 중 에러가 발생했습니다.');
  }
  });
  
  return imageURL;
}




