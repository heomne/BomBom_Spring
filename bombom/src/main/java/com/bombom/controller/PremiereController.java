package com.bombom.controller;

import java.io.*;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bombom.model.PremiereDAO;
import com.bombom.model.PremiereDTO;

@Controller
public class PremiereController {
	
	@Autowired
	private PremiereDAO dao;
	
	// 시사회 게시판 글 목록 불러오는 비즈니스 로직
	@RequestMapping("user_premiere.do")
	public String premiere_list(Model model) {
		
		List<PremiereDTO> list = this.dao.getBoardList();
		
		model.addAttribute("List", list);
				
		return "/user/user_premiere";
	}
	
	
	// 시사회 게시판 글 작성 폼 불러오는 비즈니스 로직
	@RequestMapping(value = "/premiere_write.do", method = RequestMethod.GET)
	public String premiere_write(Model model) {
		return "/admin/admin_premiere_write";
	}
	
	
	// 시사회 게시판 글 작성 완료하는 비즈니스 로직
	//MultipartHttpServletRequest : "multipart/form-data"로 전달받은  입력파일과 입력값을 처리하는 인스턴스
	@RequestMapping(value = "/premiere_write.do", method = RequestMethod.POST)
	public void premiere_insert(PremiereDTO dto, 
			MultipartHttpServletRequest request,
			HttpServletResponse response) 
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
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('게시물 등록이 완료되었습니다.')");
			out.println("location.href='user_premiere.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시물 등록이 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
		
	// 시사회 게시판 글 수정 폼 페이지를 생성하는 비즈니로직
	@RequestMapping("premiere_update.do")
	public String modify(@RequestParam("no") int board_no, Model model) {
		
		// 게시글 상세 내역 조회하는 메서드 호출
		PremiereDTO dto = this.dao.boardCont(board_no);
		
		model.addAttribute("modify", dto) ;
		
		return "/admin/admin_premiere_update";
	}
	
	// 시사회 게시판 글 수정을 완료하는 비즈니스 로직
	@RequestMapping("premiere_update_ok.do")
	public void modifyOk(PremiereDTO dto, 
			MultipartHttpServletRequest request,
			HttpServletResponse response) 
					throws IllegalStateException, IOException {
		
		// 화면단에서 전달되는 파일 받을 객체
		MultipartFile thumbnail = request.getFile("thumbnail");
		
		// 화면단에서 전달된 파일 객체가 없을 시, 원래 파일로 대체
		if(thumbnail.isEmpty()) {
			 PremiereDTO original = this.dao.boardCont(dto.getPremiere_no());
			 
			 System.out.println("원래 파일 잘 가져오는지 보자 :" + original.getPremiere_thumbnail());
			 
			 dto.setPremiere_thumbnail(original.getPremiere_thumbnail());
			
		} else {
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
			
		}
		int res = this.dao.updateBoard(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('시사회 게시글 수정 성공!')");
			out.println("location.href='user_premiere.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('시사회 게시글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
	// 시사회 게시판 글 삭제 비즈니스 로직
	@RequestMapping("premiere_delete.do")
	public void delete(@RequestParam("no") int no,
			HttpServletResponse response) throws IOException {
		
		// 게시글 삭제하는 메서드 호출
		int res = this.dao.deleteBoard(no);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			// 상품 삭제 됨에 따라 상품 번호도 제거되는 메서드 호출
			this.dao.updateSequence(no);
			
			out.println("<script>");
			out.println("alert('시사회 게시글 삭제 성공!'");
			out.println("location.href='user_premiere.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('시사회 게시글 삭제 실패!'");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
}
