package com.bombom.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bombom.model.InfoDTO;

@Service
public class InfoUpload {

public void fileUpload(MultipartHttpServletRequest mRequest, InfoDTO dto, HttpServletRequest request) {
		
	
		String uploadPath =
				request.getSession().getServletContext().getRealPath("resources/upload/info/");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originalFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ...\\resources\\upload\\2021-12-24
			String homedir = uploadPath + year + "-" + month + "-" + day;
			String date = year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 실제적으로 파일을 만들어 보자.
			String saveFileName = originalFileName;
			
			if(saveFileName != null && !saveFileName.equals("")) {
				saveFileName = 
						System.currentTimeMillis() + "_" + saveFileName;
				
				try {
					// ....\\resources\\upload\\2021-12-24\\실제파일
					File origin = new File(homedir+"/"+ saveFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
					mFile.transferTo(origin);
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				saveFileName = date + "/" + saveFileName;
			}
			
			if(dto.getInfo_thumbnail() == null) {
				dto.setInfo_thumbnail(saveFileName);
			} else {
				dto.setInfo_bgimg(saveFileName);
			}
			
		}	// while문 end
		
		
	}

}
