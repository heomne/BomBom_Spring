package com.bombom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("user_notice_cont.do")
	public String cont() {
		
		return "/user/user_notice_cont";
	}

}
