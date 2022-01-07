package com.bombom.model;

import java.util.List;

public interface NoticeDAO {
	
	List<NoticeDTO> getNewList(NoticeDTO dto);
	
	int insertNews(NoticeDTO dto);
	
	NoticeDTO newsCont (int no);
	
	void Hit(int no);
	
	int updateNews(NoticeDTO dto);
	
	int deleteNews(int no);
	
	void updateSequence(int no);
	
	int searchNewsCont(String field, String keyword);
	
	List<NoticeDTO> searchNewsList(NoticeDTO dto);

}
