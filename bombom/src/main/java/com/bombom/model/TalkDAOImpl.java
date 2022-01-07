package com.bombom.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TalkDAOImpl implements TalkDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TalkDTO> getPosts() {
		return this.sqlSession.selectList("getPosts");
	}
	
	@Override
	public List<TalkDTO> getSearchPosts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPost(TalkDTO dto) {
		return this.sqlSession.insert("insertPost", dto);
	}

	@Override
	public TalkDTO getPost(int talk_no) {
		return this.sqlSession.selectOne("getPost", talk_no);
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
