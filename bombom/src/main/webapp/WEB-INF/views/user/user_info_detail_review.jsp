<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" type="text/css" href="resources/css/info_detail.css?after">

<body>
	<c:set var="list" value="${List }" />
	<c:set var="dto" value="${Paging }" />
	<c:set var="Record" value="${Record }" />
	<c:set var="Cont" value="${Cont }" />
	
	<div class="review_cont">
	
		<div class="review_guide">
			${Cont.getInfo_title() }에 대한 <span>${Record }</span>개의 이야기가 있어요 !
		</div>
		
		<form method="post"
			action="<%=request.getContextPath() %>/insert_info_review.do">
			
		<div class="insert_review">
			<c:if test="${!empty user }">
				<div class="reviewer" align="center">
					<img src="resources/image/profile.png" width="70" height="70"> <br>
					<input type="hidden" name="user_nickname" value="${user.getUser_nickname() }"> 
					<input type="hidden" name="user_id" value="${user.getUser_id() }">
					<input type="hidden" name="info_no" value="${param.info_no }">
					${user.getUser_nickname() }
				</div>
				
				
				<input type="number" name="review_rate" min="1" max="10" value="10" class="grade" name="grade" align="center">
				
				<textarea class="conts" name="review_cont" placeholder="영화 재미있게 보셨나요? 영화에 대한 한줄평을 작성해주세요!" required="required" style="resize: none;"></textarea>
				
				<input type="submit" value="작성하기" class="doReview">
			</c:if>
			
			<c:if test="${empty user }">
				<div class="reviewer" align="center">
					<img src="resources/image/profile.png" width="70" height="70"> <br>
					<input type="hidden" name="user_nickname" value="bombom"> bombom
				</div>
				
				
				<input type="number" name="review_rate" min="1" max="10" value="10" class="grade" name="grade" align="center">
				
				<textarea class="conts" name="review_cont" placeholder="로그인을 해주세요 !" required="required" style="resize: none;" readonly></textarea>
				
				<input type="submit" value="작성하기" class="doReview">
			</c:if>
		</div>
		</form>
		
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="i">
				<div class="reviews">
					
					<div class="reviewer" align="center">
						<img src="resources/image/profile.png" width="70" height="70"> <br>
						${i.getUser_nickname() }
					</div>
					
					<div class="grade" align="center">
						${i.getReview_rate() }
					</div>
					
					<div class="conts">
						${i.getReview_cont() }
						
						<div class="conts_time">
							${i.getReview_date().substring(0, 10) }
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		
		
		
		
	</div>
	
	<div class="paging">
        <c:if test="${dto.getPage() > dto.getBlock() }">
			<a href="${pageContext.request.contextPath}/info_review.do?no=${Cont.getInfo_no()}&page=1" class="paging_first"><<</a>
			<a href="${pageContext.request.contextPath}/info_review.do?no=${Cont.getInfo_no()}&page=${dto.getStartBlock() - 1 }" class="paging_prev"><</a>
		</c:if>
		
		<c:forEach begin="${dto.getStartBlock() }" 
				end="${dto.getEndBlock() }" var="i">
			<c:if test="${i == dto.getPage() }">
				<b> <a href="${pageContext.request.contextPath}/info_review.do?no=${Cont.getInfo_no()}&page=${i }" class="paging_number_active">${i }</a></b>
			</c:if>		
			
			<c:if test="${i != dto.getPage() }">
				<a href="${pageContext.request.contextPath}/info_review.do?no=${Cont.getInfo_no()}&page=${i }" class="paging_number">${i }</a>
			</c:if>		
		</c:forEach>
		
		<c:if test="${dto.getEndBlock() < dto.getAllPage() }">
			<a href="${pageContext.request.contextPath}/info_review.do?no=${Cont.getInfo_no()}&page=${dto.getEndBlock() + 1 }" class="paging_next">></a>
			<a href="${pageContext.request.contextPath}/info_review.do?no=${Cont.getInfo_no()}&page=${dto.getAllPage()}" class="paging_last">>></a>
		</c:if>
    </div>
</body>
</html>