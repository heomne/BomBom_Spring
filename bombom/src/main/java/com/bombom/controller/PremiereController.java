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
	
	final String uri = "/upload";
	
	@Autowired
	private PremiereDAO dao;
	
	// 시사회 게시판 글 작성 폼 불러오는 비즈니스 로직
	@RequestMapping(value = "/premiere_write.do", method = RequestMethod.GET)
	public String premiere_write(Model model) {
		return "/admin/admin_premiere_write";
	}
	
	// 시사회 게시판 글 작성 완료하는 비즈니스 로직
	@RequestMapping(value = "/premiere_write.do", method = RequestMethod.POST)
	public String premiere_insert(PremiereDTO dto, 
			MultipartHttpServletRequest mRequest) 
					throws IllegalStateException, IOException {
		
		MultipartFile thumbnail = mRequest.getFile("thumbnail");
		
		// 파일 저장
		File file = getFile(mRequest, uri, thumbnail.getOriginalFilename());
		
		thumbnail.transferTo(file);
		
		dto.setPremiere_thumbnail(file.getName());
		int result = dao.insertBoard(dto);
		
		return "/user/user_premiere";
	}
	
	// File 객체를 생성해서 반환 
	private File getFile(HttpServletRequest request, String uri, String fileName) {
		
		String rpath = request.getSession().getServletContext().getRealPath(uri);
		
		File newFile = new File(rpath, fileName); 
		
		return newFile;
	}
	
}
