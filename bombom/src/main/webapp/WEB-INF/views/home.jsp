<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/home.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
</head>
<body>
	
	<jsp:include page="./include/header.jsp" flush="false"/>
	
	<c:set var="posts" value="${posts}"/>
	
	<div id="slideShow"> 
			
			<iframe src="./banner" frameborder="0" width="100%"  height=500 scrolling=auto name=banner ></iframe>
			
	</div>
	<div class="content">
	
		<%-- 메인화면 배너 자리 : iframe 사용 예정 --%>
		
		
		
		<%-- 본문 컨텐츠 자리 --%>
		
		<div class="notice">
		
			<img id="notice" alt="" src="resources/image/notice.png"
				onclick="location.href='${pageContext.request.contextPath}/user_notice.do'">
	
		</div>
		<br>

					
		<h1>인기 게시글</h1>
			<div class="cont" >
				<table class="td">
					<c:forEach var="postDTO" items="${posts}" varStatus="status">
						<tr>
							<td>
							<span class="rank_${status.count}">&nbsp;&nbsp;${status.count}&nbsp;&nbsp;</span>
								<a href="${pageContext.request.contextPath}/user_talk.do/${postDTO.getTalk_no()}">
									${postDTO.getTalk_title()}
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		
		
		<div class="article">
			<div class="content">
				<h1>영화 정보</h1>
					<div class="all" align="center">전체보기&nbsp;&nbsp;></div>
					<div class = "back">
						<div class="first">
							
								<img class="first_img"  alt="" src="">
							
								<b>영화제목</b>
								
								<img id="star" src="resources/image/star.jpg">
								<p id="grade"> 0.0 </p>
						</div>
						
							<div class="second">
							
								<img class="first_img"  alt="" src="">
								
								<b>영화제목</b>
								
								<img id="star" src="resources/image/star.jpg">
								<p id="grade"> 0.0 </p>
							</div>
							
							
						
						
					</div>
				
			</div>
		</div>
		
		<div class="article">
			<div class="content">
				<h1>시사회 정보</h1>
					<div class="all" align="center">전체보기&nbsp;&nbsp;></div>
				<div class="back2">
					<div class="pri_first">
						<img class="pri_img" alt="" src="">
						<b id="p_title">시사회 제목</b>
						<p id="p_date">- 2022.02.02 -</p>
					</div>
					
					<div class="pri_second">
						<img class="pri_img" alt="" src="">
						<b id="p_title">시사회 제목</b>
						<p id="p_date">시사회 날짜</p>
					</div>
					
					<div class="pri_third">
						<img class="pri_img" alt="" src="">
						<b id="p_title">시사회 제목</b>
						<p id="p_date">시사회 날짜</p>
					</div>
				
				</div>
			</div>
		</div>
		
		<div class="article">
			<div class="content">
				<h1>극장 맛집</h1>
					<div class="all" align="center">전체보기&nbsp;&nbsp;></div>
				
				<div class="back3">
					<div class="food_first">
						<img class="f_img" alt="" src="">
						<b class="cgv">CGV 용산아이파크몰</b>
					
					</div>
					
					<div class="food_second">
						<img class="f_img" alt="" src="">
						<b class="cgv">롯데시네마 월드타워</b>
					
					</div>
					
					<div class="food_third">
						<img class="f_img" alt="" src="">
						<b class="cgv">메가박스 코엑스</b>
					
					</div>
				
				</div>
				
				
			</div>
		</div>
		
	</div>
	
	<jsp:include page="./include/footer.jsp" flush="false"/>
	
<%--	
</body>
</html>
--%>