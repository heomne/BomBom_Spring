package com.bombom.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bombom.model.PremiereDAO;
import com.bombom.model.PremiereDTO;

@Controller
public class PremiereController {
	
	@Autowired
	private PremiereDAO dao;
	
	// 시사회 게시판 글 작성 폼 불러오는 비즈니스 로직
	@RequestMapping("premiere_write.do") 
	public String premiere_write() {
		return "/user/premiere_write";
	}
	
	// 시사회 게시판 댓글 작성 비즈니스 로직
	
	
	// 시사회 글 작성 하는 비즈니스 로직
	@RequestMapping("premiere_write_ok.do")
	public void premiere_write_ok(PremiereDTO dto, HttpServletResponse response) throws IOException {
	
		// 게시글 추가하는 메서드 호출
		int res = this.dao.insertBoard(dto);
	
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('게시글이 등록되었습니다.'");
			out.println("location.href='/user_premiere.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시글 등록을 실패했습니다.'");
			out.println("history.back()");
			out.println("</script>");
		}	
	} 
}
