<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
	<script src="${pageContext.request.contextPath}/resources/js/premiere.js"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu4').attr('id', 'on');
			}
		);
		
	</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	<%-- 가로 배너 --%>
	
	<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">시사회</span>
	        <br>
	        <span class="sub_title">각종 시사회 정보를 확인하세요</span> 
	    </div>
    </div>
    	
	<div class="premiere_content" align="left">
		<%-- 여기에 작업 해야함 (좌우 여백 설정되어있음) --%>			
		<div class="premiere_title">
			<div class="premiere_text">
				<h2>진행중인 시사회</h2>
			</div>
					    
			<div class="premiere_notice" onclick="openModal('notice')">
				<img src="resources/image/공지사항 아이콘.png" alt="공지사항 아이콘" width="35px;" height="auto">
				<span class="notice_writer">시사회  당첨 확률 올리는 법</span>
				<span class="notice_date">21.11.30.</span>
			</div>
		</div>
		
		<%-- 더미컨텐츠 (필요시 .article, .content 사용) --%>
		<c:set var="list" value="${List }" />
		<!-- 글 목록 없을 경우 -->
		<c:if test="${empty list }">
			<h2>글 없습니다.</h2>
		</c:if>
		
		<!-- 글 있을 때 -->			
		<div class="premiere_list_wrap">	
		
		<!-- 옆에 따라다니는 바 -->
			 <div class="list_buttons">
			 <!-- 관리자만 글 쓰기 버튼 보여줌 -->
			 <c:if test="${!empty user }">
			  <c:if test="${user.getUser_nickname() eq '관리자'}">
				  <a href="<%=request.getContextPath() %>/premiere_write.do">
					<img src="resources/image/글 쓰기.png" alt="글쓰기 아이콘" width="35px;" height="auto">
				  </a><br>
			  </c:if>
			 </c:if>
			 
				<a href="">
				<img src="resources/image/검색.png" alt="검색 아이콘" width="35px;" height="auto">
				</a><br>
			</div>	
			
			<div class="premiere_content">
				<!-- 게시물 영역을 누르면 모달창으로 넘어갈 수 있도록 -->
				<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<div class="content_cards" onclick="openModal('${dto.getPremiere_no() }')">
				
				<!-- 오늘날짜 -->
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
				
				<!-- 비교할 날짜 -->
				<fmt:parseDate var="bdate" value="${dto.getPremiere_date()}" pattern="yyyy-MM-dd HH:mm:ss" />
				<fmt:formatDate var="oldday" value="${bdate}" pattern="yyyyMMdd" />
				
				<c:set var="dateCal" value="${today-oldday}"/>
					
				<!-- 게시글 작성일이 7일 전이면  N 딱지 보여주기-->	
				<c:if test="${dateCal<'7' }">
					<span class="new_atc">N</span>
				</c:if>
					<div class="content_img_wrapper">
						<img src="resources/upload/premiere/${dto.getPremiere_thumbnail() }" 
							alt="${dto.getPremiere_title() }">
					</div>
					<div class="content_body">
						<!-- 제목 문자열이 길면 자르자 -->
						<c:if test="${dto.getPremiere_title().length()>23 }">
							<p class="content_title">${dto.getPremiere_title().substring(0,22) }...</p>
						</c:if>
						<!-- 제목 문자열이 23자 이하면 그대로 보여주자 -->
						<c:if test="${dto.getPremiere_title().length()<=23 }">
							<p class="content_title">${dto.getPremiere_title() }</p>
						</c:if>
						
						<!-- 요약 문자열이 80자 초과하며 자르자  -->
						<c:if test="${dto.getPremiere_summary().length()>80 }">
							<p class="content_summary">${dto.getPremiere_summary().substring(0,80) }...</p>
						</c:if>
						<!-- 요약 문자열이 80자 이하면 그대로 보여주기  -->
						<c:if test="${dto.getPremiere_summary().length()<=80 }">
							<p class="content_summary">${dto.getPremiere_summary() }</p>
						</c:if>
						
						<!-- 오늘날짜와, 작성일자가 7일 미만 차이나면 '00일전'으로 표기되게 하기 -->
						<c:if test="${dateCal=='0'}">
							<p class="content_date">오늘</p>		
						</c:if>
						
						<c:if test="${dateCal<'7' && dateCal>'0'}">
							<p class="content_date">${dateCal}일 전</p>		
						</c:if>
						
						<c:if test="${dateCal>='7'}">
							<p class="content_date">${dto.getPremiere_date().substring(0,10) }</p>		
						</c:if>
					</div>
				</div>
				</c:forEach>	
				</c:if>
         	</div>
     	</div>
   </div>   
	
	<!-- 모달창 -->	
	<c:forEach items="${list }" var="dto">
	<div id="modal" onclick="closeAllModal()"></div>
	  	<div class="modal-con ${dto.getPremiere_no() }">
	  		<div class="close">	  		
	  			<a href="javascript:closeAllModal();">X</a>
	  		</div>
		    <div class="title">
		    	<h1>${dto.getPremiere_title() }</h1>
		    </div>
		    <div class="writer_date">
		    	<img src="resources/image/관리자.png" alt="관리자 아이콘" width="30px;" height="auto">
		    	<span class="writer">관리자</span>
		    	<span class="date">${dto.getPremiere_date().substring(0,10) }</span>
		    	<!-- 관리자들만 수정/삭제 버튼이 보일 수 있게끔 -->
		    	<c:if test="${!empty user }">
					<c:if test="${user.getUser_nickname() eq '관리자'}">
						<div class="modify_remove wrap_common">
	                    <a href="premiere_update.do?no=${dto.getPremiere_no() }">수정</a>
	                    <a href="premiere_delete.do?no=${dto.getPremiere_no() }"
	                    onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
                		</div>
					</c:if>
				</c:if>	
		    	<!-- <span class="comment">💭 2</span> -->
		    </div>
		    <div class="con">
		    	${dto.getPremiere_cont() }
				<br><br>
				<!-- 댓글창 -->
                <!-- <div class="comment_block" align="left">
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
                        <textarea cols="50" rows="4" placeholder="댓글을 입력해주세요" style="resize: none;" required="required"></textarea>
                        <div class="cmt_write_btns">
                            <button>댓글 등록</button>
                        </div>
                    </div>
                </div> -->
            </div>            
         </div> 
        </div>	<!-- modal1 창 end -->
        </c:forEach>
         
         <!-- 공지사항 모달 -->
         <div id="modal" onclick="closeAllModal()"></div>
         <div class="modal-con notice">
	  		<div class="close">	  		
	  			<a href="javascript:closeAllModal();">X</a>
	  		</div>
		    <div class="title">
		    	<h1>시사회 당첨 확률 올리는 법</h1>
		    </div>
		    <div class="writer_date">
		    	<img src="resources/image/관리자.png" alt="관리자 아이콘" width="35px;" height="auto">
		    	<span class="writer">관리자</span>
		    	<span class="date">2021.12.30. 20:05</span>
		    	<span></span>
		    	<!-- 관리자들만 수정/삭제 버튼이 보일 수 있게끔 -->
		    	<c:if test="${!empty user }">
					<c:if test="${user.getUser_nickname() eq '관리자'}">
						<div class="modify_remove wrap_common">
	                    <a href="premiere_update.do?no=${dto.getPremiere_no() }">수정</a>
	                    <a href="premiere_delete.do?no=${dto.getPremiere_no() }"
	                    onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
                		</div>
					</c:if>
				</c:if>	
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