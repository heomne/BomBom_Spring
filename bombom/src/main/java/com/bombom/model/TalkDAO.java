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
}
