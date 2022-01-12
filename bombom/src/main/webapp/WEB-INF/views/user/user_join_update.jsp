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
	<link rel="stylesheet" type="text/css" href="resources/css/user_join.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<%-- 다음 Postcode API --%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<%-- user_join.js --%>
	<script src="resources/js/user_join_update.js" type="text/javascript" defer="defer"></script>
	
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="content">
		<div class="article">	
			<div class="join_box" align="center">
				<h1>회원정보 수정</h1>
				
				<form method="post" action="user_join_update_ok.do">
					<table class="join_form"> 
						<tr>
							<td class="table_header">아이디</td>
							<td><input id="user_id" name="user_id" value="${user.getUser_id() }" readonly></td>
						</tr>
						<tr>
							<td class="table_header">이름</td>
							<td><input id="user_name" name="user_name" value="${user.getUser_name() }" readonly></td>
						</tr>
						<tr>
							<td class="table_header">이메일</td>
							<td><input id="user_email" name="user_email" value="${user.getUser_email() }" readonly></td>
						</tr>
						<tr>
							<td class="table_header">나이</td>
							<td><input name="user_age" value="${user.getUser_age() }"></td>
						</tr>
						<tr>
							<td class="table_header">성별</td>
							<td colspan="2">
							
							<c:set var="gender" value="${user.getUser_gender() }"/>
							<c:if test="${gender == '선택안함'}">
								<select name="user_gender">
									<option value="선택안함" selected>선택안함</option>
								</select>		
							</c:if>
							<c:if test="${gender == '남성'}">
								<select name="user_gender">
									<option value="남성" selected>남성</option>
								</select>		
							</c:if>
							<c:if test="${gender == '여성'}">
								<select name="user_gender">
									<option value="여성" selected>여성</option>
								</select>		
							</c:if>
							</td>
						</tr>
						<tr>
							<td class="table_header" rowspan="2">주소<span>*</span></td>
							<td>
								<input id="addr_general" placeholder="주소찾기 버튼을 클릭해주세요" readonly>
							</td>
							<td>
								<button type="button" class="btn_address" onclick="findAddr()">주소찾기</button>
							</td>
						</tr>
						<tr>
							<td>
								<input id="addr_detail" placeholder="나머지 주소를 입력해주세요">
								<input type="hidden" id="user_addr" name="user_addr">		<%-- 최종 주소 --%>
							</td>
						</tr>
						<tr id="address">
							<td></td>
							<td>
								${user.getUser_addr() }
								<input id="addr_original" type="hidden" value="${user.getUser_addr() }">
							</td>
						</tr>
						<tr>
							<td class="table_header">닉네임<span>*</span></td>
							<td><input name="user_nickname" value="${user.getUser_nickname() }"></td>
						</tr>
						<tr>
							<td class="table_header">휴대폰<span>*</span></td>
							<td><input id="user_phone" name="user_phone" value="${user.getUser_phone() }"></td>
						</tr>
						<tr>
							<td class="table_header">비밀번호 확인<span>*</span></td>
							<td>
								<input id="user_pwd" type="password" placeholder="현재 비밀번호를 입력해주세요" name="user_pwd">
								<input type="hidden" id="pwd_original" value="${user.getUser_pwd() }">
							</td>
						</tr>
					</table>
					<div class="toast_box"><span class="toast"></span></div>
					<button type="button" class="btn_register" onclick="addAddr(); if(validate()){submit();}">수정하기</button>		
					<button type="reset" class="btn_reset">다시작성</button>
				</form>
				
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>