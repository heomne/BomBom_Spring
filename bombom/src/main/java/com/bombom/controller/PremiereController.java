package com.bombom.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bombom.model.PremiereDAO;
import com.bombom.model.PremiereDTO;
import com.bombom.model.TalkDTO;

@Controller
public class PremiereController {
	
	@Autowired
	private PremiereDAO dao;
	
	// 시사회 게시판 글 작성 폼 불러오는 비즈니스 로직
	@RequestMapping(value = "/premiere_write.do", method = RequestMethod.GET)
	public String premiere_write(Model model) {
		return "/admin/admin_premiere_write";
	}
	
	// 시사회 게시판 글 작성 완료하는 비즈니스 로직
	@RequestMapping(value = "/premiere_write.do", method = RequestMethod.POST)
	public String premiere_insert(PremiereDTO dto, Model model) {
		// test
		int result = dao.insertBoard(dto);
		
		if(result > 0) {
			System.out.println("시사회 게시판 게시물 등록 완료!");
		}
		
		return "redirect:user/user_premiere";
	}
	
}
