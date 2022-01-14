package com.bombom.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bombom.model.MemberDTO;
import com.bombom.model.TalkCommentDAO;
import com.bombom.model.TalkCommentDTO;
import com.bombom.model.TalkDAO;
import com.bombom.model.TalkDTO;
import com.bombom.model.TalkLikeDAO;
import com.bombom.model.TalkLikeDTO;
import com.bombom.model.TalkPagination;

/**
 *	/user_talk.do(GET) : 게시글 리스트로 이동
 * 	/user_talk.do/{talk_no} : 게시글 보기
 *	/user_search.do(GET) : 검색한 키워드 기준으로 페이징 이동 시 사용되는 비즈니스 로직
 *	/user_search.do(POST) : 검색어 입력
 *	/user_write.do(GET) : 글 작성 페이지 이동
 *	/user_write.do(POST) : 글 쓰기 DB 저장
 *	/user_write.do/{talk_no}(GET) : 글 수정 페이지 이동
 *	/user_write.do/{talk_no}(POST) : 글 수정 DB 저장
 *	/user_delete.do(POST) : 글 삭제 (ajax)
 *	/add_like.do : 좋아요 버튼 눌렀을 때 (ajax)
 *	/cancel_like.do : 좋아요 버튼 취소 했을 때 (ajax)
 *	/get_comment.do
 *	/add_comment.do
 *	/update_comment.do
 *	/delete_comment.do
 * 
 * @author HEO
 */

@Controller
public class TalkController {
	
	@Autowired
	private TalkDAO talkDao;
	
	@Autowired
	private TalkLikeDAO talkLikeDao;
	
	@Autowired
	private TalkCommentDAO talkCommentDao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/user_talk.do", method = RequestMethod.GET)
	public String getPosts(@RequestParam(defaultValue = "1")int page, Model model) {
		
		int listCount = talkDao.getPostCount();
		TalkPagination pagination = new TalkPagination(listCount, page);
		List<TalkDTO> posts = talkDao.getPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("today", LocalDate.now().toString());
		model.addAttribute("paging", pagination);
		
		return "user/user_talk";
	}

	@RequestMapping(value = "/user_talk.do/{talk_no}", method = RequestMethod.GET)
	public String content(@PathVariable("talk_no")Long talkNo, Model model, HttpSession session) {
		
		MemberDTO member = (MemberDTO)session.getAttribute("user");
		
		boolean isLiked = false;
		if(member != null) {
			TalkLikeDTO dto = new TalkLikeDTO(talkNo, member.getUser_id());
			int temp = talkLikeDao.checkLike(dto);
			isLiked = temp == 1 ? true : false;
			
			logger.info("Load Talk_Content, isLiked value : {}", temp);
		}
	 
		talkDao.increaseHit(talkNo);
		TalkDTO dto = talkDao.getPost(talkNo);
		
		int listCount = talkDao.getPostCount();
		TalkPagination pagination = new TalkPagination(listCount, 1);
		List<TalkDTO> posts = talkDao.getPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("isLiked", isLiked);
		model.addAttribute("today", LocalDate.now().toString());
		model.addAttribute("paging", pagination);
		model.addAttribute("content", dto);
		
		return "user/user_talk_contents";
	}
	
	@RequestMapping(value = "/user_search.do", method = RequestMethod.GET)
	public String searchPosts(@RequestParam int page, @RequestParam String keyword, Model model) {
		
		int searchCount = talkDao.getPostCount(keyword);
		TalkPagination pagination = new TalkPagination(searchCount, page);
		pagination.setKeyword(keyword);
		
		List<TalkDTO> posts = talkDao.getSearchPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("paging", pagination);
		model.addAttribute("today", LocalDate.now().toString());
		
		return "user/user_talk_search";
	}
	
	@RequestMapping(value = "/user_search.do", method = RequestMethod.POST)
	public String searchPostsPost(@RequestParam String keyword, Model model) {
		
		int searchCount = talkDao.getPostCount(keyword);
		TalkPagination pagination = new TalkPagination(searchCount, 1);
		pagination.setKeyword(keyword);
		
		List<TalkDTO> posts = talkDao.getSearchPosts(pagination);
		
		model.addAttribute("posts", posts);
		model.addAttribute("paging", pagination);
		model.addAttribute("today", LocalDate.now().toString());
		
		return "user/user_talk_search";
	}

	@RequestMapping(value = "/user_write.do", method = RequestMethod.GET)
	public String content(Model model, HttpSession session) {
		
		if(session.getAttribute("user") == null) {
			return "redirect:/user_talk.do";
		}
		
		return "user/user_talk_write";
	}
	
	@RequestMapping(value = "/user_write.do", method = RequestMethod.POST)
	public String insertPost(TalkDTO dto, Model model, HttpSession session) {
		
		// 세션에 user 없으면 리턴
		if(session.getAttribute("user") == null) {
			return "redirect:/user_talk.do";
		}
		
		int result = talkDao.insertPost(dto);
		
		if(result > 0) {
			logger.info("Post inserted, Talk_no : {}", dto.getTalk_no());
			model.addAttribute("talk_no", dto.getTalk_no());
		}
		
		return "redirect:/user_talk.do/{talk_no}";
	}
	
	@RequestMapping(value = "/user_write.do/{talk_no}", method = RequestMethod.GET)
	public String getPostToUpdate(@PathVariable("talk_no")Long talkNo, Model model, HttpSession session) {
		
		TalkDTO dto = talkDao.getPost(talkNo);
		
		MemberDTO member = (MemberDTO)session.getAttribute("user");
	
		// 게시글 작성자 id, session 작성자 id 일치하지 않을 경우 redirect
		if(!(member.getUser_id().equals(dto.getUser_id()))) {
			return "redirect:/user_talk.do";
		}
		
		model.addAttribute("post", dto);
		
		return "user/user_talk_update";
	}
	
	@RequestMapping(value = "/user_write.do/{talk_no}", method = RequestMethod.POST)
	public String updateContent(@PathVariable("talk_no")String talkNo, TalkDTO dto, Model model) throws UnsupportedEncodingException {
		
		//수정된 제목, 본문 인코딩 변환 : iso-8859-1 to utf-8
		dto.setTalk_title(new String(dto.getTalk_title().getBytes("iso-8859-1"), "utf-8"));
		dto.setTalk_cont(new String(dto.getTalk_cont().getBytes("iso-8859-1"), "utf-8"));
		
		dto.setTalk_no(Long.parseLong(talkNo));
		int result = talkDao.updatePost(dto);
		
		if(result > 0) {
			logger.info("Post updated, result value : {}", result);
			model.addAttribute("talk_no", dto.getTalk_no());
		}
				
		return "redirect:/user_talk.do/{talk_no}";
	}
	
	@ResponseBody
	@RequestMapping(value = "/user_delete.do", method = RequestMethod.POST)
	public String deletePost(@RequestParam("id")long talkNo, Model model) {
		
		int talkLikeResult = talkLikeDao.deleteLikes(talkNo);
		int talkResult = talkDao.deletePost(talkNo);
		
		if(talkResult > 0) {
			logger.info("Post deleted, Talk_no : {}", talkNo);
			logger.info("Like deleted, deleted {} rows", talkLikeResult);
			return "200";
		}
		
		return "400";
	}
	
	@ResponseBody
	@RequestMapping(value = "/add_like.do", method = RequestMethod.POST)
	public String addLike(@RequestParam("user_id")String user_id, @RequestParam("talk_no")long talk_no) {
		
		TalkLikeDTO dto = new TalkLikeDTO(talk_no, user_id);
		
		int talkResult = talkDao.increaseLike(dto);
		int talkLikeResult = talkLikeDao.addLike(dto);
		
		logger.info("add_like.do - TalkDAO result : {}, TalkLikeDAO result : {}", talkResult, talkLikeResult);
		logger.info("add_like.do - received likeCount {}", dto.getLikeCount());

		return Integer.toString(dto.getLikeCount());
	}
	
	@ResponseBody
	@RequestMapping(value = "/cancel_like.do", method = RequestMethod.POST)
	public String cancelLike(@RequestParam("user_id")String user_id, @RequestParam("talk_no")long talk_no) {
		
		TalkLikeDTO dto = new TalkLikeDTO(talk_no, user_id);
		
		int talkResult = talkDao.decreaseLike(dto);
		int talkLikeResult = talkLikeDao.cancelLike(dto);
		
		logger.info("cancel_like.do - TalkDAO result : {}, TalkLikeDAO result : {}", talkResult, talkLikeResult);
		logger.info("cancel_like.do - received likeCount = {}", dto.getLikeCount());
		
		return Integer.toString(dto.getLikeCount());
	}
	
	@ResponseBody
	@RequestMapping(value = "/get_comments.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String getComments(@RequestParam long talk_no) throws JsonGenerationException, JsonMappingException, IOException {
		
		List<TalkCommentDTO> comments = talkCommentDao.getComments(talk_no);
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String commentsJson = objectMapper.writeValueAsString(comments);
		
		logger.info("getComments {}", commentsJson);
		
		return commentsJson;
	}
	
	@ResponseBody
	@RequestMapping(value = "/add_comment.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String addComment(@ModelAttribute TalkCommentDTO dto, HttpSession session) throws JsonGenerationException, JsonMappingException, IOException {
		
		if(session.getAttribute("user") == null) {
			return "";
		} else {
			MemberDTO member = (MemberDTO)session.getAttribute("user");
			
			dto.setUser_id(member.getUser_id());
			dto.setUser_nickname(member.getUser_nickname());
		}
		
		int result = talkCommentDao.insertComment(dto);
		
		String resultText = null;
		resultText = result > 0 ? "success" : "error";

		return resultText;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete_comment.do", method = RequestMethod.POST)
	public String deleteComment(@RequestParam long comment_no) {
		logger.info("deleteComment comment_no : {}", comment_no);
		
		int result = talkCommentDao.deleteComment(comment_no);
		
		if(result > 0) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/update_comment.do", method = RequestMethod.POST)
	public String updateComment(TalkCommentDTO dto) {
		
		int result = talkCommentDao.updateComment(dto);
		
		if(result > 0) {
			return "success";
		} else {
			return "error";
		}
	}
	
	
	
}
