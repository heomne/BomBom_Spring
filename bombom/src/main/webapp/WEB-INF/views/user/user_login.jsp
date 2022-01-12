<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />

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
			
			<div class="toast_box">
				<c:if test="${param.login eq 'fail'}">
					<span class="toast">아이디와 비밀번호를 확인해주시기 바랍니다</span>		
				</c:if>
				<c:if test="${param.register eq 'success'}">
					<span class="toast">회원가입이 완료되었습니다. 로그인해주세요.</span>		
				</c:if>
				<c:if test="${param.register eq 'fail'}">
					<span class="toast">회원가입에 실패했습니다. 고객센터로 문의해주세요.</span>		
				</c:if>
			</div>
			
			<script>
				$('.toast').fadeIn(700).delay(2000).fadeOut(700);
			</script>
			
			<div class="login_box" align="center">
				<form action="user_login_ok.do" method="post">
					<h1>로그인</h1>
					<br>
					<input name="user_id" placeholder="아이디를 입력해주세요"><br>
					<input type="password" name="user_pwd" placeholder="비밀번호를 입력해주세요"><br><br>
					<button type="submit" class="btn_login">로그인</button><br>
				</form>
					<button onclick="location.href='user_join.do'" class="btn_join">회원가입</button><br>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>