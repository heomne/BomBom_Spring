package com.bombom.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeImplDAO implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeDTO> getNewList(NoticeDTO dto) {
		// 글 리스트 뽑아오기
		return this.sqlSession.selectList("notice_list", dto);
	}
	
	@Override
	public int insertNews(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeDTO newsCont(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void Hit(int no) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateNews(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNews(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int no) {
		// TODO Auto-generated method stub

	}

	@Override
	public int searchNewsCont(String field, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> searchNewsList(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
