<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/mypage.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<jsp:include page="../include/mypage_sidebar.jsp" flush="false"/>
	
	<div class="content">
	
	<h2>마이페이지</h2>
	
	<div class="myInfo_wrap">
		
		<div class="profile">
			<img src="resources/image/사람픽토그램2.png" alt="사람 아이콘" width="150px;" height="150px;">
			<p>00님</p>
			<p>일반회원</p>
		</div>
		
		<div class="myInfo_write">
			<div class="write_post">
				<p class="write_title">작성한 글</p>
				<p class="write_sub">3개</p>
			</div>
			
			<div class="write_comment">
				<p class="write_title">작성한 댓글</p>
				<p class="write_sub">3개</p>
			</div>
		</div>
		
		<div>
		<table>
			<tr>
	            <th>아이디</th>
	            <td></td>
	         </tr>
	         
	         <tr>
	            <th>이름</th>
	            <td></td>
	         </tr>
	         
	         <tr>
	            <th>닉네임</th>
	            <td></td>
	         </tr>	  
	         
	         <tr>
	            <th>가입일</th>
	            <td></td>
	         </tr>	       
		</table>
		</div>
		

	</div>
	
	
				
	
	
	</div>
	
	
	<jsp:include page="../include/footer.jsp" flush="false"/>	

</body>
</html>