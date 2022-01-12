<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script src="resources/js/user_join.js" type="text/javascript" defer="defer"></script>
	
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="content">
		<div class="article">	
			<div class="join_box" align="center">
				<h1>회원가입</h1>
				
				<form method="post" action="user_join_ok.do">
					<table class="join_form"> 
						<tr>
							<th>아이디<span>*</span></th>
							<td><input id="user_id" name="user_id" placeholder="소문자, 숫자, 언더바/하이픈 허용 4~20자리"></td>
							<td>
								<button type="button" class="btn_general" onclick="idCheck()">중복확인</button>
								<input id="id_check" type="hidden" value="false"> 
							</td>
						</tr>
						<tr>
							<th>비밀번호<span>*</span></th>
							<td><input id="user_pwd" type="password" name="user_pwd" placeholder="문자, 숫자 1개이상 포함, 8자리 이상"></td>
						</tr>
						<tr>
							<th>비밀번호확인<span>*</span></th>
							<td><input id="user_pwdcheck" type="password" placeholder="비밀번호를 한 번 더 입력해주세요"></td>
						</tr>
						<tr>
							<th>이름<span>*</span></th>
							<td><input id="user_name" name="user_name" placeholder="이름을 입력해주세요"></td>
						</tr>
						<tr>
							<th>닉네임<span>*</span></th>
							<td><input name="user_nickname" placeholder="닉네임을 입력해주세요"></td>
						</tr>
						<tr>
							<th>이메일<span>*</span></th>
							<td><input id="user_email" name="user_email" placeholder="예: bom2022@bombom.com"></td>
							<td>
								<button type="button" class="btn_general" onclick="emailCheck()">중복확인</button>
								<input id="email_check" type="hidden" value="false"> 
							</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input id="user_phone" name="user_phone" placeholder="휴대폰 번호를 입력해주세요"></td>
						</tr>
						<tr>
							<th rowspan="2">주소</th>
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
						<tr>
							<th>나이</th>
							<td><input name="user_age" placeholder="나이를 입력해주세요"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td colspan="2">
								<select name="user_gender">
									<option value="선택안함">선택안함</option>
									<option value="남성">남성</option>
									<option value="여성">여성</option>
								</select>		
							</td>
						</tr>
					</table>
					<div class="toast_box"><span class="toast"></span></div>
					<button type="button" class="btn_register" onclick="addAddr(); if(validate()){submit();}">가입하기</button>		
					<button type="reset" class="btn_reset">다시작성</button>
				</form>
				
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>