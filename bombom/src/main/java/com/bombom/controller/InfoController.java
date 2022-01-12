package com.bombom.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bombom.model.InfoDAO;
import com.bombom.model.InfoDTO;
import com.bombom.model.InfoPageDTO;
import com.bombom.model.InfoReviewDTO;

@Controller
public class InfoController {
	
	private final int rowsize = 10;		// 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;	// DB 상의 게시물 전체 수

	@Autowired
	private InfoDAO dao;
	
	@Autowired
	private InfoUpload upload;
	
	@RequestMapping(value="user_info.do", method = RequestMethod.GET)
	public String user_info(HttpServletRequest request, Model model) {
		
		int page;	// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));	
		} else {	
			page = 1;	// 처음으로 게시물목록 태그를 클릭한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 작업
		totalRecord = this.dao.getInfoCount();
		
		InfoPageDTO dto = new InfoPageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<InfoDTO> InfoList = this.dao.getInfoList(dto);
		
		
		model.addAttribute("List", InfoList);
		model.addAttribute("Paging", dto);
		
		return "/user/user_info";
	}
	
	@RequestMapping("info_detail.do") 
	public String info_detail(@RequestParam("no") int info_no, 
			@RequestParam("page") int nowPage, Model model) throws IOException {
		
		// 게시글 상세 내역 조회하는 메서드 호출
		InfoDTO dto = this.dao.infoCont(info_no);
		
		double getAvg = this.dao.getAvg(dto.getInfo_no());
		
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("page", nowPage);
		
		model.addAttribute("Avg", getAvg);
		
		return "/user/user_info_detail";
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
		int check = this.dao.insertInfo(dto);
		
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
	
	@RequestMapping(value="info_review.do", method = RequestMethod.GET) 
	public String info_review(@RequestParam("info_no") int info_no, 
			HttpServletRequest request, Model model) {
		
		int page;	// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));	
		} else {	
			page = 1;	// 처음으로 게시물목록 태그를 클릭한 경우
		}
		
		// DB 상의 전체 리뷰의 수를 확인하는 작업
		totalRecord = this.dao.getReviewCount(info_no);
		
		InfoPageDTO dto = new InfoPageDTO(page, rowsize, totalRecord, info_no);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<InfoReviewDTO> ReviewList = this.dao.getReviewList(dto);
		
		// 영화 제목 받아 오기 위해 메서드 호출
		InfoDTO idto = this.dao.infoCont(info_no);
		
		model.addAttribute("Cont", idto);
		model.addAttribute("List", ReviewList);
		model.addAttribute("Paging", dto);
		model.addAttribute("Record", totalRecord);
		
		return "/user/user_info_detail_review";
	}
	
	@RequestMapping(value = "/insert_info_review.do", method = RequestMethod.POST)
	public void insertReview(InfoReviewDTO dto, 
			HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		int check = this.dao.insertReview(dto);
		
		this.dao.updateReviews(dto.getInfo_no());
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('리뷰 등록이 완료되었습니다.')");
			out.println("location.href='info_review.do?info_no="+dto.getInfo_no()+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('리뷰 등록에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	}
	
	@RequestMapping(value="user_info_update.do", method = RequestMethod.GET)
	public String modify(@RequestParam("no") int info_no,
			@RequestParam("page") int nowPage, Model model) {
		
		// 게시글 상세 내역 조회하는 메서드 호출
		InfoDTO dto = this.dao.infoCont(info_no);
		
		model.addAttribute("modify", dto);
		
		model.addAttribute("page", nowPage);
		
		return "/user/user_info_update";
	}
	
	
	@RequestMapping(value="user_info_update.do", method = RequestMethod.POST)
	public void modifyOk(InfoDTO dto, @RequestParam("page") int nowPage,
			MultipartHttpServletRequest mRequest, 
			HttpServletResponse response, HttpServletRequest request) 
					throws IllegalStateException, IOException {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		
		String date = year + "-" + month + "-" + day;
		
		// 화면단에서 전달되는 파일 받을 객체
		MultipartFile thumbnail = mRequest.getFile("thumbnail");
		MultipartFile bgimg = mRequest.getFile("bgimg");
		
		// 화면단에서 전달된 파일 객체가 없을 시, 원래 파일로 대체
		if(thumbnail.isEmpty()) {
			InfoDTO original = this.dao.infoCont(dto.getInfo_no());
			 
			System.out.println("원래 파일 잘 가져오는지 보자 :" + original.getInfo_thumbnail());
			
			dto.setInfo_thumbnail(original.getInfo_thumbnail());
			
		} else {
			
			// 파일 저장할 경로 지정
			String filePath = 
					request.getSession().getServletContext().getRealPath("resources/upload/info/"+date+"/");	
			
			System.out.println("영화 정보 이미지 파일경로 > " + filePath);
			
			File path1 = new File(filePath);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 파일을 업로드하기 위한 파일 객체 생성
			File file = new File(filePath, System.currentTimeMillis() + "_" + thumbnail.getOriginalFilename());
			
			// 파일 업로드
			// transferTo : 업로드요청으로 전달받은 파일을 위에서 설정한 특정 경로에 특정 파일명으로 저장
			thumbnail.transferTo(file);
			
			String fileName = date + "/" +file.getName();
			
			dto.setInfo_thumbnail(fileName);
		}
		
		if(bgimg.isEmpty()) {
			 InfoDTO original = this.dao.infoCont(dto.getInfo_no());
			 
			 System.out.println("원래 파일 잘 가져오는지 보자 :" + original.getInfo_bgimg());
			
			 dto.setInfo_bgimg(original.getInfo_bgimg());
			
		} else {
			
			// 파일 저장할 경로 지정
			String filePath = 
					request.getSession().getServletContext().getRealPath("resources/upload/info/"+date+"/");	
			
			System.out.println("영화 정보 이미지 파일경로 > " + filePath);
			
			File path1 = new File(filePath);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 파일을 업로드하기 위한 파일 객체 생성
			File file = new File(filePath, System.currentTimeMillis() + "_" + bgimg.getOriginalFilename());
			
			// 파일 업로드
			// transferTo : 업로드요청으로 전달받은 파일을 위에서 설정한 특정 경로에 특정 파일명으로 저장
			bgimg.transferTo(file);
			
			String fileName = date + "/" +file.getName();
			
			dto.setInfo_bgimg(fileName);
		}
		
		int res = this.dao.updateInfo(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('영화 정보 수정 성공!')");
			out.println("location.href='info_detail.do?no="+dto.getInfo_no()+"&page="+nowPage+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('영화 정보 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("user_info_delete.do")
	public void deleteOk(@RequestParam("no") int info_no,
			@RequestParam("page") int nowPage,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8"); 
		
		PrintWriter out = response.getWriter();
		
		this.dao.deleteReview(info_no);
		
		int check = this.dao.deleteInfo(info_no);
			
		if(check > 0) {
			
			out.println("<script>");
			out.println("alert('게시물 삭제를 성공했습니다.')");
			out.println("location.href='user_info.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시물 삭제를 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("user_info_search.do")
	public String search(
			@RequestParam("keyword") String keyword, 
			@RequestParam("page") int nowPage, Model model) {
		
		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.searchInfoCount(keyword);
		
		InfoPageDTO dto = 
				new InfoPageDTO(nowPage, rowsize, totalRecord, keyword);
		
		// 검색한 게시물을 List로 가져오는 메서드. == 한 페이지당 보여질 게시물의 수만큼.
		List<InfoDTO> searchList = this.dao.searchInfoList(dto);
		
		model.addAttribute("List", searchList);
		
		model.addAttribute("Paging", dto);
		
		return "/user/user_info_search";
		
	}
	
}
