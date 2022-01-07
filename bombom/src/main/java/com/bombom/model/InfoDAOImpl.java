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
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InfoDTO> getBoardList(PremierePageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(InfoDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.insert("addInfo", dto);
	}

	@Override
	public InfoDTO boardCont(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(InfoDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int searchBoardCount(String field, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InfoDTO> searchBoardList(PremierePageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
