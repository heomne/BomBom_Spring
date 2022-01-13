package com.bombom.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TalkCommentDAOImpl implements TalkCommentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TalkCommentDTO> getComments(long talk_no) {
		return this.sqlSession.selectList("getComments", talk_no);
	}
	
	public List<TalkCommentDTO> getComments(String id) {
		return this.sqlSession.selectList("getCommentsById", id);
	}

	@Override
	public int insertComment(TalkCommentDTO dto) {
		return this.sqlSession.insert("insertComment", dto);
	}

	@Override
	public int updateComment(TalkCommentDTO dto) {
		return this.sqlSession.update("updateComment", dto);
	}

	@Override
	public int deleteComment(long comment_no) {
		return this.sqlSession.delete("deleteComment", comment_no);
	}

	@Override
	public List<TalkCommentDTO> getComments(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
