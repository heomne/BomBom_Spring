<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화커뮤니티 : 봄봄</title>

<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/home.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/premiere_write.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script defer src="${pageContext.request.contextPath}/resources/js/write.js"></script>

	<script>
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu4').attr('id', 'on');
			}
		);
	</script>
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<%-- 가로 배너 --%>
	<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">시사회</span>
	        <br>
	        <span class="sub_title">각종 시사회 정보를 확인하세요</span> 
	    </div>
    </div>	
    
    
	<div class="container">
        <form enctype="multipart/form-data" method="post" name="postForm" 
        	action="${pageContext.request.contextPath}/premiere_update_ok.do">
            
            <header class="write_header">
                <h2>시사회 : 글 수정</h2>
            </header>
            <c:set var="dto" value="${modify }" />
            <div class="write_block">
                <div class="title_wrap">
                <input type="hidden" name="premiere_no" value="${dto.getPremiere_no() }">
	                <table width="100%">
	                	<tr>
	                		<th> 작성자 </th>
	                    	<td> 
	                    		<input type="text" value="관리자" readonly/>
	               			</td>
	               		</tr>
	               		
	                    <tr>
	                		<th> 글 제목 </th>
	                    	<td> 
	                    		<input type="text" id="premiere_title" name="premiere_title" 
	                    			value="${dto.getPremiere_title() }" required="required"/>
	               			</td>
	               		</tr>
	                
	               		<tr>
	                		<th> 썸네일 이미지</th>
	                    	<td> 
	                    		<input type="file" id="premiere_thumbnail" name="thumbnail" 
	                    		accept="image/png, image/jpeg" required="required"/>
	               			</td>
	               		</tr>
	               		
	               		<tr>
	                		<th> 글 요약 </th>
	                    	<td> 
	                    		<textarea id="premiere_summary" name="premiere_summary" style="resize: none;"
	                    		required="required">${dto.getPremiere_summary() }</textarea>
	               			</td>
	               		</tr>
	               		
               		</table>
                </div>
				
				<!-- 글 쓰기 에디터 -->
                <div class="editor_wrap">
                    <div id="editor">${dto.getPremiere_cont() }</div>
                    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
                    <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
                    <input id="contValue" type="hidden" name="premiere_cont" value=""/>
                </div>
            </div>      
            <div class="write_btns">
                <button class="submit_btn" type="button">글 수정</button>
                <button class="goBack_btn" type="button" onclick="history.back()">뒤로가기</button>
            </div>
        </form>
    </div>
    
    
    <jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>