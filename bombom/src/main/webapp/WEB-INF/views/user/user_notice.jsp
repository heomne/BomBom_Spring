<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_food.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
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
	
	<div class="content">
	
	<%-- 옮길것 --%>
		<div class="boardArea">
			<table border="1" cellspacing="0" width="950" align="center">
				<tr>
					<th>글번호</th> <th>글제목</th>
					<th>작성자</th> <th>작성날짜</th> <th>조회수</th>
				</tr>
				
				<tr>
					<td>1</td>
					<td>안녕하세요. 봄봄입니다</td>
					<td>관리자</td>
					<td>2022.01.06</td>
					<td>10</td>
				</tr>
				
				<tr>
					<td>2</td>
					<td>시사회 관련 공지</td>
					<td>관리자</td>
					<td>2022.01.06</td>
					<td>10</td>
				</tr>
				
				<tr>
					<td>3</td>
					<td>영화수다 관련 공지</td>
					<td>관리자</td>
					<td>2022.01.06</td>
					<td>10</td>
				</tr>
				
				
				<tr>
					<td>4</td>
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
		
				<input type="text" name="keyword">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="검색">
		
		</form>
				
			</div>
			
		</div>
		<!-- 옮길것 끝 -->	
		
	</div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>