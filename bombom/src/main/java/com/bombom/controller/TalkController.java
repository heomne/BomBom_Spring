package com.bombom.controller;

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

	@RequestMapping(value = "/user_content.do/{id}", method = RequestMethod.GET)
	public String content(@PathVariable("id")String boardNo, Model model) {
		
		model.addAttribute("boardNo", boardNo);
		
		return "user/user_talk_contents";
	}
	
	@RequestMapping(value = "/user_write.do", method = RequestMethod.GET)
	public String content(Model model) {
		return "user/user_talk_write";
	}
	
	@RequestMapping(value = "/user_write.do", method = RequestMethod.POST)
	public String insertPost(TalkDTO dto, Model model) {
		// test
		dto.setId("alsghl9607");
		dto.setNickname("Spring");
		
		int result = dao.insertPost(dto);
		
		if(result > 0) {
			System.out.println("TalkController : Post inserted");
		}
		
		return "redirect:user/user_talk_contents";
	}
	
}
