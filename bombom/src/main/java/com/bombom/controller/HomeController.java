package com.bombom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bombom.model.TalkDAO;
import com.bombom.model.TalkDTO;

@Controller
public class HomeController {

	@Autowired
	private TalkDAO talkDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<TalkDTO> posts = talkDao.getMainPosts();
		
		model.addAttribute("posts", posts);		
		return "home";
	}
	
	@RequestMapping("banner")
	public String banner() {
		
		return "include/banner";
	}
}
