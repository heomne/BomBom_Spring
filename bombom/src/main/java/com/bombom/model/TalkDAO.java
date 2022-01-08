package com.bombom.model;

import java.util.List;

public interface TalkDAO {
	List<TalkDTO> getPosts(TalkPagination pagination);
	List<TalkDTO> getSearchPosts(TalkPagination pagination);
	TalkDTO getPost(long talk_no);
	int getPostCount();
	int getPostCount(String keyword);
	int increaseHit(long talk_no);
	int insertPost(TalkDTO dto);
	int deletePost(long talk_no);
	int updatePost(TalkDTO dto);
}
