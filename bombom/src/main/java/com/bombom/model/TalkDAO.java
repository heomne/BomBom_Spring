package com.bombom.model;

import java.util.List;

public interface TalkDAO {
	List<TalkDTO> getPosts(TalkPagination pagination);
	List<TalkDTO> getSearchPosts(TalkPagination pagination);
	List<TalkDTO> getMainPosts();
	TalkDTO getPost(long talk_no);
	int getPostCount();
	int getPostCount(String keyword);
	int increaseHit(long talk_no);
	int insertPost(TalkDTO dto);
	int deletePost(long talk_no);
	int updatePost(TalkDTO dto);
	int increaseLike(TalkLikeDTO dto);
	int decreaseLike(TalkLikeDTO dto);
	
	//사용자가 작성한 글 가져오는 메서드
	List<TalkDTO> getUserPosts(String id);
	List<TalkDTO> getUserPostsAll(String id);
	
	// 사용자가 댓글 단 게시글 목록 가져오기
	List<TalkDTO> getUserComment(String id);
	
	//사용자가 좋아요 한 글 가져오는 메서드
	List<TalkDTO> getUserLikes(String id);
}
