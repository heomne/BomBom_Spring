package com.bombom.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bombom.model.MemberDAO;
import com.bombom.model.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	//로그인 페이지 이동
	@RequestMapping("user_login.do")
	public String user_login() {
		return "/user/user_login";
	}
	
	//로그인 진행
	@RequestMapping("user_login_ok.do")
	public String user_login_ok() {
		System.out.println("로그인완료");
		return "redirect:/";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("user_join.do")
	public String user_join() {
		return "/user/user_join";
	}
	
	//회원가입 진행
	@RequestMapping("user_join_ok.do")
	public String user_join_ok(MemberDTO dto, Model model, HttpServletResponse response) {

		int result = dao.insertMember(dto);
		
		if(result > 0) {
			System.out.println("데이터삽입성공");
		}
		
		return "redirect:/";
	}
	
}
