package com.bombom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavController {

	@RequestMapping("user_talk.do")
	public String user_talk() {
		return "/user/user_talk";
	}
	
	@RequestMapping("user_info.do")
	public String user_info() {
		return "/user/user_info";
	}
	
	@RequestMapping("user_food.do")
	public String user_food() {
		return "/user/user_food";
	}
	
	@RequestMapping("user_premiere.do")
	public String user_premiere() {
		return "/user/user_premiere";
	}
	
	@RequestMapping("user_event.do")
	public String user_event() {
		return "/user/user_event";
	}
	
	@RequestMapping("user_login.do")
	public String user_login() {
		return "/user/user_login";
	}
	
	@RequestMapping("user_join.do")
	public String user_join() {
		return "/user/user_join";
	}
	
	@RequestMapping("user_join_ok.do")
	public String user_join_ok() {
		return "/home";
	}
	

	
	
}
