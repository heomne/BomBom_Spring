package com.bombom.model;

import lombok.Data;

@Data
public class TalkCommentDTO {
	private long talk_no;
	private String user_id;
	private String user_nickname;
	private long comment_no;
	private String comment_cont;
	private int comment_reply;
	private String comment_date;
}
