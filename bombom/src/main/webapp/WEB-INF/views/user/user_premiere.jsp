<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화커뮤니티 : 봄봄</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/home.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/premiere.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu4').attr('id', 'on');
			}
		);
		
		// 모달창 열기
		function openModal(modalname){
		  document.get
		  $("#modal").show();
		  $("."+modalname).show();
		  
		  //body 스크롤 방지
		  document.body.classList.add("stop-scroll");
		}
		
		// 모달창 닫기(close 버튼 누르기)		
		function closeModal(modalname){
		  document.get
		  $("#modal").hide();
		  $("."+modalname).hide();
		  //body 스크롤 방지 해제
		  document.body.classList.remove("stop-scroll");
		}
		
		$("#modal").click(function(){
			$("#modal").hide();
			 $(".modal-con").hide();
			 //body 스크롤 방지 해제
			 document.body.classList.remove("stop-scroll");
		});
		
	</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	<%-- 가로 배너 들어갈 위치 --%>
	
	<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">시사회</span>
	        <br>
	        <span class="sub_title">각종 시사회 정보를 확인하세요</span> 
	    </div>
    </div>
    
    <!-- 옆에 따라다니는 바 -->
	 <div class="list_buttons">
		<div>
			<a href="">✐</a><br>
			<a href="">🔍</a>
		</div>
	</div>
    	
	<div class="content">
		<%-- 여기에 작업 해야함 (좌우 여백 설정되어있음) --%>			
		
		<div class="premiere_title">
			<div class="premiere_text">
				<h2>진행중인 시사회</h2>
			</div>
			<div class="premiere_notice">
				<ul>
					<li>
						<img src="resources/image/공지사항 아이콘.png" alt="공지사항 아이콘" width="35px;" height="auto">
						<!-- <span class="notice_button">공지</span> -->
						<a href="javascript:openModal('notice');">시사회  당첨 확률 올리는 법</a>
						<span class="notice_date">21.12.30.</span>
					</li>
				</ul>	
			</div>
		</div>
		
		<%-- 더미컨텐츠 (필요시 .article, .content 사용) --%>
		<div class="premiere_list_wrap">
			<div class="premiere_content">
				<!-- 게시물 영역을 누르면 모달창으로 넘어갈 수 있도록 -->
				<a href="javascript:openModal('modal1');">
					<div class="content_cards">
						<span class="new_atc">N</span>
						<img src="resources/image/premiere_poster.jpg" alt="'청춘적니' 한줄평/리뷰 이벤트">
						<div class="content_body">
							<p class="content_title">'청춘적니' 한줄평/리뷰 이벤트</p>
							<p class="content_summary">영화 '청춘적니' 한줄평/리뷰 이벤트입니다. '청춘적니' 관람 후 아직 못 본 분...</p>
							<p class="content_date">2일전</p>
						</div>
					</div>
				</a> 
			
				<a href="javascript:openModal();">
					<div class="content_cards">
						<span class="new_atc">N</span>
						<img src="resources/image/premiere_poster2.jpg" alt="'스피드 : 레이스 1' 언론 배급 시사회에 초대합니다.">
						<div class="content_body">
							<p class="content_title">'스피드 : 레이스 1' ...</p>
							<p class="content_summary">● 본 시사회는 백신 접종 완료자만 입장 가능합니다. (글 하단 안내문 꼭 참조하...</p>
							<p class="content_date">3일전</p>
						</div>
					</div>
				</a> 
				
				<div class="content_cards">
					<h1>시사회정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>시사회정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>시사회정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>시사회정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>시사회정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>시사회정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
				
				<div class="content_cards">
					<h1>시사회정보 본문 내용 들어갈 자리</h1>
					<p>어쩌고저쩌고</p>
				</div>
		
	            <div class="paging" align="center">
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
	
	<!-- 모달창 -->
	<div id="modal"></div>
	  	<div class="modal-con modal1">
	  		<div class="close">	  		
	  			<a href="javascript:closeModal('modal1');">X</a>
	  		</div>
		    <div class="title">
		    	<h1>'청춘적니' 한줄평/리뷰 이벤트</h1>
		    </div>
		    <div class="writer_date">
		    	<img src="resources/image/관리자.png" alt="관리자 아이콘" width="30px;" height="auto">
		    	<span class="writer">관리자</span>
		    	<span class="date">2021.12.30. 20:05</span>
		    	<span class="comment">💭 2</span>
		    </div>
		    <div class="con">
		    	<iframe width="900" height="506" src="https://www.youtube.com/embed/RpGcghLkmUU" title="YouTube video player"
		    	 frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		    	<img src="resources/image/premiere_body2.jpg" alt="'청춘적니' 한줄평/리뷰 이벤트"
		    		 width="80%" height="auto">
		    	<pre>
<b>영화 &lt;청춘적니&gt; 한줄평/리뷰 이벤트입니다.</b>
&lt;청춘적니&gt; 관람 후 아직 못 본 분들에게 추천하는 한줄평을 아래 댓글란에 달아주세요.
참여하신 분 중 15분을 뽑아서 &lt;청춘적니&gt; 굿즈 풀세트(5명), 스타벅스 돌체라테 기프티콘(10명)을 드립니다.

영화수다 게시판에 감상평(리뷰)를 작성한 분들은 그 글 주소도 같이 댓글에 남겨주시면 더욱 좋습니다.
<i>(작성하신 후기는 마케팅 용도로 활용될 수 있습니다.)</i>

<b>이벤트 참여 방법</b>
아래 댓글란에 &lt;청춘적니&gt; 한줄평 남기기.
(영화수다에 리뷰를 쓴 사람은 리뷰 글 주소를 같이 붙이면 OK)

<b>경품</b>
 - &lt;청춘적니&gt; 굿즈 풀세트 : 5명 
  ㄴ 구성 : &lt;청춘적니&gt; A3 포스터 3종 + 중국 오리지널 티켓 + 폴라로이드 엽서 세트(아래 사진 참조)
 - 스타벅스 돌체라떼 기프티콘 : 10명

<b>당첨자 발표:</b> 1월 15일(토)

많은 참여 부탁드립니다.</pre>
		
				<br><br>
				<!-- 댓글창 -->
                <div class="comment_block" align="left">
                <div class="info_block">
                    <span>댓글</span>
                    <span class="comment_count">(2)</span>
                </div>

                <div class="cmt_notice">
                    <span>❗ 글을 읽고 댓글을 달지않으면, 시사회 당첨 확률이 떨어집니다❗</span>
                </div>

                <div class="cmt_list">

                    <div class="cmt_unit">
                        <div class="cmt_header">
                            <strong class="cmt_writer">진진자라</strong>
                            <div class="modify_remove">
                                <a href="">수정</a>
                                <a href="">삭제</a>
                            </div>
                        </div>
                        <div class="cmt_content">
                            	20대 청춘의 평범하지만 뜨거운 사랑 이야기, 올 겨울 우리 맘을 따듯하게 해주는 영화, 청춘적니, 많관부!
                            <div class="cmt_date">
                                <span class="date_time">5일전</span>
                            </div>

                            <div class="cmt_btns">
                                <button type="button">답글</button>
                                <button type="button">👍 +0</button>
                            </div>
                        </div>
                    </div>

                    <div class="cmt_unit nested">
                        <div class="cmt_header">
                            <strong class="cmt_writer">나는야스파이더맨</strong>
                        </div>
                        <div class="cmt_content">
                            <div class="parent_cmt">
                                <span>💬</span>
                                <strong>진진자라</strong>
                            </div>
                            	이게 그렇게 재밌나요??
                            <div class="cmt_date">
                                <span class="date_time">5일전</span>
                            </div>

                            <div class="cmt_btns">
                                <button type="button">답글</button>
                                <button type="button">👍 +0</button>
                            </div>
                        </div>
                    </div>

                    <div class="cmt_write">
                        <textarea cols="50" rows="4" placeholder="댓글을 입력해주세요"></textarea>
                        <div class="cmt_write_btns">
                            <button>댓글 등록</button>
                        </div>
                    </div>
                </div>

            </div>            
         </div> 
        </div>	<!-- modal1 창 end -->
         
         <!-- 공지사항 모달 -->
         <div class="modal-con notice">
	  		<div class="close">	  		
	  			<a href="javascript:closeModal('notice');">X</a>
	  		</div>
		    <div class="title">
		    	<h1>시사회 당첨 확률 올리는 법</h1>
		    </div>
		    <div class="writer_date">
		    	<img src="resources/image/관리자.png" alt="관리자 아이콘" width="35px;" height="auto">
		    	<span class="writer">관리자</spans>
		    	<span class="date">2021.12.30. 20:05</span>
		    </div>
		    <div class="con">
<pre>
시사회,예매권,경품등 통합해서

당첨확률을 올리는 팁입니다

 

일단 당첨자 비율

- 고레벨 우선 당첨 배려

- 저레벨이어도 최근 활동이 우수한 경우

- 신규 익무인

 

익무는 뉴비를 차별하지 않습니다

최소한의 활동 의지만 보이면 당첨될수 있습니다.

뉴비의 경우 프로필 이미지 있고 없고 굉장히 중요해요

뉴비인데 당첨이 잘된다!... 그럼에도 활동이 없으면 찍히는 거예요

 

그리고 좌석이 적은 경우는 아무래도 익무 활동이 우수한 분들에게

우선적으로 돌아갈수밖에 없습니다.

 

레벨보다 더 중요한것은 최근활동입니다

레벨이 높아도 게시판에 한동안 보이지 않으면 떨어집니다

고레벨인데다 최근활동까지 우수한데 떨어졌다?

이런 경우는 특별한 이유가 있어서가 아니라, 그냥 깜빡해서 그렇습니다 (-_-)

 

경품관련

- 최근 활동이 절반 정도 반영됩니다

- 경품을 타기 위한 사냥꾼모드의 반짝 글쓰기는 거의 떨어집니다

- 사냥꾼도 간혹 당첨이 될수 있는데, 익무 활동을 권장하는 의미에서 뽑습니다

 

그리고 시사회나 이벤트 관련해서 저에게 쪽지로 문의해서는 안되는 내용입니다

이 4가지는 쪽지로 자주 왔던 내용들입니다

 

- 시사회 장소 가는법 알려줘

- 티켓 배부 어디서 하는지 알려줘

- 일이 생겨서 그런데 티켓 양도 어찌 하니 

- 왜 나를 떨어트렸는지 해명해봐

 

결론은 레벨 상관없이 최근 활동이 우수하면

당첨확률은 쭉~! 올라갑니다

레벨높은데 최근활동까지 우수하면 시사회는 거의 100%라고 봐도...

 

마지막 팁 하나...

제가 쓰는 글에 댓글 자주 다시는 분은 자동적으로 닉네임을 기억하게 됩니다

은근히 당첨확률 높이는 지름길이에요...</pre>

		    	<br>		
         </div> 
      </div> <!-- notice 창 end --> 
   
   <jsp:include page="../include/footer.jsp" flush="false"/>
</body>
</html>