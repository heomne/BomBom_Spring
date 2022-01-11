package com.bombom.model;

import java.util.List;

public interface TalkCommentDAO {
	List<TalkCommentDTO> getComments(long talk_no);
	int insertComment(TalkCommentDTO dto);
	int updateComment(TalkCommentDTO dto);
	int deleteComment(long comment_no);
}
