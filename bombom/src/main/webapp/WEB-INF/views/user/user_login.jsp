<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, login, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_login.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="content">
		<div class="article">	
			<div class="login_box" align="center">
				<h1>로그인</h1>
				<br>
				<input name="id" placeholder="아이디를 입력해주세요"><br>
				<input type="password" name="pwd" placeholder="비밀번호를 입력해주세요"><br><br>
				<button class="btn_login">로그인</button><br>
				<button class="btn_join">회원가입</button><br>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>