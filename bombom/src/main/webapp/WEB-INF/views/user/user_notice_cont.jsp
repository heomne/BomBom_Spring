<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_news.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/notice_cont.css?after">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contents.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Tui_Editor.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contents.css?after"/>

	

	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script defer src="https://kit.fontawesome.com/2c8a84bfa2.js" crossorigin="anonymous"></script>
	
	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu0').attr('id', 'on');
			}
		);
		
	</script>

	<style>
		#notice_list{
			margin-left:880px;
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
	        <span class="sub_title">커뮤니티 봄봄의 이모저모를 담은 공간</span> 
	    </div>
    </div>
    
    <div class="container">
    	
    	 <div class="content_area">
    	 	<c:set value="${Cont }" var="dto" />
            <header>
                <div class="title">
                    <h1>${dto.getNews_title() }</h1>
                </div>
                <div class="info_block">
                    <div class="info_left">
                        <span class="writer">${dto.getNews_writer() }</span>
                        <span class="date">${dto.getNews_date().substring(0,10) }</span>
                    </div>

                    <div class="info_right">
                        <span class="hit">👁${dto.getNews_hit() }</span>
                    </div>
                </div>
            </header>
            
            <article>
                <div class="board_content">
                	<div id="viewer">
                		${dto.getNews_cont() }
                	</div>
                	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
                	<script src="${pageContext.request.contextPath}/resources/js/viewer.js"></script>
                </div>
            </article>

           
            
            <div class="content_bottom">
            	
            	<c:if test="${user.user_nickname eq dto.getNews_writer() }">
	            	<button id="put_btn" onClick="location.href='${pageContext.request.contextPath}/user_notice_update.do?no=${dto.getNews_no()}&page=${page }'">
	            		<i class="fas fa-pen-square"></i>
	            		수정
	            	</button>
	            	<button id="delete_btn" onClick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
                	            location.href='user_notice_delete.do?no=${dto.getNews_no() }&page=${page }'
                  		   }else { return; }">
	            		<i class="fas fa-trash-alt"></i>
	            		삭제
	            	</button>
	            </c:if>
            </div>
        </div>
            
    	<table>
           	 <td colspan="2" align="center">
           	 
           	 	<!-- 관리자한테만 글수정, 글삭제 보여야함 -->
           	 	
               
               <input id="notice_list" type="button" value="전체목록"
                  onclick="location.href='user_notice.do'"/>
            </td>
         </tr>
    			
    		</table>
    	
    	
    	
    	</div>
    	<br> <br>
    
    
	</div>


	<jsp:include page="../include/footer.jsp" flush="false"/>

</body>
</html>