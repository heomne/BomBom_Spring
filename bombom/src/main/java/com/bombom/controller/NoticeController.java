package com.bombom.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bombom.model.NoticeDAO;
import com.bombom.model.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO dao;
	
	@RequestMapping("user_notice.do")
	public String user_event(NoticeDTO dto,
			HttpServletRequest request, Model model) {
		
		List<NoticeDTO> list = this.dao.getNewList(dto);
		
		model.addAttribute("List", list);
		
		return "/user/user_notice";
	}

	
	@RequestMapping("user_notice_cont.do")
	public String cont() {
		
		return "/user/user_notice_cont";
	}

}
