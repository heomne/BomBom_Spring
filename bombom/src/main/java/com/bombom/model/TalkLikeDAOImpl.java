package com.bombom.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TalkLikeDAOImpl implements TalkLikeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int checkLike(TalkLikeDTO dto) {
		return this.sqlSession.selectOne("checkLike", dto);
	}
	
	@Override
	public int addLike(TalkLikeDTO dto) {
		return this.sqlSession.insert("addLike", dto);
	}

	@Override
	public int cancelLike(TalkLikeDTO dto) {
		return this.sqlSession.delete("cancelLike", dto);
	}

	@Override
	public int deleteLikes(long talk_no) {
		return this.sqlSession.delete("deleteLikes", talk_no);
	}

}
