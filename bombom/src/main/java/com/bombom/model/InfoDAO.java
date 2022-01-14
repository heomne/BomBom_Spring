package com.bombom.model;

import java.util.List;

public interface InfoDAO {

int getInfoCount();	// 전체 게시글 수 가져오기
	
List<InfoDTO> getInfoList(InfoPageDTO dto);	// 페이징 처리

List<InfoDTO> getInfoListReviews(InfoPageDTO dto);

List<InfoDTO> getInfoListTime(InfoPageDTO dto);
	
int insertInfo(InfoDTO dto);	// 글 삽입
	
InfoDTO infoCont(int no);	// 글 내용 가져오기

int updateInfo(InfoDTO dto);	// 글 수정

int deleteInfo(int no);	// 글 삭제

int deleteReview(int no);	// 리뷰 삭제

int searchInfoCount(String keyword);	// 글 검색에 따른 게시글 수 반환
	
List<InfoDTO> searchInfoList(InfoPageDTO dto);	// 글 검색

int insertReview(InfoReviewDTO dto);	// 리뷰 삽입

List<InfoReviewDTO> getReviewList(InfoPageDTO dto);  // 리뷰 내용 

int getReviewCount(int no);	// 전체 리뷰 수 가져오기

void updateReviews(int no);

Double getAvg(int no);	// 평점 평균 가져오기

List<InfoDTO> getMainList();
}
