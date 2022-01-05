<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/css/info_detail.css?after">

<body>

	<div class="review_cont">
	
		<div class="review_guide">
			킹스맨 : 퍼스트 에이전트에 대한 <span>32</span>개의 이야기가 있어요 !
		</div>
		
		<form method="post"
			action="<%=request.getContextPath() %>/insert_info_review.do">
			
		<div class="insert_review">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				<!-- input type="hidden" name="" value="bombom" -->bombom
			</div>
			
			
			<input type="number" min="1" max="10" value="1" class="grade" name="grade" align="center">
			
			<textarea class="conts" placeholder="영화 재미있게 보셨나요? 영화에 대한 한줄평을 작성해주세요!" required="required"></textarea>
			
			<input type="submit" value="작성하기" class="doReview">
		</div>
		</form>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
		
		<div class="reviews">
			
			<div class="reviewer" align="center">
				<img src="resources/image/profile.png" width="70" height="70"> <br>
				bombom
			</div>
			
			<div class="grade" align="center">
				8
			</div>
			
			<div class="conts">
				어쩌고저쩌고
				
				<div class="conts_time">
					2021.01.05 12:28:32
				</div>
			</div>
		</div>
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
</body>
</html>