package com.bombom.model;

import lombok.Data;

@Data
public class TalkDTO {
	private long no;
	private String id;
	private String nickname;
	private String title;
	private String cont;
	private int hit;
	private int comment_avail;
	private int report;
	private String date;
}
