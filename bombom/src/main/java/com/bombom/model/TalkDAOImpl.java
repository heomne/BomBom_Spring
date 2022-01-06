package com.bombom.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TalkDAOImpl implements TalkDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TalkDTO> getPosts() {
		
		return null;
	}

	@Override
	public List<TalkDTO> getSerachPosts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPost(TalkDTO dto) {
		return this.sqlSession.insert("insertPost", dto);
	}

	@Override
	public TalkDTO getPost(int talk_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deletePost(int talk_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePost(TalkDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
