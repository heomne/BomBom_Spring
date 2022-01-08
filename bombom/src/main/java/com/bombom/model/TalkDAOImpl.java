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
	public List<TalkDTO> getSearchPosts(String keyword) {
		return this.sqlSession.selectList("searchPosts", keyword);
	}


	@Override
	public int insertPost(TalkDTO dto) {
		return this.sqlSession.insert("insertPost", dto);
	}

	@Override
	public TalkDTO getPost(long talk_no) {
		return this.sqlSession.selectOne("getPost", talk_no);
	}
	
	@Override
	public int increaseHit(long talk_no) {
		return this.sqlSession.update("increaseHit", talk_no);
	}

	@Override
	public int deletePost(long talk_no) {
		return this.sqlSession.delete("deletePost", talk_no);
	}

	@Override
	public int updatePost(TalkDTO dto) {
		return this.sqlSession.update("updatePost", dto);
	}
}
