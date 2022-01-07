package com.bombom.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bombom.model.InfoDAO;
import com.bombom.model.InfoDTO;

@Controller
public class InfoController {

	@Autowired
	private InfoDAO dao;
	
	@Autowired
	private InfoUpload upload;
	
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
	
	@RequestMapping(value = "/user_info_write.do", method = RequestMethod.POST)
	public void insert(InfoDTO dto, 
			MultipartHttpServletRequest mRequest,
			HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		upload.fileUpload(mRequest, dto, request);
		int check = this.dao.insertBoard(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시물 등록이 완료되었습니다.')");
			out.println("location.href='user_info.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시물 등록이 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	}
}
