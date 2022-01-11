package com.bombom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bombom.model.NoticeDAO;
import com.bombom.model.NoticeDTO;
import com.bombom.model.NoticePageDTO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO dao;
	
	private final int rowsize = 5;        // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;          // DB 상의 게시물 전체 수
	
	@RequestMapping("user_notice.do")
	public String user_event(
			HttpServletRequest request, Model model) {
		
		int page;  // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;  // 처음으로 게시물목록 태그를 클릭한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getListCount();
				
		NoticePageDTO dto = new NoticePageDTO(page, rowsize, totalRecord);
		
		List<NoticeDTO> list = this.dao.getNewsList(dto);
		
		model.addAttribute("newsList", list);
		model.addAttribute("page", dto);
		
		return "/user/user_notice";
	}

	
	@RequestMapping("user_notice_cont.do")
	public String cont(@RequestParam("no") int no,
			@RequestParam("page") int nowPage, Model model) {
		
		// 조회수 증가 메서드
		this.dao.Hit(no);
		
		// 글 내용 가지고오기
		NoticeDTO dto = this.dao.newsCont(no);
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("page", nowPage);
		
		return "/user/user_notice_cont";
	}
	
	
	@RequestMapping("admin_notice_write.do")
	public String write() {
		
		return "/admin/admin_notice_write";
	}
	
	
	@RequestMapping("admin_notice_write_ok.do")
	public void writeOk(NoticeDTO dto, HttpServletResponse response) throws Exception {
		
		int res = this.dao.insertNews(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		 if(res > 0) { 
			 
			 out.println("<script>");
			 out.println("alert('게시물 추가 성공!!!')");
			 out.println("location.href='user_notice.do'"); 
			 out.println("</script>"); 
			 
		}else{ 
			
			 out.println("<script>"); 
			 out.println("alert('게시물 추가 실패~~')");
			 out.println("history.back()"); 
			 out.println("</script>"); 
		}
		
		
	}
	
	
	@RequestMapping("user_notice_update.do")
	public String update(@RequestParam("no") int no,
			@RequestParam("page") int nowPage, Model model) {
		
		NoticeDTO modify = this.dao.newsCont(no);
		
		model.addAttribute("modify", modify);
		
		model.addAttribute("page", nowPage);
		
		return "/admin/admin_notice_updateForm";
		
	}
	
	@RequestMapping("admin_notice_update_ok.do")
	public void modifyOk(NoticeDTO dto,
			@RequestParam("page") int nowPage, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
			
			int check = this.dao.updateNews(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('게시물 수정 성공!!!')");
				out.println("location.href='user_notice_cont.do?no="+dto.getNews_no()+"&page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시물 수정 실패~~')");
				out.println("history.back()");
				out.println("</script>");
			}
		
	}
	
	@RequestMapping("user_notice_delete.do")
	public void delete(@RequestParam("no") int no, 
			@RequestParam("page") int nowPage, HttpServletResponse response) throws IOException {
		
		// 게시글 상세 내역 조회하는 메서드 호출
		int res = this.dao.deleteNews(no);
		
		
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			
			this.dao.updateSequence(no);
			
			
			out.println("<script>");
			out.println("alert('게시물 삭제 성공!!!')");
			out.println("location.href='user_notice.do?page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시물 삭제 실패~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	
	
	@RequestMapping("user_bombom_search.do")
	public String search(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,
			@RequestParam("page") int nowPage, Model model) {
		
		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.searchNewsCont(field, keyword);
		
		NoticePageDTO dto = 
				new NoticePageDTO(nowPage, rowsize, totalRecord, field, keyword);
		
		System.out.println("검색 게시물 수 >>> " + dto.getTotalRecord());
		System.out.println("전체 페이지 수 >>> " + dto.getAllPage());
		
		// 한 페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
		List<NoticeDTO>searchList = this.dao.searchNewsList(dto);
		
		model.addAttribute("searchList", searchList);
		
		model.addAttribute("page", dto);
		
		return "/user/user_notice_search";
				
	}
	
	
	
}
