<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화커뮤니티 : 봄봄</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contents.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/talk.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Tui_Editor.css" />

	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script defer src="${pageContext.request.contextPath}/resources/js/talk_delete.js"></script>
	<script defer src="${pageContext.request.contextPath}/resources/js/talk_like.js"></script>
	<script defer src="${pageContext.request.contextPath}/resources/js/talk_comment.js"></script>
	<script defer src="https://kit.fontawesome.com/2c8a84bfa2.js" crossorigin="anonymous"></script>
	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu1').attr('id', 'on');
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

	<c:set var="dto" value="${content}"/>
	<c:set var="session" value="${user}"/>
	<div class="container">
		<input type="hidden" id="talk_no" value="${dto.getTalk_no()}"/>
		<input type="hidden" id="user_id" value="${session.user_id}"/>
		<input type="hidden" id="user_nickname" value="${session.user_nickname}"/>
        <div class="content_area">
            <header>
                <div class="title">
                    <h1>${dto.getTalk_title()}</h1>
                </div>
                <div class="info_block">
                    <div class="info_left">
                        <span class="writer">${dto.getUser_nickname() }</span>
                        <span class="date">${fn:substring(dto.getTalk_date(), 0, 16)}</span>
                    </div>

                    <div class="info_right">
                        <span class="hit">👁${dto.getTalk_hit()}</span>
                        <span class="like">👍${dto.getTalk_like()}</span>
                        <span class="comment">💭3</span>
                    </div>
                </div>
            </header>
            
            <article>
                <div class="board_content">
                	<div id="viewer">
                		${dto.getTalk_cont()}
                	</div>
                	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
                	<script src="${pageContext.request.contextPath}/resources/js/viewer.js"></script>
                </div>
            </article>

            <div class="content_like">
            	<c:choose>
            		<c:when test="${isLiked}">
            			<button id="like_btn" type="button" class="like_active">👍 ${dto.getTalk_like()}</button>
            		</c:when>
            		<c:otherwise>
            			<button id="like_btn" type="button" class="like">👍 ${dto.getTalk_like()}</button>
            		</c:otherwise>
            	</c:choose>
                
            </div>
            
            <div class="content_bottom">
            	<input id="talkNo" type="hidden" value="${dto.getTalk_no()}"/>
            	<c:if test="${session.user_id eq dto.getUser_id()}">
	            	<button id="put_btn" onClick="location.href='${pageContext.request.contextPath}/user_write.do/${dto.getTalk_no()}'">
	            		<i class="fas fa-pen-square"></i>
	            		수정
	            	</button>
	            	<button id="delete_btn" onClick="delete_post()">
	            		<i class="fas fa-trash-alt"></i>
	            		삭제
	            	</button>
	            </c:if>
            </div>

            <div class="comment_block">
                <%@include file="../include/talk_comment.jsp" %>
            </div>
        </div>
		
	<c:set var="session" value="${user}"/>
	<c:set var="paging" value="${paging}"/>
	<c:set var="dto" value="${posts}"/>
	<c:set var="today" value="${today}"/>
        <div class="list_area">
            <div class="board">
                <table width="100%">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>

                    <tr class="hot">
                        <td>
                            <span class="hot">HOT</span>
                        </td>
                        <td class="title_left">
                            <a href="#">table-layout auto test</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>
                    
                    <c:forEach var="post" items="${dto}" varStatus="status">
                    <tr>
                        <td>${post.getTalk_no()}</td>
                        <td class="title_left">
                            <a href="${pageContext.request.contextPath}/user_talk.do/${post.getTalk_no()}">${post.getTalk_title()}</a>
                        </td>
                        <td>
                            <a href="#">${post.getUser_nickname()}</a>
                        </td>
                        <c:if test="${fn:substring(post.getTalk_date(), 0, 10) eq today}">
                        	<td>${fn:substring(post.getTalk_date(), 11, 16)}</td>
                       	</c:if>
                       	
                       	<c:if test="${fn:substring(post.getTalk_date(), 0, 10) ne today}">
                       		<td>${fn:substring(post.getTalk_date(), 0, 10)}</td>
                       	</c:if>
                        <td>${post.getTalk_hit()}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="board_footer">
                <div class="board_bottom">
                	<form method="post" action="${pageContext.request.contextPath}/user_search.do" class="search-container">
					  <input id="search-box" type="text" class="search-box" name="keyword" />
					  <label for="search-box">
					    <span>🔍</span>
					  </label>
					  <input type="submit" id="search-submit" />
					</form>
					<c:if test="${session.user_id ne null}">
                    	<a href="${pageContext.request.contextPath}/user_write.do" class="post_btn">글쓰기</a>
                    </c:if>
                </div>
                
                <div class="paging">
                	<c:if test="${paging.currRange ne 1}">
                		<a href="${pageContext.request.contextPath}/user_talk.do?page=${paging.startPage}" class="paging_first"><<</a>
                	</c:if>
                	<c:if test="${paging.currPage ne 1}">
                		<a href="${pageContext.request.contextPath}/user_talk.do?page=${paging.prevPage}" class="paging_prev"><</a>
                	</c:if>
                	<c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
                		<c:choose>
                			<c:when test="${pageNum eq paging.currPage}">
                				<a href="javascript:void(0);" class="paging_number_active">${pageNum}</a>
                			</c:when>
                			<c:otherwise>
                				<a href="${pageContext.request.contextPath}/user_talk.do?page=${pageNum}" class="paging_number">${pageNum}</a>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	<c:if test="${paging.currPage ne paging.pageCount && paging.pageCount > 0}">
                    	<a href="${pageContext.request.contextPath}/user_talk.do?page=${paging.nextPage}" class="paging_next">></a>
                    </c:if>
                    <c:if test="${paging.currRange ne paging.rangeCount && paging.rangeCount > 0}">
                    	<a href="${pageContext.request.contextPath}/user_talk.do?page=${paging.endPage}" class="paging_last">>></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>