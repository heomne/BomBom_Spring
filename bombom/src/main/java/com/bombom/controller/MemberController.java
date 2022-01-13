package com.bombom.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bombom.model.MemberDAO;
import com.bombom.model.MemberDTO;
import com.bombom.model.PremiereDTO;

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
	
	//id 중복 확인 기능 (ajax 사용, json 형식으로 리턴)
	@ResponseBody
	@RequestMapping(value= "/user_join_idcheck.do", produces = "application/json; charset=utf8")
	public Map<String, Object> user_join_idcheck(@RequestParam("user_id") String user_id) {
		
		int result = dao.checkId(user_id);
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("result", result);
		
		return data;
	}
	
	//email 중복 확인 기능 (ajax 사용, json 형식으로 리턴)
	@ResponseBody
	@RequestMapping(value= "/user_join_emailcheck.do", produces = "application/json; charset=utf8")
	public Map<String, Object> user_join_emailcheck(@RequestParam("user_email") String user_email) {
		
		int result = dao.checkEmail(user_email);
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("result", result);
		
		return data;
	}
	
	//마이페이지 이동
	@RequestMapping("user_mypage.do")
	public String user_mypage() {		
		return "/user/user_mypage";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("user_join_update.do")
	public String user_join_update() {

		return "/user/user_join_update";
	}
	
	//회원정보 수정 기능
	@RequestMapping("user_join_update_ok.do")
	public String user_join_update_ok(MemberDTO dto, HttpSession session) {
		
		//업데이트 쿼리
		int result = dao.updateMember(dto);
		
		//업데이트 쿼리 성공시 세션정보 변경
		if(result > 0) {
			
			session.setAttribute("user", dao.getMember(dto.getUser_id()));
		}
		
		//임시로 업데이트 페이지로 다시 이동하도록 함
		return "redirect:user_join_update.do";
	}
	
}
