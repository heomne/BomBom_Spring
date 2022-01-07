package com.bombom.model;

import lombok.Data;

@Data
public class TalkDTO {
	private long talk_no;
	private String user_id;
	private String user_nickname;
	private String talk_title;
	private String talk_cont;
	private int talk_hit;
	private int talk_comment_avail;
	private int talk_report;
	private String talk_date;
}
