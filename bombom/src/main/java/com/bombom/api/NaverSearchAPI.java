package com.bombom.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


//네이버 검색 API 공식문서 : https://developers.naver.com/docs/serviceapi/search/blog/blog.md#%EB%B8%94%EB%A1%9C%EA%B7%B8 

public class NaverSearchAPI {


	 public static String searchBlog(String keyword) {
    
		String clientId = "6JrHyX7NsCshdEmcCZGR"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "OQiQk1ECkt"; //애플리케이션 클라이언트 시크릿값"

        String text = null;
        
        try {
            text = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text + "&display=20&sort=date";    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
        
        //String apiURL = "https://openapi.naver.com/v1/search/local.xml?query=" + text;	//플레이스 검색 xml결과
        //String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text; //플레이스 검색 json 결과

        Map<String, String> requestHeaders = new HashMap<String, String>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
        System.out.println(responseBody);
        
        return responseBody;
    }
	 
	 public static String searchImage(String keyword) {
		    
			String clientId = "6JrHyX7NsCshdEmcCZGR"; //애플리케이션 클라이언트 아이디값"
	        String clientSecret = "OQiQk1ECkt"; //애플리케이션 클라이언트 시크릿값"

	        String text = null;
	        
	        try {
	            text = URLEncoder.encode(keyword, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }

	        String apiURL = "https://openapi.naver.com/v1/search/image?query=" + text + "&display=4&sort=date";    // json 결과

	        Map<String, String> requestHeaders = new HashMap<String, String>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);
	        
	        System.out.println(responseBody);
	        
	        return responseBody;
	    }
    

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}