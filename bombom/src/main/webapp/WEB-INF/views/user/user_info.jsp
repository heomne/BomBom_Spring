<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<!-- <div class="info_banner">
		<div class="banner_text">
			<h1>영화 정보</h1>
			<h4>상영중인 영화의 정보를 한눈에!</h4>
		</div>
	</div> -->
	
	<div class="content">
	
		<%-- 여기에 작업 해야함 (좌우 여백 설정되어있음) --%>
		
		<div class="info_title">
			<div class="title_text">
				<h2>* 영화정보</h2>
			</div>
			<div class="info_array">
				최신 순 | 인기 순 | 댓글 순
		
			</div>
		</div>
		<%-- 더미컨텐츠 (필요시 .article, .content 사용) --%>
			
		<div class="article">
			<div class="info_content">
			
				<a class="content_cards" href="info_detail.do">
					<div class="cards_image">
						<img src="resources/image/kings_man.jpg" >
					</div>
					<div class="cards_cont">
						<div class="cont_title">
							킹스맨 : 퍼스트 에이전트
						</div>
						<div class="cont_text">
							안녕하세요 테스트입니다 안녕하세요 테스트입니다 안녕하세요 테스트입니다 안녕하세요 테스트입니다
						</div>
					</div>
				</a>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>영화정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				
                <div class="paging">
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
                </div>
      
			</div>
		</div>

	</div>
	
	<jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>