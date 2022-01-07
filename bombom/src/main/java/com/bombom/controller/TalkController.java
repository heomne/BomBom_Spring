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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/user_talk.do", method = RequestMethod.POST)
	public String searchPosts(@RequestParam("keyword")String keyword, Model model) {
		
		List<TalkDTO> posts = dao.getSearchPosts(keyword);
		
		model.addAttribute("posts", posts);
		model.addAttribute("today", LocalDate.now().toString());
		
		return "user/user_talk";
	}

	@RequestMapping(value = "/user_talk.do/{id}", method = RequestMethod.GET)
	public String content(@PathVariable("id")String talkNo, Model model) {
		
		dao.increaseHit(Long.parseLong(talkNo));
		TalkDTO dto = dao.getPost(Integer.parseInt(talkNo));
		
		if(dto == null) {
			return "redirect:/user_talk.do";
		}
		
		model.addAttribute("content", dto);
		
		return "user/user_talk_contents";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/user_talk.do/{id}", method = RequestMethod.PUT)
//	public String updatePost(@PathVariable("id")String talkNo, Model model) {
//		
//		logger.info("REST-PUT clicked");
//		logger.info("Received data : {}", talkNo);
//		
//		TalkDTO dto = dao.getPost(Long.parseLong(talkNo));
//		model.addAttribute("post", dto);
//		
//		boolean isSucceed = true;
//		
//		return isSucceed ? "true" : "false";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/user_talk.do/{id}", method = RequestMethod.DELETE)
//	public String deletePost(@PathVariable("id")String talkNo, Model model) {
//		
//		logger.info("REST-DELETE clicked");
//		logger.info("Received data : {}", talkNo);
//		
//		boolean isSucceed = true;
//		
//		return isSucceed ? "true" : "false";
//	}
	
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
			logger.info("Post inserted, Talk_no : {}", dto.getTalk_no());
			model.addAttribute("talk_no", dto.getTalk_no());
		}
		
		return "redirect:/user_talk.do/{talk_no}";
	}
	
	@RequestMapping(value = "/user_write.do/{id}", method = RequestMethod.GET)
	public String getPostToUpdate(@PathVariable("id")String talkNo, Model model) {
		
		// 세션에 존재하는 아이디 일치하는지 확인 필요
		
		TalkDTO dto = dao.getPost(Long.parseLong(talkNo));
		model.addAttribute("post", dto);
		
		return "user/user_talk_update";
	}
	
	@RequestMapping(value = "/user_write.do/{id}", method = RequestMethod.POST)
	public String updateContent(@PathVariable("id")String talkNo, TalkDTO dto, Model model) {
		
		int result = dao.updatePost(dto);
		
		if(result > 0) {
			logger.info("Post updated, result value : {}", result);
			model.addAttribute("talkNo", talkNo);
		}
				
		return "redirect:/user_talk.do/{talkNo}";
	}
	
}
