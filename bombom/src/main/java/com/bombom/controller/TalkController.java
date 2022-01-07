package com.bombom.controller;

import java.time.LocalDate;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bombom.model.TalkDAO;
import com.bombom.model.TalkDTO;

@Controller
public class TalkController {
	
	@Autowired
	private TalkDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/user_talk.do", method = RequestMethod.GET)
	public String getPosts(Model model) {
		List<TalkDTO> posts = dao.getPosts();
		
		model.addAttribute("posts", posts);
		model.addAttribute("today", LocalDate.now().toString());
		
		return "user/user_talk";
	}

	@RequestMapping(value = "/user_talk.do/{id}", method = RequestMethod.GET)
	public String content(@PathVariable("id")String boardNo, Model model) {
		
		TalkDTO dto = dao.getPost(Integer.parseInt(boardNo));
		
		model.addAttribute("content", dto);
		
		return "user/user_talk_contents";
	}
	
	@RequestMapping(value = "/user_write.do", method = RequestMethod.GET)
	public String content(Model model) {
		return "user/user_talk_write";
	}
	
	@RequestMapping(value = "/user_write.do", method = RequestMethod.POST)
	public String insertPost(TalkDTO dto, Model model) {
		// test
		dto.setUser_id("alsghl9607");
		dto.setUser_nickname("Spring");
		
		int result = dao.insertPost(dto);
		
		if(result > 0) {
			logger.info("Post inserted, result value : {}", result);
		}
		
		return "redirect:user_talk.do";
	}
	
}
