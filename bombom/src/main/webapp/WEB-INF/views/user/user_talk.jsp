<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봄봄 : 봄봄수다</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/talk.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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
	
	

	<div class="containter">
        <div class="jumbotron">
            <div class="textBlock1">
                <span class="main_title">영화수다</span>
                <br>
                <span class="sub_title">봄봄인들의 수다공간</span> 
            </div>
        </div>

		<c:set var="dto" value="${posts}"/>
		<c:set var="today" value="${today}"/>
        <div class="boardArea">
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
                
	                <form method="post" action="${pageContext.request.contextPath}/user_talk.do" class="search-container">
					  <input id="search-box" type="text" class="search-box" name="keyword" />
					  <label for="search-box">
					    <span>🔍</span>
					  </label>
					  <input type="submit" id="search-submit" />
					</form>
                    <a href="${pageContext.request.contextPath}/user_write.do" class="post_btn">글쓰기</a>
                </div>

                <div class="paging">
                    <a href="#" class="paging_first"><<</a>
                    <a href="#" class="paging_prev"><</a>
                    <a href="#" class="paging_number_active">1</a>
                    <a href="#" class="paging_number">2</a>
                    <a href="#" class="paging_number">3</a>
                    <a href="#" class="paging_number">4</a>
                    <a href="#" class="paging_number">5</a>
                    <a href="#" class="paging_number">6</a>
                    <a href="#" class="paging_number">7</a>
                    <a href="#" class="paging_number">8</a>
                    <a href="#" class="paging_number">9</a>
                    <a href="#" class="paging_number">10</a>
                    <a href="#" class="paging_next">></a>
                    <a href="#" class="paging_last">>></a>
                </div>
            </div>
        </div>


    </div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>