<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contents.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Tui_Editor.css" />

	

	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu0').attr('id', 'on');
			}
		);
		
	</script>


</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
		<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">봄봄소식</span>
	        <br>
	        <span class="sub_title">커뮤니티 봄봄의 이모저모를 담은 공간</span> 
	    </div>
    </div>
    
    	<div class="boardArea">
    		<table  width="1000px" border="1" align="center" cellspacing="0">
    		
    			<c:set value="${Cont }" var="dto" />
    			<c:if test="${!empty dto }" >
    			<tr>
    				<th>글제목</th>
    				<td>${dto.getNews_title() }</td>
    			</tr>
    			
    			<tr>
    				<th>작성자</th>
    				<td>${dto.getNews_writer() }</td>
    			</tr>
    			
    			<tr>
    				<th>글내용</th>
    				<td>
    				 <article>
                		<div class="board_content">
                			<div id="viewer">
                				${dto.getNews_cont()}
                			</div>
                		<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
                		<script src="${pageContext.request.contextPath}/resources/js/viewer.js"></script>
                		</div>
            		</article>
    				
    				
    				</td>
    			</tr>
    			
    			
    			<tr>
    				<th>작성일자</th>
    				<td>${dto.getNews_date().substring(0,10) }</td>
    			</tr>
    			
    			<tr>
    				<th>조회수</th>
    				<td>${dto.getNews_hit() }</td>
    			</tr>
    			
    			
    			
    			</c:if>
    			
    			<tr>
           	 <td colspan="2" align="center">
           	 
           	 	<!-- 관리자한테만 글수정, 글삭제 보여야함 -->
           	 	
               <input type="button" value="글수정"
                  onclick="location.href='user_notice_update.do?no=${dto.getNews_no() }&page=${page }'">
               <input type="button" value="글삭제"
                  onclick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
                	            location.href='user_notice_delete.do?no=${dto.getNews_no() }&page=${page }'
                  		   }else { return; }">
               <input type="button" value="전체목록"
                  onclick="location.href='user_notice.do'">
            </td>
         </tr>
    			
    		</table>
    	
    	
    	
    	</div>
    	<br> <br>
    
    



	<jsp:include page="../include/footer.jsp" flush="false"/>

</body>
</html>