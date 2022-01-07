package com.bombom.model;

import java.util.List;

public interface TalkDAO {
	List<TalkDTO> getPosts(); // pagination
	List<TalkDTO> getSearchPosts(String keyword);
	TalkDTO getPost(long talk_no);
	int increaseHit(long talk_no);
	int insertPost(TalkDTO dto);
	int deletePost(long talk_no);
	int updatePost(TalkDTO dto);
}
