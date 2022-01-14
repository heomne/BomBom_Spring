<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/info_detail.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu2').attr('id', 'on');
			$('.info_nav li').addClass('off');
			$('li#info_menu1').removeClass('off');
			$('li#info_menu1').addClass('on');
			$('a#info_menu1').css('color', 'white');
			
		});
		
		
		$(window).scroll(function() {
		
			var bgtop = $('.bg').offset().top;
			var teasertop = $('.teaser').offset().top;
			var reviewtop = $('.review').offset().top;
			
			if($(this).scrollTop() >= bgtop) {
				$('li#info_menu1').removeClass('off');
				$('li#info_menu1').addClass('on');
				$('a#info_menu1').css('color', 'white');
				$('li#info_menu2').removeClass('on');
				$('li#info_menu2').addClass('off');
				$('li#info_menu3').removeClass('on');
				$('li#info_menu3').addClass('off');
				$('a#info_menu2').css('color', '#fb4357');
				$('a#info_menu3').css('color', '#fb4357');
			} 
			
			if($(this).scrollTop() >= bgtop && $(this).scrollTop() >= teasertop - 5) {
				$('li#info_menu1').removeClass('on');
				$('li#info_menu1').addClass('off');
				$('li#info_menu2').removeClass('off');
				$('li#info_menu2').addClass('on');
				$('a#info_menu2').css('color', 'white');
				$('li#info_menu3').removeClass('on');
				$('li#info_menu3').addClass('off');
				$('a#info_menu1').css('color', '#fb4357');
				$('a#info_menu3').css('color', '#fb4357');
			}
			
			if($(this).scrollTop() >= bgtop && $(this).scrollTop() >= teasertop && $(this).scrollTop() >= reviewtop - 5) {
				$('li#info_menu1').removeClass('on');
				$('li#info_menu1').addClass('off');
				$('li#info_menu3').removeClass('off');
				$('li#info_menu3').addClass('on');
				$('a#info_menu3').css('color', 'white');
				$('li#info_menu2').removeClass('on');
				$('li#info_menu2').addClass('off');
				$('a#info_menu1').css('color', '#fb4357');
				$('a#info_menu2').css('color', '#fb4357');
			}
		});
		
		$(function(){
			$('.extension').click(function(){
				$('.area_synopsis').height(1).height( $('.area_synopsis').prop('scrollHeight')+12 );
				$('.extension').css('visibility', 'collapse');
				$('.reduction').css('visibility', 'visible');
			});
			
			$('.reduction').click(function(){
				$('.area_synopsis').height(1).height( 70 );
				$('.reduction').css('visibility', 'collapse');
				$('.extension').css('visibility', 'visible');
			});
			
			
		});
		
		
		
	</script>

</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
	<c:set var="dto" value="${Cont }" />
	<c:set var="Avg" value="${Avg }" />
	<c:set var="page" value="${page }" />
			<c:if test="${!empty dto }">
				
			</c:if>
			
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>검색된 게시글이 없습니다..</h3>
					</td>
				</tr>
			</c:if>
	
	<div id="bg" class="bg"> 
		
		<div class="bg_img" align="center">
			<img src="resources/upload/info/${dto.getInfo_bgimg() }" width="1200">
		</div>
		<div class="bg_content">
			<div class="mov_title">
				${dto.getInfo_title() }
			</div>
			
			<div class="mov_poster">
				<img src="resources/upload/info/${dto.getInfo_thumbnail() }" width="260" height="330">
				<c:if test="${user.getUser_status() == 4 }">
						<button onclick="location.href='${pageContext.request.contextPath}/user_info_update.do?no=${dto.getInfo_no()}&page=${page }'" class="post_btn">수정</button>
						<button onclick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
							location.href='${pageContext.request.contextPath}/user_info_delete.do?no=${dto.getInfo_no() }&page=${page }'
							} else { return; }" class="post_btn">삭제</button>
				</c:if>	
			</div>
			
			<div class="mov_time">
				개봉일자 : ${dto.getInfo_year().substring(0, 10) } <br> 런타임 : ${dto.getInfo_runtime() }분 <br>
			</div>
			
			<div class="mov_info">
				<div class="stars">
					평점 : <span class="jum"><fmt:formatNumber value="${Avg }" pattern=".0" /></span> <span class="detail">(사용자 리뷰 평균)</span>
	             	
	         		<br>
	         		
	         		<div class="stars-background">
		               	<img src="<%=request.getContextPath() %>/resources/image/star_1.png" alt="별 사진">
	         		 </div>
	                <div class="stars-real" style="position:absolute; width:calc(42px * <fmt:formatNumber value="${Avg / 2}" pattern=".0" />); overflow:hidden; white-space:nowrap; letter-spacing: -10px;
	                			height: 42px;">                 
	                    <img src="<%=request.getContextPath() %>/resources/image/star_2.png" alt="별 사진">
	         		</div>
		        </div>
				
			</div>
			
			
		</div>
	</div>

	
	<div class="info_content">
	
		<div class="info_nav" id="topBar">
			
			<ul>
				<li id="info_menu1"><span id="info_menu1"><a id="info_menu1" href="#bg">주요정보</a></span></li>
				<li id="info_menu2"><span id="info_menu2"><a id="info_menu2" href="#teaser">예고편</a></span></li>
				<li id="info_menu3"><span id="info_menu3"><a id="info_menu3" href="#review">실관람평</a></span></li>
			</ul>
					
		</div>
		
		<div class="content_text">
			<div class="text_subtitle">
				${dto.getInfo_subtitle() }
			</div>
			
			<div class="text_synopsis">
			
				<textarea class="area_synopsis" readonly>${dto.getInfo_synopsis() }</textarea> 
				<br>
				<br>
				<br>
				
				<button class="extension"> 더 보기 &nbsp;&nbsp;<img src="resources/image/ico-btn-more-arr.png"> </button>
				<button class="reduction">
					닫기 &nbsp;&nbsp;<img src="resources/image/ico-btn-more-arr.png" style="transform: rotate(180deg);">
				</button>
				<textarea class="area_cast" readonly>${dto.getInfo_cast() }</textarea> 
			</div>
			
		</div>
	
		
		<div id="teaser" class="teaser">
			<span>예고편</span>
			<div class="video" align="center">
				${dto.getInfo_teaser() }
			</div>
		</div>
		
		<div id="review" class="review">
		
			<iframe src="./info_review.do?info_no=${dto.getInfo_no() }" frameborder="0" width="100%" height="1700" scrolling="no" name=banner ></iframe>
			
		</div>
	
	</div>
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>