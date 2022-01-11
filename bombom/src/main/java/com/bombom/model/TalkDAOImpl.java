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
	public List<TalkDTO> getPosts(TalkPagination pagination) {
		return this.sqlSession.selectList("getPosts", pagination);
	}
	
	@Override
	public List<TalkDTO> getSearchPosts(TalkPagination pagination) {
		return this.sqlSession.selectList("searchPosts", pagination);
	}
	
	@Override
	public List<TalkDTO> getMainPosts() {
		return this.sqlSession.selectList("getMainPosts");
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

	@Override
	public int getPostCount() {
		return this.sqlSession.selectOne("postCount");
	}
	
	@Override
	public int getPostCount(String keyword) {
		return this.sqlSession.selectOne("searchCount", keyword);
	}

	@Override
	public int increaseLike(TalkLikeDTO dto) {
		return this.sqlSession.update("increaseLike", dto);
	}

	@Override
	public int decreaseLike(TalkLikeDTO dto) {
		return this.sqlSession.update("decreaseLike", dto);
	}


}
