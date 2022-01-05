<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_food_detail.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_food_map.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<%-- 카카오맵 API --%>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b0c4493d5da3a2f3ab4bd9ebf36c8bc&libraries=services"></script>
	
	<%-- 카카오맵 JavaScript --%>
	<script src="resources/js/user_food_map.js" type="text/javascript" defer="defer"></script>
	
	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu3').attr('id', 'on');
			}
		);
		
	</script>
	

</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">극장맛집</span>
	        <br>
	        <span class="sub_title">봄봄인들을 위한 지능형 맛집 추천</span> 
	    </div>
    </div>
	
	<div class="content">
	
		
		<h2><span>${keyword }</span> 주변 식당 정보</h2>
		
		
		<%-- 카카오 지도 불러오기 --%>

		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
		               		 <input type="hidden" value="${keyword} 근처 맛집" id="keyword" size="15"> 
		                    
		                </form>
		            </div>
		        </div>
		        
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
		
		
		<h2><span>${keyword} 맛집</span> 블로그 검색 결과</h2>
		
		<%-- 블로그 테이블 --%>
		<table class="bloglist">
			<c:forEach items="${itemList }" var="dto">
				<tr>
					<td onclick="window.open('${dto.getLink() }')">
						<h4>${dto.getTitle() }<br></h4>
						<span class="desc">${dto.getDesc() } </span>
						<br>
						<span class="blogger">${dto.getDate() } &nbsp;|&nbsp; ${dto.getBlogger() }</span>
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>