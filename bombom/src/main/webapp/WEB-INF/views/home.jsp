<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/home.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
</head>
<body>
	
	<jsp:include page="./include/header.jsp" flush="false"/>
	
	<c:set var="posts" value="${posts}"/>
	
	<div id="slideShow"> 
			
			<iframe src="./banner" frameborder="0" width="100%"  height=500 scrolling=auto name=banner ></iframe>
			
	</div>
	
	<%-- 본문 컨텐츠 자리 --%>
	<div class="content">
			
		<div class="notice">
			<img id="notice" alt="" src="resources/image/notice.png"
				onclick="location.href='${pageContext.request.contextPath}/user_notice.do'">
		</div>

	<div class="article">
		<h2>인기 게시글</h2>
			<div class="cont" >
				<%-- <table class="td">
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
				</table> --%>
			</div>
  </div>
		
		<div class="article">	
			<h2>영화 정보</h2>
				
		</div>
		
		<div class="article">	
			<h2>시사회 정보</h2>
				
		</div>
		
		<div class="article">	
			<h2>극장 맛집</h2>
			
		</div>
		
	</div>
	
	<jsp:include page="./include/footer.jsp" flush="false"/>
	
<%--	
</body>
</html>
--%>