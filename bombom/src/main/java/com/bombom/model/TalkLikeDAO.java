package com.bombom.model;

public interface TalkLikeDAO {
	int checkLike(TalkLikeDTO dto);
	int addLike(TalkLikeDTO dto);
	int cancelLike(TalkLikeDTO dto);
	int deleteLikes(long talk_no);
}
