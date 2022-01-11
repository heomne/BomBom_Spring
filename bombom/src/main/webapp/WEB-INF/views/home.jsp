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
	<script defer src="https://kit.fontawesome.com/2c8a84bfa2.js" crossorigin="anonymous"></script>
	
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

        <div class="talk_section">
            <h2>인기 게시글</h2>
                <div class="talk_posts">
                    <ul>
                    <c:forEach var="postDTO" items="${posts}" varStatus="status">
                        <li>
                        <c:choose>
                        	<c:when test="${status.count == 1}">
                            	<span class="rank one">${status.count}</span>
                            </c:when>
                            <c:when test="${status.count == 2}">
                            	<span class="rank two">${status.count}</span>
                            </c:when>
                            <c:when test="${status.count == 3}">
                            	<span class="rank three">${status.count}</span>
                            </c:when>
                            <c:otherwise>
                            	<span class="rank">${status.count}</span>
                            </c:otherwise>
                        </c:choose>
                            <a href="${pageContext.request.contextPath}/user_talk.do/${postDTO.getTalk_no()}">${postDTO.getTalk_title()}</a>
                            <div class="score_block">
                                <span class="talk_score">
                                    <i class="fas fa-thumbs-up"></i>
                                    <span>${postDTO.getTalk_like()}</span>
                                </span>
                                <span class="talk_score">
                                    <i class="fas fa-eye"></i>
                                    <span>${postDTO.getTalk_hit()}</span>
                                </span>
                            </div>
                        </li>
					</c:forEach>
                    </ul>
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