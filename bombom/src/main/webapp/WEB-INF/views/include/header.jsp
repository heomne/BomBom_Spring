<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<%-- 헤더 --%>
	<div class="header">
		<div class="header_content">
			
			<div class="content">
				<div class="login">
					<ul>
						<c:if test="${empty user }">
							<li>
								<span onclick="location.href='user_login.do'">로그인</span>
							</li>
							<li>
								<span onclick="location.href='user_join.do'">회원가입</span>
							</li>
						</c:if>	
						
						<c:if test="${!empty user }">
							<li>
								<span>마이페이지</span>
							</li>
							<li>
								<span onclick="location.href='user_logout.do'">로그아웃</span>
							</li>
						</c:if>	
					</ul>
				</div>
			</div>
			
			<div class="content">
					
				<div class="logo">
					<a href="<%=request.getContextPath() %>"><img src="<%=request.getContextPath() %>/resources/image/4.png"></a>
				</div>
				
			</div>
		</div>
		
	</div>
	
	<div class="nav">
	
		<ul>
			<li><span class="menu0" onclick="location.href='${pageContext.request.contextPath}/user_notice.do'">봄봄소식</span></li>
			<li><span class="menu1" onclick="location.href='${pageContext.request.contextPath}/user_talk.do'">영화수다</span></li>
			<li><span class="menu2" onclick="location.href='${pageContext.request.contextPath}/user_info.do'">영화정보</span></li>
			<li><span class="menu3" onclick="location.href='${pageContext.request.contextPath}/user_food.do'">극장맛집</span></li>
			<li><span class="menu4" onclick="location.href='${pageContext.request.contextPath}/user_premiere.do'">시사회</span></li>
		</ul>
			
	</div>
