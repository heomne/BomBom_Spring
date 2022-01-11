<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/info.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu2').attr('id', 'on');
			}
		);
		
		function zoomIn(event) {
		    event.target.style.width = "150%";
		    event.target.style.height = "300px";
		    event.target.style.transition = "all 0.5s";
		}

		function zoomOut(event) {
		    event.target.style.width = "120%";
		    event.target.style.height = "300px";
		    event.target.style.transition = "all 0.5s";
		}
		
	</script>

</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">영화 정보</span>
	        <br>
	        <span class="sub_title">상영중인 영화의 정보를 한눈에!</span> 
	    </div>
    </div>
	
	<c:set var="list" value="${List }" />
	<c:set var="dto" value="${Paging }" />
			
	
	<div class="content">
	
		<%-- 여기에 작업 해야함 (좌우 여백 설정되어있음) --%>
		
		<div class="info_title">
			<div class="title_text">
				<h2>* 영화정보</h2>
			</div>
			<div class="info_array">
				개봉 순 | 인기 순 | 리뷰 순
		
			</div>
		</div>
		<%-- 더미컨텐츠 (필요시 .article, .content 사용) --%>
			
		<div class="article">
			<div class="info_content">
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="i">
					
						
					
					<a class="content_cards" href="${pageContext.request.contextPath}/info_detail.do?no=${i.getInfo_no() }&page=${dto.getPage() }">
						<div class="cards_image">
							<img src="resources/upload/info/${i.getInfo_thumbnail() }" >
						</div>
						<div class="cards_cont">
							<div class="cont_title">
								${i.getInfo_title() }
							</div>
							
							<c:if test="${i.getInfo_synopsis().length() > 50}">
								<div class="cont_text">
									
									${fn:substring(i.getInfo_synopsis(), 0, 50) }...
								</div>
                       		</c:if>
                       		<c:if test="${i.getInfo_synopsis().length() <= 30}">
								<div class="cont_text">
									
									${i.getInfo_synopsis()}
								</div>
                       		</c:if>
							
						</div>
					</a>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>검색된 게시물이 없습니다..</h3>
					</td>
				</tr>
			</c:if>
			
				
				
				
				<div class="info_bottom">
                    <button type="button" class="search_btn">🔎</button>
                    <a href="${pageContext.request.contextPath}/user_info_write.do" class="post_btn">글쓰기</a>
                </div>
                
                <div class="paging">
	                <c:if test="${dto.getPage() > dto.getBlock() }">
						<a href="${pageContext.request.contextPath}/user_info.do?page=1" class="paging_first"><<</a>
						<a href="${pageContext.request.contextPath}/user_info.do?page=${dto.getStartBlock() - 1 }" class="paging_prev"><</a>
					</c:if>
					
					<c:forEach begin="${dto.getStartBlock() }" 
							end="${dto.getEndBlock() }" var="i">
						<c:if test="${i == dto.getPage() }">
							<b> <a href="${pageContext.request.contextPath}/user_info.do?page=${i }" class="paging_number_active">${i }</a></b>
						</c:if>		
						
						<c:if test="${i != dto.getPage() }">
							<a href="${pageContext.request.contextPath}/user_info.do?page=${i }" class="paging_number">${i }</a>
						</c:if>		
					</c:forEach>
					
					<c:if test="${dto.getEndBlock() < dto.getAllPage() }">
						<a href="${pageContext.request.contextPath}/user_info.do?page=${dto.getEndBlock() + 1 }" class="paging_next">></a>
						<a href="${pageContext.request.contextPath}/user_info.do?page=${dto.getAllPage()}" class="paging_last">>></a>
					</c:if>
				</div>
                
                <!-- <div class="paging">
                    <a href="#" class="paging_first"><<</a>
                    <a href="#" class="paging_prev"><</a>
                    <a href="#" class="paging_number_active">1</a>
                    <a href="#" class="paging_number">2</a>
                    <a href="#" class="paging_number">3</a>
                    <a href="#" class="paging_number">4</a>
                    <a href="#" class="paging_number">5</a>
                    <a href="#" class="paging_number">6</a>
                    <a href="#" class="paging_number">7</a>
                    <a href="#" class="paging_number">8</a>
                    <a href="#" class="paging_number">9</a>
                    <a href="#" class="paging_number">10</a>
                    <a href="#" class="paging_next">></a>
                    <a href="#" class="paging_last">>></a>
                </div> -->
      
			</div>
		</div>

	</div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>