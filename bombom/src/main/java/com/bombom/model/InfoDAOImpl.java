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

		return this.sqlSession.update("modifyInfo", dto);
	}

	@Override
	public int deleteInfo(int no) {
		
		return this.sqlSession.delete("dropInfo", no);
	}
	
	@Override
	public int deleteReview(int no) {
		
		return this.sqlSession.delete("dropReview", no);
	}

	@Override
	public int searchInfoCount(String keyword) {

		return this.sqlSession.selectOne("searchInfoCount", keyword);
	}

	@Override
	public List<InfoDTO> searchInfoList(InfoPageDTO dto) {
		
		return this.sqlSession.selectList("searchInfoList", dto);
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
	public Double getAvg(int no) {
		
		Double Avg =  this.sqlSession.selectOne("getAvg", no) ;
		
		if (Avg == null) {
			return 0.0;
		} else {
			return Avg;
		}
	}
	
	@Override
	public List<InfoDTO> getMainList() {

		return this.sqlSession.selectList("mainInfo");
	}

}
