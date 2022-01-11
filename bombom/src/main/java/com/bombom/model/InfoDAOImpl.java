package com.bombom.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAOImpl implements InfoDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getInfoCount() {
		
		return this.sqlSession.selectOne("countInfo");
	}

	@Override
	public List<InfoDTO> getInfoList(InfoPageDTO dto) {
		
		return this.sqlSession.selectList("listInfo", dto);
	}

	@Override
	public int insertInfo(InfoDTO dto) {
		
		return this.sqlSession.insert("addInfo", dto);
	}

	@Override
	public InfoDTO infoCont(int no) {
		
		return this.sqlSession.selectOne("contInfo", no);
	}

	@Override
	public int updateInfo(InfoDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInfo(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int searchInfoCount(String field, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InfoDTO> searchInfoList(InfoPageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReview(InfoReviewDTO dto) {
		
		return this.sqlSession.insert("addReview", dto);
	}

	@Override
	public List<InfoReviewDTO> getReviewList(InfoPageDTO dto) {

		return this.sqlSession.selectList("listReview", dto);
	}

	@Override
	public int getReviewCount(int no) {

		return this.sqlSession.selectOne("countReview", no);
	}

	@Override
	public void updateReviews(int no) {
		
		this.sqlSession.update("addReviewCount", no);
	}

	@Override
	public double getAvg(int no) {
		
		return this.sqlSession.selectOne("getAvg", no);
	}

}
