package com.bombom.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	//홈으로 이동
	@RequestMapping("home.do")
	public String user_home() {
		return "redirect:/";
	}
	
	//로그인 페이지 이동
	@RequestMapping("user_login.do")
	public String user_login() {
		return "/user/user_login";
	}
	
	//로그인 진행
	@RequestMapping("user_login_ok.do")
	public String user_login_ok(MemberDTO dto, HttpSession session) {
		
		//반환주소값
		String url = "";
		
		//세션에 user 정보가 남아있는 경우 세션 제거
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}
		
		MemberDTO result = dao.login(dto);
		

		if(result!= null) {		//로그인 성공
			session.setAttribute("user", result);
			url = "/";
		}else {					//로그인 실패
			url = "/user/user_login";
		}
		
		return url;
	}
	
	//로그아웃
	@RequestMapping("user_logout.do")
	public String user_logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("user_join.do")
	public String user_join() {
		return "/user/user_join";
	}
	
	//회원가입 진행
	@RequestMapping("user_join_ok.do")
	public void user_join_ok(MemberDTO dto, Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int result = dao.insertMember(dto);
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('회원가입이 완료되었습니다')");
			out.println("location.href='home.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다')");
			out.println("history.back()");
			out.println("</script>");
		}

	}
	
}
