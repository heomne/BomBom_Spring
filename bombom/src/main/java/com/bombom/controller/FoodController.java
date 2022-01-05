package com.bombom.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bombom.api.BlogDTO;
import com.bombom.api.NaverSearchAPI;

@Controller
public class FoodController {

	@RequestMapping("user_food_detail.do")
	public String user_food_detail(HttpServletRequest request, @RequestParam("keyword") String keyword) {
	
		//블로그 검색 호출
		String result = NaverSearchAPI.searchBlog(keyword + "맛집");
		
		List<BlogDTO> itemList = new ArrayList<BlogDTO>();
		
		//결과값 파싱 (JSON) 
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray blogArray = (JSONArray) jsonObject.get("items");
			
			//BlogDTO에 저장 후 itemList에 추가
			for(int i=0; i<blogArray.size(); i++) {
				
				JSONObject item = (JSONObject) blogArray.get(i);
				
				BlogDTO dto = new BlogDTO();
				
				//날짜 가공
				String date = (String)item.get("postdate");
				String postdate = date.substring(0, 4) + ". " + date.substring(4, 6) + ". 	" + date.substring(6, 8);
				
				dto.setTitle((String)item.get("title"));
				dto.setDesc((String)item.get("description"));
				dto.setLink((String)item.get("link"));
				dto.setBlogger((String)item.get("bloggername"));
				dto.setDate(postdate);
				
				itemList.add(dto);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("keyword", keyword);	//극장맛집 페이지에서 넘어온 검색어
		request.setAttribute("itemList", itemList); //파싱된 데이터를 담은 객체
		
		return "/user/user_food_detail";
	}
}
