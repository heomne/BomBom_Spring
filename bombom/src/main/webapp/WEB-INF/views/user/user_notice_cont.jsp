<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- header, home, footer.css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/header.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/user_food.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css?after">
	<link rel="stylesheet" type="text/css" href="resources/css/notice_cont.css?after">
	
	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>
		
		//문서 로딩 후 선택메뉴 css 변경
		$(document).ready(function(){
			$('.menu0').attr('id', 'on');
			}
		);
		
	</script>


</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false"/>
	
		<div class="jumbotron">
	    <div class="textBlock1">
	        <span class="main_title">봄봄소식</span>
	        <br>
	        <span class="sub_title">커뮤니티 봄봄의 이모저모를 담은 공간</span> 
	    </div>
    </div>
    
    	<div class="boardArea">
    		<table  widht="1000px" border="1" align="center" cellspacing="0">
    			<tr>
    				<th>제목</th>
    				<td>ddddddddddddddddddddddddddddddddddddd</td>
    			</tr>
    			
    			<tr>
    				<th>글내용</th>
    				<td><textarea rows="8" cols="30"></textarea> </td>
    			</tr>
    		
    		
    		</table>
    	
    	
    	
    	</div>
    
    
    



	<jsp:include page="../include/footer.jsp" flush="false"/>

</body>
</html>