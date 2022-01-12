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
	<!-- 상단 배너 -->
	<div class="mypage_top"></div>
	
	<div class="mypage_content">
	
	<c:set var="dto" value="${Dto }"/>
	
	<!-- 공지사항 -->
	<div class="notice">
 			<img id="notice" alt="" src="resources/image/notice.png"
				onclick="location.href='${pageContext.request.contextPath}/user_notice.do'">
			<div class="notice_content">
				<div class="content_container">
					<ul class="content_container_list">
				      <li class="content_container_list_item">
				      	<a href="#1">[공지사항] 봄봄수다 게시판 이용 관련 공지사항입니다.</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="#2">[공지사항] 신규기능 '극장맛집' 탭 소개 및 이용안내</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="#3">[공지사항] 2022년 개봉예정작 시사회 일정 안내</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="#4">봄봄 커뮤니티에 오신 것을 환영합니다.</a>
				      </li>
				    </ul>
			    </div>
		    </div>
		</div>
	
	<div class="myInfo_wrap">		
		<div class="myInfo_1">
		<!-- 일반 회원 중에, 성별이 여자면 여자프로필, 남자면 남자프로필 보여줌 -->
		<c:if test="${user.getUser_gender() == '남성' }">
			<img src="resources/image/남자 프로필.png" alt="프로필" width="100px;" height="100px;">
			<br>
		</c:if>
		
		<c:if test="${user.getUser_gender() == '여성' }">
			<img src="resources/image/여자 프로필.png" alt="프로필" width="100px;" height="100px;">
			<br>
		</c:if>
		
		<c:if test="${empty user.getUser_gender() }">
			<img src="resources/image/남자 프로필.png" alt="프로필" width="100px;" height="100px;">
			<br>
		</c:if>
		
			<div style="cursor: pointer;"><span class="name">${user.getUser_name() }</span><span> 님 ></span></div>
			<p style="font-size: 15px;">일반회원</p>
			<p style="font-size: 15px;">내 가입일 : ${user.getUser_regdate().substring(0,10) }</p>
		</div>
		
		<div class="myInfo_2">
			<p style="margin: 0">나의 활동</p>	
				
			<div class="box">
				<div class="box1">
					<p class="count">3</p>
					<p class="title">작성한 글</p>
				</div>
				
				<div class="box2">
					<p class="count">3</p>
					<p class="title">작성한 댓글</p>
				</div>
				
				<div class="box3">
					<p class="count">4</p>
					<p class="title">좋아요한 게시글</p>				
				</div>
				
				<div class="box4">
					<p class="count">4</p>
					<p class="title">영화 리뷰</p>				
				</div>
			</div>
			
			<div class="myInfo_board">
			<p>작성한 게시글</p>
				<table width="100%">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                </table>
			</div>
			
			<div class="myInfo_comment">
			<p>작성한 댓글 </p>
				<div class="myInfo_comment_content">
					<p class="comment">아 진짜요?ㄷㄷ 어마무시하네요</p>
					<div><span class="title">원문제목 : 이번주 굿즈는 예상을 빗나간게 많네요 ㅋㅋ</span><span class="title_com_count">(2)</span></div>
				</div>
				
			</div>
			
			
			<div class="myInfo_like">
			<p>좋아요 한 글</p>
				<table width="100%">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                    </tr>
                </table>
			</div>
			
			<div class="myInfo_review">
			<p>작성한 영화리뷰</p>
				
			</div>
			
		</div>
		
		</div>
	</div>
	
	<br><br><br>
	
	
	<jsp:include page="../include/footer.jsp" flush="false"/>	

</body>
</html>