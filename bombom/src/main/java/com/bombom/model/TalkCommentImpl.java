package com.bombom.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TalkCommentImpl implements TalkCommentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TalkCommentDTO> getComments(long talk_no) {
		return this.sqlSession.selectList("getComments", talk_no);
	}

	@Override
	public int insertComment(TalkCommentDTO dto) {
		return this.sqlSession.insert("insertComment", dto);
	}

	@Override
	public int updateComment(TalkCommentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(TalkCommentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
