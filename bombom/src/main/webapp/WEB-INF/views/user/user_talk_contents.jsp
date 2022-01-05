<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화커뮤니티 : 봄봄</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contents.css?after"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/talk.css?after"/>

	<%-- jQuery --%>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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
            <span class="main_title">영화수다</span>
            <br>
            <span class="sub_title">봄봄인들의 수다공간</span> 
        </div>
    </div>

	<div class="container">
        <div class="content_area">
            <header>
                <div class="title">
                    <h1>킹스맨 재밌네요.</h1>
                </div>
                <div class="info_block">
                    <div class="info_left">
                        <span class="writer">BomBom_user</span>
                        <span class="date">2022.01.03</span>
                    </div>

                    <div class="info_right">
                        <span class="hit">👁5864</span>
                        <span class="like">👍5</span>
                        <span class="comment">💭3</span>
                    </div>
                </div>
            </header>
            
            <article>
                <div class="board_content">
                    	안녕하세요. 킹스맨 정말 재밌네요
                    <br>
                    	너무 재밌어요 꼭 보세요.
                    <br>
                   	 저는 CGV에서 봤어요
                    <br>
                    	팝콘은 안에서 못먹는데 밖에서 먹고들어가래요
                    <br>
                    	팝콘없으면 영화 왜보나요
                    
                </div>
            </article>

            <div class="content_like">
                <button type="button" class="like">👍 5</button>
            </div>



            <div class="comment_block">
                <div class="info_block">
                    <span>댓글</span>
                    <span class="comment_count">(6)</span>
                </div>

                <div class="cmt_notice">
                    <span>❗ 글을 읽고 댓글을 달지않으면, 포인트가 깎여나갑니다 zz </span>
                </div>

                <div class="cmt_list">

                    <div class="cmt_unit">
                        <div class="cmt_header">
                            <strong class="cmt_writer">밍구리</strong>
                            <div class="modify_remove">
                                <a href="#modify">수정</a>
                                <a href="#remove">삭제</a>
                            </div>
                        </div>
                        <div class="cmt_content">
                            	영화관에서 왜 파는지 모르겠어요 어차피 안에 들어가면 못먹는데 
                            <div class="cmt_date">
                                <span class="date_time">13:22</span>
                            </div>

                            <div class="cmt_btns">
                                <button type="button">답글</button>
                                <button type="button">👍 +0</button>
                            </div>
                        </div>
                    </div>

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

                    <div class="cmt_unit">
                        <div class="cmt_header">
                            <strong class="cmt_writer">소보르</strong>
                        </div>
                        <div class="cmt_content">
                            	음료수는 반입되니까 그거라도 다행이네요 .. ^^
                            
                            <div class="cmt_date">
                                <span class="date_time">13:22</span>
                            </div>

                            <div class="cmt_btns">
                                <button type="button">답글</button>
                                <button type="button">👍 +0</button>
                            </div>
                        </div>
                    </div>

                    <div class="cmt_unit">
                        <div class="cmt_header">
                            <strong class="cmt_writer">Marble</strong>
                        </div>
                        <div class="cmt_content">
                            	그러게요 영화관에서 팝콘 무조건 필수템인데ㅁㄴㅇㄻㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹ
                            <br>
                            	ㅁㄴㅇㄻㄴㅇㄹㄴㅁㅇㄻㄴㅇㄹ;ㅁ니ㅓㅇㄹ;미나얼;미나얼;ㅣㅁ나ㅓㅇㄹ;ㅣㄴ마얼;ㅣㅁ나ㅓㅇㄹ;니ㅏㅓㄹ;ㅣ마널
                            <div class="cmt_date">
                                <span class="date_time">13:22</span>
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

        <div class="list_area">
            <div class="board">
                <table width="100%">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>

                    <tr class="hot">
                        <td>
                            <span class="hot">HOT</span>
                        </td>
                        <td>
                            <a href="#">table-layout auto test</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <a href="#">글이 어디까지써지나알아보자얼아러아런ㅇㄹㄴㅇㄹㄴㅇ</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <a href="#">글이 어디까지써지나알아보자얼아러아런ㅇㄹㄴㅇㄹㄴㅇ</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>
                            <a href="#">글이 어디까지써지나ㅈㄷㄱ러아런ㅇㄹㄴㅇㄹㄴㅇ</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>

                    <tr>
                        <td>5</td>
                        <td>
                            <a href="#">글이 ㄴㅇ</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>

                    <tr>
                        <td>6</td>
                        <td>
                            <a href="#">글이 어디까지써지나알아보자얼아러아런ㅇㄹㄴㅇㄹㄴㅇ</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>

                    <tr>
                        <td>7</td>
                        <td>
                            <a href="#">글이 어디까지써지나알아보자얼아러아런ㅇㄹㄴㅇㄹㄴㅇ</a>
                        </td>
                        <td>
                            <a href="#">heasasdasdqweo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>

                    <tr>
                        <td>8</td>
                        <td>
                            <a href="#">글이 어디까지써지나알아보자얼아러아런ㅇㄹㄴㅇㄹㄴㅇ</a>
                        </td>
                        <td>
                            <a href="#">heo</a>
                        </td>
                        <td>2021.12.30</td>
                        <td>5</td>
                    </tr>


                </table>
            </div>

            <div class="board_footer">
                <div class="board_bottom">
                    <button type="button" class="search_btn">🔎</button>
                    <a href="${pageContext.request.contextPath}/user_write.do" class="post_btn">글쓰기</a>
                </div>

                <div class="paging">
                    <a href="#" class="paging_first"><<</a>
                    <a href="#" class="paging_prev"><</a>
                    <a href="#" class="paging_number_active" disabled>1</a>
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