package com.bombom.model;

import java.util.List;

public interface PremiereDAO {
	
	int getListCount();	// 전체 게시글 수 가져오기
	
	List<PremiereDTO> getBoardList(PremierePageDTO dto);	// 페이징 처리
		
	int insertBoard(PremiereDTO dto);	// 글 삽입
		
	PremiereDTO boardCont(int no);	// 글 내용 가져오기
		
	void readCount(int no);	// 조회수 증가
	
	int updateBoard(PremiereDTO dto);	// 글 수정
	
	int deleteBoard(int no);	// 글 삭제
		
	void updateSequence(int no);	// 글 삭제에 따른 글 번호 수정
	
	int searchBoardCount(String field, String keyword);	// 글 검색에 따른 게시글 수 반환
		
	List<PremiereDTO> searchBoardList(PremierePageDTO dto);	// 글 검색

}
