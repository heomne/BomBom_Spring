<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_food.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/noticee.css?after">
	
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
	
	<%-- 옮길것 --%>
		<div class="boardArea">
			<table border="1" cellspacing="0" width="1000" align="center" class="table">
				<tr>
					<th>글번호</th> <th>글제목</th>
					<th>작성자</th> <th>작성날짜</th> <th>조회수</th>
				</tr>
				
				<c:set value="${List }" var="list" />
				<c:if test="${!empty list }" var="list">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.getNews_no() }</td>
						<td>${dto.getNews_title() }</td>
						<td>${dto.getNews_writer() }</td>
						<td>${dto.getNews_date() }</td>
						<td>${dto.getNews_hit() }</td>
					</tr>
				
				</c:forEach>
				</c:if>
				
				<tr>
					<td align="center">1</td>
					<td><a href="<%=request.getContextPath() %>/user_notice_cont.do">안녕하세요. 봄봄입니다</a></td>
					<td>관리자</td>
					<td>2022.01.06</td>
					<td>10</td>
				</tr>
				
				<tr>
					<td align="center">2</td>
					<td>시사회 관련 공지</td>
					<td>관리자</td>
					<td>2022.01.06</td>
					<td>10</td>
				</tr>
				
				<tr>
					<td align="center">3</td>
					<td>영화수다 관련 공지</td>
					<td>관리자</td>
					<td>2022.01.06</td>
					<td>10</td>
				</tr>
				
				
				<tr>
					<td align="center">4</td>
					<td>극장맛집에 새 맛집이 추가되었어요!</td>
					<td>관리자</td>
					<td>2022.01.06</td>
					<td>10</td>
				</tr>
				
				
			
			</table>
			
			<div class="search">
				<form method="post"
					action="<%=request.getContextPath() %>/user_bombom_search.do">
			
					<select name="field">
						<option value="title">제목</option>
						<option value="kind">말머리</option>
			
					</select>
		
				<input size="40px" type="text" name="keyword">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="검색">
		
				</form>
				
			</div>
			
		</div>
		<!-- 옮길것 끝 -->	
		
	</div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>