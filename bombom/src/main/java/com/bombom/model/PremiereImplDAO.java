package com.bombom.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PremiereImplDAO implements PremiereDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 전체 목록 가져오기
	@Override
	public List<PremiereDTO> getBoardList() {
		return this.sqlSession.selectList("allPremiere");
	}
	
	// 홈 화면에 올라갈 글 목록 가져오기
	@Override
	public List<PremiereDTO> getMainList() {
		return this.sqlSession.selectList("mainPremiere");
	}	
	
	// 글 작성
	@Override
	public int insertBoard(PremiereDTO dto) {
		return this.sqlSession.insert("addPremiere", dto);
	}

	// 글 수정
	@Override
	public int updateBoard(PremiereDTO dto) {
		return this.sqlSession.update("editPremiere", dto);
	}

	// 글 삭제
	@Override
	public int deleteBoard(int no) {
		return this.sqlSession.delete("delPremiere", no);
	}

	// 글 삭제에 따른 글 번호 재정렬
	@Override
	public void updateSequence(int no) {
		this.sqlSession.update("seqPremiere", no);
	}
	
	// 글 검색 
	@Override
	public List<PremiereDTO> searchBoardCount(String field, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	// 글 내용 불러오기
	@Override
	public PremiereDTO boardCont(int no) {
		return this.sqlSession.selectOne("contentPremiere", no);
	}

	

}
