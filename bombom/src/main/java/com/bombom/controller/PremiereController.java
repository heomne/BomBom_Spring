package com.bombom.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bombom.model.PremiereDAO;
import com.bombom.model.PremiereDTO;

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
	//MultipartHttpServletRequest : "multipart/form-data"로 전달받은  입력파일과 입력값을 처리하는 인스턴스
	@RequestMapping(value = "/premiere_write.do", method = RequestMethod.POST)
	public String premiere_insert(PremiereDTO dto, 
			MultipartHttpServletRequest request) 
					throws IllegalStateException, IOException {
		
		// 화면단에서 전달되는 파일 받을 객체
		MultipartFile thumbnail = request.getFile("thumbnail");
		
		// 파일 저장할 경로 지정
		String filePath = 
				request.getSession().getServletContext().getRealPath("resources/upload/premiere/");	
		
		System.out.println("시사회 게시판 썸네일 파일경로 > " + filePath);
		
		// 파일을 업로드하기 위한 파일 객체 생성
		File file = new File(filePath, thumbnail.getOriginalFilename());
		
		// 파일 업로드
		// transferTo : 업로드요청으로 전달받은 파일을 위에서 설정한 특정 경로에 특정 파일명으로 저장
		thumbnail.transferTo(file);
		
		dto.setPremiere_thumbnail(file.getName());
		
		int result = dao.insertBoard(dto);
		
		return "/user/user_premiere";
	}
}
