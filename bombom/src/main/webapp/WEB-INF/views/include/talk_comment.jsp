<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="info_block">
        <span>댓글</span>
        <span class="comment_count"></span>
    </div>

    <div class="cmt_notice">
        <span>❗ 글을 읽고 댓글을 달지않으면, 포인트가 깎여나갑니다 zz </span>
    </div>

    <div class="cmt_list">
<!-- 
        <div class="cmt_unit nested">
            <div class="cmt_header">
                <strong class="cmt_writer">영화여우</strong>
            </div>
            <div class="cmt_content">
                <div class="parent_cmt">
                    <span>💬</span>
                    <strong>밍구리</strong>
                </div>
                	그러게요 영화 보기전에 먹고 들어가시는 분들도 있더라구요
                <div class="cmt_date">
                    <span class="date_time">14:10</span>
                </div>

                <div class="cmt_btns">
                    <button type="button">답글</button>
                    <button type="button">👍 +0</button>
                </div>
            </div>
        </div>
-->				
					
        
    </div>
    
    <div class="cmt_write">
    	<form id="comment_form" action="${pageContext.request.contextPath}/user_comment.do" method="POST">
    		<input type="hidden" id="talk_no_comm" name="talk_no" value="${dto.getTalk_no()}"/>
    		<input type="hidden" id="user_id_comm" name="user_id" value="${session.user_id}"/>
         	<textarea cols="50" rows="4" id="comment_cont" name="comment_cont" placeholder="댓글을 입력해주세요"></textarea>
         	<div class="cmt_write_btns">
            	<button type="button" id="comment_insert">댓글 등록</button>
         	</div>
        </form>
    </div>

</body>
</html>