<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/mypage.css?after">
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
</head>
<body>

	<div class="side_bar">
		<ul>
			<li><span onclick="location.href='${pageContext.request.contextPath}/mypage_main.do'">마이페이지 홈</span></li>
			<li><span onclick="location.href='${pageContext.request.contextPath}/mypage_main.do'">회원정보 수정</span></li>
			<li><span onclick="location.href='${pageContext.request.contextPath}/mypage_main.do'">작성글 확인</span></li>
			<li><span onclick="location.href='${pageContext.request.contextPath}/mypage_main.do'">회원탈퇴</span></li>
		</ul>	
	</div>
	
</body>
</html>