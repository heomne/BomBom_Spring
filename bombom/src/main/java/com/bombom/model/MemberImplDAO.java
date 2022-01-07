package com.bombom.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberImplDAO implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMember(MemberDTO dto) {
		// 회원가입
		return this.sqlSession.insert("insertMember", dto);
	}

	@Override
	public MemberDTO getMember(String user_id) {
		// 회원불러오기 (마이페이지 - 회원정보보기 기능에서 사용)
		return null;
	}

	@Override
	public int updateMember(MemberDTO dto) {
		// 회원정보수정 (마이페이지 - 회원정보 수정)
		return this.sqlSession.update("updateMember", dto);
	}

	@Override
	public int deleteMember(String user_id) {
		// 회원삭제(마이페이지 - 탈퇴 or 관리자 - 회원비활성)
		return this.sqlSession.delete("deleteMember");
	}

	@Override
	public List<MemberDTO> getMembers() {
		// 회원전체목록 불러오기(필요시 작성)
		return null;
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		// 로그인
		return this.sqlSession.selectOne("memberLogin", dto);
	}

}
