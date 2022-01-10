package com.bombom.model;

import lombok.Data;

@Data
public class TalkLikeDTO {
	private long talkNo;
	private String user_id;
	private int likeCount;
	
	public TalkLikeDTO(long talkNo, String user_id) {
		this.talkNo = talkNo;
		this.user_id = user_id;
	}
}
