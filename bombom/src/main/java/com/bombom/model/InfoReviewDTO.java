package com.bombom.model;

import lombok.Data;

@Data
public class InfoReviewDTO {

	private int info_no;
	private String user_id;
	private String user_nickname;
	private int review_no;
	private String review_cont;
	private int review_rate;
	private String review_date;

}
