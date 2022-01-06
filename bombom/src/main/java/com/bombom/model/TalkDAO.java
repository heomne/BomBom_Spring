package com.bombom.model;

import java.util.List;

public interface TalkDAO {
	List<TalkDTO> getPosts(); // pagination
	List<TalkDTO> getSerachPosts();
	TalkDTO getPost(int talk_no);
	int insertPost(TalkDTO dto);
	int deletePost(int talk_no);
	int updatePost(TalkDTO dto);
}
