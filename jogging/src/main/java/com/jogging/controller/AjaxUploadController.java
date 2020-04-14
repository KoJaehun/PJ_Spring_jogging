package com.jogging.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jogging.service.board.BoardService;
import com.jogging.util.MediaUtils;
import com.jogging.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired // 타입으로 읽음
	BoardService bService; // BoardService는 인터페이스, 인터페이스 객체가 아님 beans생성 X
	// BoardServiceImpl 은 클래스
	
	// 업로드 디렉토리 servlet-context.xml 에 설정되어 있는
	@Resource(name = "uploadPath") // @Resource = 의존성주입. 이름으로 읽음
	String uploadPath;
	
	// Upload File 멀티파트파일에 Save
	// ResponseBody Ajax를 사용할때 페이징이동 X 쓰임
	// RequestMapping = GET,POST 둘다 사용 (메서드=get,post 설정)
	//					method를 생략하면 get,post 둘다 받음
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		log.info("타냐?");
		// <> 제네릭 : 들어오는 값들을 체크, 여기서는 String 타입만 들어올 수 있다는 뜻, 타입을 강하게 check
		// 업로드한 파일 정보와 Http 상태 코드를 함께 리턴
		// Ajax 끝나고 view단으로 이동할때
		// 1.uploadpath : d:/developer/upload
		// 2. 파일이름
		// 3. 파일크기(byte)
		// 4. HttpStatus.ok = 성공
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
		// UploadFileUtils.uploadFile() = 클래스 이름으로 호출하는건 static 밖에없다.
		// = static uploadFile
		
		// file.getOriginalFilename()
		// 연속해서 들어오는 데이터를 stream(스트림)이라 한다. 한번에 데이터를 다 보낼수 없으니 쪼개서 보냄
		// 바이트 단위로 쪼개져서 들어옴
	}
	
	// 이미지 표시 기능
	@ResponseBody
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		log.info("그림을띄워보자");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath+fileName);			
				fileName =fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"),"iso-8859-1")+"\"");			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in!=null) {
				in.close(); // 스트림 닫기
			}
		}
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/upload/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("fileName: " + fileName);
		// fileName = "/2020/04/10/s_13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png"
		
		// 확장자 검사
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// formatName = png
		MediaType mType = MediaUtils.getMediaType(formatName);
		if(mType != null) { // 이미지 파일이면 원본 이미지 삭제
			String front = fileName.substring(0, 12);
			// front : /2020/04/10/
			String end = fileName.substring(14);
			// end : 13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png
			// File.separatorChar : 유닉스 / 윈도우즈 \
			
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			// new File(uploadpath : c://developer/upload)
			//			front+end  :/2020/04/10/13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png
			// new File >> c://developer/upload/2020/04/10/13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png
			// replace >> c:\\developer\ upload\2020\04\10\13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png
			// delete >> c:\\developer\ upload\2020\04\10\13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png
			// 원본이미지만 삭제
		}
		
		// 원본 파일 삭제 ( 이미지이면 썸네일 삭제 )
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		// new File(c://developer/upload/s_13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png) (썸네일이미지)
		// replace >> c:\\developer\ upload\2020\04\10\s_13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png
		// delete >> c:\\developer\ upload\2020\04\10\s_13d78e25-d0d3-483f-b5df-936652dcb4b8_팬텀.png
		
		// 썸네일 이미지 삭제 or 이미지가 아닌 첨부파일삭제
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
	@ResponseBody // 뷰가 아닌 데이터를 리턴
	@PostMapping("upload/deleteAllFile")
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {
		log.info("delete all files: " + files);
		
		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) { // 이미지 파일이면 원본이미지 삭제
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				// File.separatorChar : 유닉스 / 윈도우즈 \
				new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			}
			
			// 원본 파일 삭제(이미지이면 썸네일 삭제)
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
	

