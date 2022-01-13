<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>봄봄 :: 이 영화 봄?봄!</title>
	<link rel="icon" type="image/png" sizes="192x192" href="resources/image/favicon.png" />

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/mypage.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false"/>
	<!-- 상단 배너 -->
	<div class="mypage_top"></div>
	
	<div class="mypage_content">
	
	<!-- 작성글 -->
	<c:set value="${userWriteBoard }" var="board"/>
	<c:set value="${totalBoard }" var="boardCount"/>
	<c:set value="${userLikeBoard }" var="like"/>
	<c:set value="${userWriteComment }" var="comment"/>
		
	<!-- 공지사항 -->
	<div class="notice">
 			<img id="notice" alt="" src="resources/image/notice.png"
				onclick="location.href='${pageContext.request.contextPath}/user_notice.do'">
			<div class="notice_content">
				<div class="content_container">
					<ul class="content_container_list">
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=3&page=1">[공지사항] 영화수다 게시판 이용 관련 공지사항입니다.</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=4&page=1">[공지사항] 신규기능 '극장맛집' 탭 소개 및 이용안내</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=5&page=1">[공지사항] 2022년 개봉예정작 시사회 일정 안내</a>
				      </li>
				      <li class="content_container_list_item">
				      	<a href="<%= request.getContextPath() %>/user_notice_cont.do?no=6&page=1">봄봄 커뮤니티에 오신 것을 환영합니다.</a>
				      </li>
				    </ul>
			    </div>
		    </div>
		</div>
	
	<div class="myInfo_wrap">		
		<div class="myInfo_1">
		<!-- 일반 회원 중에, 성별이 여자면 여자프로필, 남자면 남자프로필 보여줌 -->
		<c:if test="${user.getUser_gender() == '남성' || empty user.getUser_gender()}">
			<img src="resources/image/남자 프로필.png" 
			onclick="location.href='${pageContext.request.contextPath}/user_join_update.do'" alt="프로필" width="100px;" height="100px;">
			<br>
		</c:if>
		
		<c:if test="${user.getUser_gender() == '여성' }">
			<img src="resources/image/여자 프로필.png" 
			onclick="location.href='${pageContext.request.contextPath}/user_join_update.do'" alt="프로필" width="100px;" height="100px;">
			<br>
		</c:if>
		
			<div onclick="location.href='${pageContext.request.contextPath}/user_join_update.do'"
				style="cursor: pointer;"><span class="name">${user.getUser_name() }</span><span> 님 ></span></div>
			<p style="font-size: 15px;">일반회원</p>
			<p style="font-size: 15px;">내 가입일 : ${user.getUser_regdate().substring(0,10) }</p>
		
			<div class="myInfo_sideMenu" align="left">
				<p onclick="location.href='${pageContext.request.contextPath}/user_join_update.do'">회원정보 수정</p>
				<br><br>
				<p>작성한 글</p>
				<p>작성한 댓글</p>
				<p>좋아요 한 글</p>
				<p>작성한 영화리뷰</p>
				<br><br>
				<p>회원 탈퇴하기</p>
			</div>
		
		</div>
		
		<div class="myInfo_2">
			<p style="margin: 0">나의 활동</p>	
				
			<div class="box">
				<div class="box1">
					<c:if test="${!empty board }">
						<p class="count">${boardCount }</p>
					</c:if>
					
					<c:if test="${empty board }">
						<p class="count">0</p>
					</c:if>
					<p class="title">작성한 글</p>
				</div>
				
				<div class="box2">
					<p class="count">2</p>
					<p class="title">작성한 댓글</p>
				</div>
				
				<div class="box3">
					<c:if test="${!empty like }">
						<p class="count">${fn:length(like) }</p>
					</c:if>
					
					<c:if test="${empty like }">
						<p class="count">0</p>
					</c:if>
					<p class="title">좋아요 한 글</p>				
				</div>
				
				<div class="box4">
					<p class="count">0</p>
					<p class="title">영화 리뷰</p>				
				</div>
			</div>
			
			<div class="myInfo_board">
				<div class="myInfo_board_title"><span style="float: left;">작성한 게시글</span>
					<span style="float: right; font-size: 13px; font-weight: normal;">최근 작성한 5개 게시글만 노출됩니다.</span></div>
				<table width="100%">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    
                    <c:if test="${empty board }">
                    	<tr>
                    		<td colspan="4">
                    		<p style="font-weight: normal; color: #fb4357;">작성한 게시글이 없습니다.</p></td>
                    	</tr>
                    </c:if>
                    
                    <c:if test="${!empty board }">
                    <c:forEach var="board" items="${board}">                    
						<tr>
	                        <td>${board.getTalk_no() }</td>
	                        <td class="title_left">
	                            <a href="${pageContext.request.contextPath}/user_talk.do/${board.getTalk_no()}">
	                            	${board.getTalk_title()}
	                            	<c:if test="${board.getCnt() != 0 }">
	                            		<span class="cmt">(${board.getCnt()})</span>
	                            	</c:if>
	                            </a>
	                        </td>
	                        <td>${board.getTalk_date().substring(0,10) }</td>	                        
	                        <td>${board.getTalk_hit()}</td>
	                    </tr>
	                    </c:forEach>
					</c:if>
                </table>
			</div>
			
			<div class="myInfo_comment">
			<p>작성한 댓글 </p>
				<div class="myInfo_comment_content">
					<div><span class="comment">아 진짜요?ㄷㄷ 어마무시하네요</span>&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;">22.01.11</span></div>
					<div><span class="title">원문제목 : 이번주 굿즈는 예상을 빗나간게 많네요 ㅋㅋ</span><span class="title_com_count">(2)</span></div>
		
				</div>
				
				<div class="myInfo_comment_content">
					<div><span class="comment">그러게요 대기자 진짜 많네요 </span>&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;">22.01.11</span></div>
					<div><span class="title">원문제목 : 홍대 메박 오티 대기자 생각보다 있네요.</span><span class="title_com_count">(1)</span></div>
				</div>
			</div>
			
			
			<div class="myInfo_like">
			<p>좋아요 한 글</p>
				<table width="100%">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                    </tr>
                    
                    <c:if test="${empty like }">
                    	<tr>
                    		<td colspan="4"><p style="font-weight: normal; color: #fb4357;">좋아요 한 게시글이 없습니다.</p></td>
                    	</tr>
                    </c:if>
                    
                    <c:if test="${!empty like }">
                    <c:forEach var="like" items="${like}">                    
						<tr>
	                        <td>${like.getTalk_no() }</td>
	                        <td class="title_left">
	                            <a href="${pageContext.request.contextPath}/user_talk.do/${like.getTalk_no()}">
	                            	${like.getTalk_title()}
	                            	<c:if test="${like.getCnt() != 0 }">
	                            		<span class="cmt">(${like.getCnt()})</span>
	                            	</c:if>
	                            </a>
	                        </td>
	                        <td>${like.getUser_id() }</td>	                        
	                        <td>${like.getTalk_date().substring(0,10) }</td>
	                    </tr>
	                    </c:forEach>
					</c:if>
                </table>
			</div>
			
			<div class="myInfo_review">
			<p>작성한 영화리뷰</p>
			<p style="font-weight: normal; color: #fb4357;">아직 작성한 영화 리뷰가 없습니다.</p>	
			</div>
			
		</div>
		
		</div>
	</div>
	
	<br><br><br>
	
	
	<jsp:include page="../include/footer.jsp" flush="false"/>	

</body>
</html>