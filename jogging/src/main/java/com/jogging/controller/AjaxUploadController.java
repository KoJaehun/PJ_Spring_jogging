package com.jogging.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jogging.service.board.BoardService;
import com.jogging.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	// 업로드 디렉토리 servlet-context.xml 에 설정되어 있는
	@Resource(name = "uploadPath")
	String uploadPath;
	
	// 파일첨부 페이지로 이동
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
	
		return "/upload/uploadAjax";
		
	}
	
	// Upload File 멀티파트파일에 Save
	// ResponseBody Ajax를 사용할때 페이징이동 X 쓰임
	@ResponseBody
	@PostMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		// 업로드한 파일 정보와 Http 상태 코드를 함께 리턴
		// Ajax 끝나고 view단으로 이동할때
		// 1.uploadpath : d:/developer/upload
		// 2. 파일이름
		// 3. 파일크기(byte)
		// 4. HttpStatus.ok = 성공
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	
	}
	
	
	
}
