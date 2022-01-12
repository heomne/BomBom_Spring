package com.bombom.model;

import java.util.List;

public interface PremiereDAO {
	
	List<PremiereDTO> getBoardList();	// 전체 글 목록 가져오기
	
	List<PremiereDTO> getMainList();	// 홈 화면에 올라갈 글 목록 가져오기
	
	PremiereDTO boardCont(int no);	// 글 정보 가져오기
		
	int insertBoard(PremiereDTO dto);	// 글 삽입
	
	int updateBoard(PremiereDTO dto);	// 글 수정
	
	int deleteBoard(int no);	// 글 삭제
		
	void updateSequence(int no);	// 글 삭제에 따른 글 번호 수정
	
	List<PremiereDTO> searchBoardCount(String field, String keyword);	// 글 검색

}
