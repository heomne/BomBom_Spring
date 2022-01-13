<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_news.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/notice_cont.css?after">
	
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<script defer src="${pageContext.request.contextPath}/resources/js/write.js"></script>
	 
	<script>
	
	
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu0').attr('id', 'on');
			}
		);
		
	</script>
	
	<style>
	
		.write_btns {
			text-align: center;
			margin-bottom: 50px;
		}
		
		.submit_btn{
			margin-top:20px;
			padding : 10px 30px;
			color: #fff;
			background-color: #fb4357;
			border-style: none;
			cursor: pointer;
			font-size : 15px;
		}
	
	
	</style>


</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">봄봄소식</span>
	        <br>
	        <span class="sub_title">커뮤니티 봄봄의 새로운 소식들을 담은 공간</span> 
	    </div>
    </div>
    
    
    
    
    <div align="center">
    	
    	<form method="post" name="postForm"
    	action="<%=request.getContextPath() %>/admin_notice_write_ok.do">
    		<input type="hidden" name="news_writer" value="관리자" >
    	
    		
    	
    		
    		<table>	
    			<tr>
    				
    				<td>
		    			<div class="title_wrap">
		                    <input type="text" class="title" name="news_title" placeholder="제목을 입력해주세요"/>
		                </div>
                	</td>
    			</tr>
    			
    			<tr>
    				
    				<td>
    				
    		<div class="write_block">
                

                <div class="editor_wrap">
                    <div id="editor"></div>
                    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
                    <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
                    <input id="contValue" type="hidden" name="news_cont" value=""/>
                </div>
            </div>
            
           		 </td>
    		</tr>
    			
    		</table>
    		<br>
    		
    		<div class="write_btns">
    			<input type="button" class="submit_btn" value="등록">&nbsp;&nbsp;
                
                <button class="submit_btn" type="button" onclick="history.back()">뒤로가기</button>
            </div>
    		
    	
    	</form>
    	
    	
    	
    
    
    </div>
    
    



	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>