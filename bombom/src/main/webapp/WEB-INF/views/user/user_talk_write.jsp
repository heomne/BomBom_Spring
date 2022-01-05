<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화커뮤니티 : 봄봄</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/talk.css?after"/>
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />

	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <script defer src="${pageContext.request.contextPath}/resources/js/write.js"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu3').attr('id', 'on');
			}
		);
		
	</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>

    <div class="jumbotron">
        <div class="textBlock1">
            <span class="main_title">영화수다</span>
            <br>
            <span class="sub_title">봄봄인들의 수다공간</span> 
        </div>
    </div>

	<div class="container">
        <form>
            <header class="write_header">
                <h2>영화수다 : 글쓰기</h2>
            </header>
            
            <div class="write_block">
                <div class="title_wrap">
                    <input type="text" id="title" name="title" placeholder="제목을 입력해주세요"/>
                </div>

                <div class="editor_wrap">
                    <div id="editor"></div>
                    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
                </div>
            </div>
            <div class="write_btns">
                <button class="submit_btn" type="button">등록</button>
                <button class="goBack_btn" type="button">뒤로가기</button>
            </div>
        </form>
    </div>
    
    <jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>