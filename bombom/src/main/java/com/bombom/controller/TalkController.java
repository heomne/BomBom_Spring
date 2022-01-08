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

import com.bombom.model.MemberDTO;
import com.bombom.model.TalkDAO;
import com.bombom.model.TalkDTO;
import com.bombom.model.TalkPagination;

@Controller
public class TalkController {
	
	@Autowired
	private TalkDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/user_talk.do", method = RequestMethod.GET)
	public String getPosts(@RequestParam(defaultValue = "1")int page, Model model) {
		
		int listCount = dao.getPostCount();
		TalkPagination pagination = new TalkPagination(listCount, page);
		List<TalkDTO> posts = dao.getPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("today", LocalDate.now().toString());
		model.addAttribute("paging", pagination);
		
		return "user/user_talk";
	}

	@RequestMapping(value = "/user_talk.do/{id}", method = RequestMethod.GET)
	public String content(@PathVariable("id")Long talkNo, Model model, HttpSession session) {
		
		dao.increaseHit(talkNo);
		TalkDTO dto = dao.getPost(talkNo);
		
		int listCount = dao.getPostCount();
		TalkPagination pagination = new TalkPagination(listCount, 1);
		List<TalkDTO> posts = dao.getPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("today", LocalDate.now().toString());
		model.addAttribute("paging", pagination);
		model.addAttribute("content", dto);
		
		return "user/user_talk_contents";
	}
	
	@RequestMapping(value = "/user_search.do", method = RequestMethod.GET)
	public String searchPosts(@RequestParam int page, @RequestParam String keyword, Model model) {
		
		int searchCount = dao.getPostCount(keyword);
		TalkPagination pagination = new TalkPagination(searchCount, page);
		pagination.setKeyword(keyword);
		
		List<TalkDTO> posts = dao.getSearchPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("paging", pagination);
		model.addAttribute("today", LocalDate.now().toString());
		
		return "user/user_talk_search";
	}
	
	@RequestMapping(value = "/user_search.do", method = RequestMethod.POST)
	public String searchPostsPost(@RequestParam String keyword, Model model) {
		
		int searchCount = dao.getPostCount(keyword);
		TalkPagination pagination = new TalkPagination(searchCount, 1);
		pagination.setKeyword(keyword);
		
		List<TalkDTO> posts = dao.getSearchPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("paging", pagination);
		model.addAttribute("today", LocalDate.now().toString());
		
		return "user/user_talk_search";
	}

	@RequestMapping(value = "/user_write.do", method = RequestMethod.GET)
	public String content(Model model, HttpSession session) {
		
		if(session.getAttribute("user") == null) {
			return "redirect:user_talk.do";
		}
		
		return "user/user_talk_write";
	}
	
	@RequestMapping(value = "/user_write.do", method = RequestMethod.POST)
	public String insertPost(TalkDTO dto, Model model, HttpSession session) {
		
		// 세션에 user 없으면 리턴
		if(session.getAttribute("user") == null) {
			return "redirect:/user_talk.do";
		}
		
		int result = dao.insertPost(dto);
		
		if(result > 0) {
			logger.info("Post inserted, Talk_no : {}", dto.getTalk_no());
			model.addAttribute("talk_no", dto.getTalk_no());
		}
		
		return "redirect:/user_talk.do/{talk_no}";
	}
	
	@RequestMapping(value = "/user_write.do/{id}", method = RequestMethod.GET)
	public String getPostToUpdate(@PathVariable("id")Long talkNo, Model model, HttpSession session) {
		
		TalkDTO dto = dao.getPost(talkNo);
		
		MemberDTO member = (MemberDTO)session.getAttribute("user");
	
		// 게시글 작성자 id, session 작성자 id 일치하지 않을 경우 redirect
		if(!(member.getUser_id().equals(dto.getUser_id()))) {
			return "redirect:/user_talk.do";
		}
		
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
