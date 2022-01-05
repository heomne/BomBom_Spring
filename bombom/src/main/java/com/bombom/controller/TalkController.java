package com.bombom.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TalkController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/user_content.do/{id}", method = RequestMethod.GET)
	public String content(@PathVariable("id")String boardNo, Model model) {
		
		model.addAttribute("boardNo", boardNo);
		
		return "user/user_talk_contents";
	}
	
	@RequestMapping(value = "/user_write.do", method = RequestMethod.GET)
	public String content(Model model) {
		return "user/user_talk_write";
	}
	
	/**
	 * 파일이름 추출하기
	 * 1. 업로드한 파일의 확장자명 알아내기
	 * 2. (오늘날짜)_currentTimeMillis + 확장자 방식으로 파일명 생성
	 * 3. 파일 경로에 등록
	 * 4. 주소값 리턴 (https://localhost:8080/bombom/resources/upload/파일)
	 */	
	@ResponseBody
	@RequestMapping(value = "/image_upload.do", method = RequestMethod.POST)
	public String imageUpload(@RequestParam("image")MultipartFile multipartFile, HttpServletRequest request) {
		
		if(multipartFile.isEmpty()) {
			logger.warn("user_write image upload detected, but there's no file.");
		}
		

		String fileName = multipartFile.getOriginalFilename();
		int lastIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(lastIndex, fileName.length());
		String newFileName = LocalDate.now() + "_" + System.currentTimeMillis() + ext;
		
		System.out.println(request.getSession().getServletContext().getRealPath("resources/upload/"));
		
		try {
			File image = new File(request.getSession().getServletContext().getRealPath("resources/upload/") + newFileName);
			
//			로그찍어보기 > context.xml에서 세팅 필요해보임
//			logger.info("image detected, FileName is {}", fileName);
//			logger.info("selected directory is {}", request.getServletContext().getRealPath("/upload/"));
//			logger.info("FileName is changed to {}", newFileName);
			
			multipartFile.transferTo(image);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		// 주소값 알아내기
		String path = request.getContextPath(); // /bombom
		int index = request.getRequestURL().indexOf(path);
		String url = request.getRequestURL().substring(0, index);
		System.out.println("1");
		
		// https://localhost:8080/bombom/resources/upload/파일이름
		return url + request.getContextPath() + "/resources/upload/" + newFileName;
	}
	
}
