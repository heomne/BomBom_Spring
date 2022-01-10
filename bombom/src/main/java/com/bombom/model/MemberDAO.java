package com.bombom.model;

import java.util.List;

public interface MemberDAO {
	
	int insertMember(MemberDTO dto);
	MemberDTO getMember(String user_id);
	int updateMember(MemberDTO dto);
	int deleteMember(String user_id);
	
	List<MemberDTO> getMembers(); //전체회원보기(option)
	MemberDTO login(MemberDTO dto);
	int checkId(String user_id);
	int checkEmail(String user_email);
	
}
