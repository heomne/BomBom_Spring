package com.bombom.model;

import lombok.Data;

@Data
// 봄봄소식 
public class NoticeDTO {
	
	private int news_no;
	private String news_title;
	private String news_cont;
	private String news_writer;
	private String news_date;
	private int news_hit;
	
}
