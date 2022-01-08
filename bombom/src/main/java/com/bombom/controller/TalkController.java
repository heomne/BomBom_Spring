package com.bombom.controller;

import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

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
		TalkDTO dto = dao.getPost(Long.parseLong(talkNo));
		
		List<TalkDTO> list = dao.getPosts();
		
		// 세션에 user 없으면 리턴
		if(dto == null) {
			return "redirect:/user_talk.do";
		}
		
		model.addAttribute("content", dto);
		model.addAttribute("posts", list);
		
		return "user/user_talk_contents";
	}

	@RequestMapping(value = "/user_write.do", method = RequestMethod.GET)
	public String content(Model model, HttpSession session) {
		
		if(session.getAttribute("user") == null) {
			return "redirect:user_talk.do";
		}
		
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
	public String updateContent(@PathVariable("id")String talkNo, TalkDTO dto, Model model) throws UnsupportedEncodingException {
		
		//수정된 제목, 본문 인코딩 변환 : iso-8859-1 to utf-8
		dto.setTalk_title(new String(dto.getTalk_title().getBytes("iso-8859-1"), "utf-8"));
		dto.setTalk_cont(new String(dto.getTalk_cont().getBytes("iso-8859-1"), "utf-8"));
		
		dto.setTalk_no(Long.parseLong(talkNo));
		int result = dao.updatePost(dto);
		
		if(result > 0) {
			logger.info("Post updated, result value : {}", result);
			model.addAttribute("talk_no", dto.getTalk_no());
		}
				
		return "redirect:/user_talk.do/{talk_no}";
	}
	
	@ResponseBody
	@RequestMapping(value = "/user_delete.do", method = RequestMethod.POST)
	public String deletePost(@RequestParam("id")String talkNo, Model model) {
		
		int result = dao.deletePost(Long.parseLong(talkNo));
		
		if(result > 0) {
			logger.info("Post deleted, Talk_no : {}", talkNo);
			return "200";
		}
		
		return "400";
	}
	
}
