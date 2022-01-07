package com.bombom.model;

import lombok.Data;

@Data
public class MemberDTO {

	private String user_id;
	private String user_pwd;
	private String user_nickname;
	private String user_name;
	private int user_age;
	private String user_email;
	private String user_gender;
	private String user_addr;
    private String user_phone;
    private String user_profile;
    private int user_status;
    private String user_regdate;
}
