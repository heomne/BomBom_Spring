package com.bombom.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String user_login_ok(MemberDTO dto, HttpSession session) {
		
		//반환주소값
		String url = "";
		
		//세션에 user 정보가 남아있는 경우 세션 제거
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}
		
		//로그인
		MemberDTO result = dao.login(dto);
		
		if(result != null) {	//로그인 성공 - 세션이름 : 'user'(MemberDTO 타입)
			session.setAttribute("user", result);
			url = "redirect:/";
			System.out.println("로그인성공");
		}else {					//로그인 실패
			url = "redirect:user_login.do?login=fail";
			System.out.println("로그인실패");
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
	public String user_join_ok(MemberDTO dto) throws IOException {
		
		String url = "";
		
		int result = dao.insertMember(dto);
		
		if(result > 0) {	//회원가입 성공 - 로그인페이지로 이동 후 안내메시지 출력
			url = "redirect:user_login.do?register=success";
		}else {				//회원가입 실패 - 로그인페이지로 이동 후 안내메시지 출력
			url = "redirect:user_login.do?register=fail";
		}	
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value= "/user_join_idcheck.do", produces = "application/json; charset=utf8")
	public Map<String, Object> user_join_idcheck(@RequestParam("user_id") String user_id) {
		
		int result = dao.checkId(user_id);
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("result", result);
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value= "/user_join_emailcheck.do", produces = "application/json; charset=utf8")
	public Map<String, Object> user_join_emailcheck(@RequestParam("user_email") String user_email) {
		
		int result = dao.checkEmail(user_email);
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("result", result);
		
		return data;
	}
	
	// 마이페이지 이동
	@RequestMapping("user_mypage.do")
	public String user_mypage() {
		
		return "/user/user_mypage";
	}
	
}
