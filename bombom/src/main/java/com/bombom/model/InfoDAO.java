package com.bombom.model;

import java.util.List;

public interface InfoDAO {

int getListCount();	// 전체 게시글 수 가져오기
	
List<InfoDTO> getBoardList(PremierePageDTO dto);	// 페이징 처리
	
int insertBoard(InfoDTO dto);	// 글 삽입
	
InfoDTO boardCont(int no);	// 글 내용 가져오기

int updateBoard(InfoDTO dto);	// 글 수정

int deleteBoard(int no);	// 글 삭제
	
void updateSequence(int no);	// 글 삭제에 따른 글 번호 수정

int searchBoardCount(String field, String keyword);	// 글 검색에 따른 게시글 수 반환
	
List<InfoDTO> searchBoardList(PremierePageDTO dto);	// 글 검색
}
