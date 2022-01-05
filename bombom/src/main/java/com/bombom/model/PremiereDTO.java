package com.bombom.model;

import lombok.Data;

@Data
// 시사회 게시판 DTO
public class PremiereDTO {
	
	private int premiere_no;	// 글 번호
	private String premiere_thumbnail;	// 썸네일
	private String premiere_title;	// 제목
	private String premiere_cont;	// 글 내용
	private String premiere_upload; // 업로드 파일
	private String premiere_date;	// 글 작성일시
}
