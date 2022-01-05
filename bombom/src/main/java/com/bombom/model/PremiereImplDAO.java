package com.bombom.model;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class PremiereImplDAO implements PremiereDAO{

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PremiereDTO> getBoardList(PremierePageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(PremiereDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PremiereDTO boardCont(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void readCount(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateBoard(PremiereDTO dto) {
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
	public List<PremiereDTO> searchBoardList(PremierePageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
