package com.bombom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController {

	@RequestMapping("info_detail.do") 
	public String info_detail() {
		
		return "/user/user_info_detail";
	}
	
	@RequestMapping("info_review.do") 
	public String info_review() {
		
		return "/user/user_info_detail_review";
	}
	
	@RequestMapping(value = "/user_info_write.do", method = RequestMethod.GET)
	public String content(Model model) {
		return "user/user_info_write";
	}
}
