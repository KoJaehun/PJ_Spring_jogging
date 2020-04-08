package com.jogging.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
	
		// uuid 발급
		UUID uid = UUID.randomUUID(); // 중복된 이름을 방지하기 위해서
		String savedName = uid.toString() + "_" + originalName; 
		// 업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath); // 업로드 디렉토리안에 오늘 날짜의 파일을 만듦, 당일 첨부파일은 해당월일파일에넣음
		File target = new File(uploadPath // 파일 껍데기 만드는것
				+ savedPath, savedName); // 디렉토리는 d드라이브/developer/.. 까지밖에 없음. savedpath랑 target은 합쳐야 완벽한 경로가 됨
		
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);	// 올려야할 첨부파일, '어디에 어떤식으로' 세팅값
		// 파일의 확장자 검사
		// a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring( // 끝에서부터 .을 찾음, formatname에는 확장자가 들어옴
				originalName.lastIndexOf(".") + 1);
		String uploadedFileName = null;
		// 이미지 파일은 썸네일 사용
		if (MediaUtils.getMediaType(formatName) != null) { // 확장자 판단// null 이 아니면 이미지,
			//썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
		// 풀네임을 리턴.. ajaxUploadController로
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		// 2020
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// /2020/04
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		// /2020/04/08
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		return datePath;
	}
	
	
	
	private static void makeDir(String uploadPath, String... paths) {
		// ... 동일한 타입의 매개변수를 여러개 받을때 ... 사용 (동일한것만)
		// paths < 배열로 만들어서 넣어줌 , 동적으로 매개변수갯수가 바뀌어야 할 때
		// ... paths 에는 지금 yearPath, monthPath, datePath 가 들어감
		
		// 디렉토리가 존재하면 skip
		if(new File(paths[paths.length - 1]).exists()) {
					// [] 인덱스 설정. 0,1,2 마지막값을 꺼내온다
					// exists 존재여부확인 
			return;
		}
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
			}
		}
	}
	
	private static String makeIcon(String uploadPath,String path, String fileName) throws Exception {
	// 아이콘의 이름
	String iconName = uploadPath + path + File.separator + fileName;
	// 아이콘 이름을 리턴
	// File.separatorChar : 디렉토리 구분자
	// 윈도우 \, 유닉스(리눅스) /
	
	// uploadPath = c:/developer/upload
	// path >> \2020\04\08
	// fileName >> 1klj12312_abc.png
	
	// iconName = c:/developer/upload/2020\04\08\1klj12312_abc.png
																// \ 를 / 로 치환
	return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	
	
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// 이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// sourceImg = 원본이미지
		// Scalr = 화소수를 줄여서 만들어줌, FIT_TO_HEIGHT 세로 100 에 맞춰서 자동으로 가로길이를맞춰준다.
		
		// 썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		// 기존이름(원본)이랑 똑같이 만들면 중복이 되어버리니까 "s_"를 넣어줌
		// c:/developer/upload/2020/04/08/s_1klj12312_abc.txt
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
}
