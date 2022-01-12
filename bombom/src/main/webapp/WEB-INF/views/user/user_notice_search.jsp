<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" type="text/css" href="resources/css/notice.css?after">
	
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
	        <span class="sub_title">커뮤니티 봄봄의 새로운 소식들을 담은 공간</span> 
	    </div>
    </div>
	
	<div class="content">
	<c:set value="${page }" var="dto"/>
	
	<%-- 옮길것 --%>
		<div class="boardArea" >
			<table border="1" cellspacing="0" width="1000" align="center" class="table">
				<tr>
					<th>글번호</th> <th>글제목</th>
					<th>작성자</th> <th>작성날짜</th> <th>조회수</th>
				</tr>
				
				<c:set value="${searchList }" var="list" />
				<c:if test="${!empty list }" >
				<c:forEach items="${list }" var="i">
					<tr>
						<td>${i.getNews_no() }</td>
						<td><a href="<%=request.getContextPath() %>/user_notice_cont.do?no=${i.getNews_no() }&page=${dto.getPage() }"">${i.getNews_title() }</a></td>
						<td>${i.getNews_writer() }</td>
						<td>${i.getNews_date().substring(0,10) }</td>
						<td>${i.getNews_hit() }</td>
					</tr>
				
				</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<tr>
			   	        <td colspan="5" align="center">
			   	           <h3>검색된 게시물이 없습니다.....</h3>
			   	        </td>
			   	     </tr>
				
				</c:if>
				
			
			</table>
			
			<br>
			
			<!-- 관리자만 글쓰기 버튼 보여야함** -->
			 <input class="write" type="button" value="✐"
	                 onclick="location.href='admin_notice_write.do'">
		
			
		</div>
		<!-- 옮길것 끝 -->	
		
	
	      
	
	<%-- 페이징처리 부분 --%>
	
	<div class="page" align="center">
		
		<c:if test="${!empty dto }">
	   <c:if test="${dto.getPage() > dto.getBlock() }">
	      <a href="user_notice.do?page=1">◀◀</a>
	      <a href="user_notice.do?page=${dto.getStartBlock() - 1 }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${dto.getStartBlock() }"
	                   end="${dto.getEndBlock() }" var="i">
	      <c:if test="${i == dto.getPage() }">
	         <b> <a href="user_notice.do?page=${i }">[${i }]</a></b>
	      </c:if>
	      
	      <c:if test="${i != dto.getPage() }">
	         <a href="user_notice.do?page=${i }">[${i }]</a>
	      </c:if>
	   </c:forEach>
	   
	   <c:if test="${dto.getEndBlock() < dto.getAllPage() }">
	       <a href="user_notice.do?page=${dto.getEndBlock() + 1}">▶</a>
	      <a href="user_notice.do?page=${dto.getAllPage() }">▶▶</a>
	   </c:if>
		</c:if>
	</div>
		
		
		<div class="search">
				<form method="post"
					action="<%=request.getContextPath() %>/user_bombom_search.do">
					
			<input type="hidden" name="page" value="${dto.getPage() }">
			
					<select name="field">
						<option value="title">제목</option>
						<option value="title_cont">제목 + 내용</option>
			
					</select>
		
				<input size="50px" type="text" name="keyword">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="검색">
		
				</form>
				
			</div>
		
	</div>
	<jsp:include page="../include/footer.jsp" flush="false"/>


</body>
</html>