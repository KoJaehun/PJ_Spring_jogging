// 파일 정보 처리
	function getFileInfo(fullName, path) {  // 2020.... 이거
		var originalFileName;		  // 화면에 출력할 파일명
		var imgSrc;					  // 썸네일 of 파일아이콘 이미지 파일
		var originalFileurl;		  // 원본파일 요청 URL
		var uuidFileName;			  // 날짜경로를 제외한 나머지 파일명
		var basicFileName = fullName; // 삭제시 값을 전달하기 위한
		
		
		// 이미지 파일이면
		if(checkImageType(fullName)) {
			imgSrc = path+"/upload/displayFile?fileName=" + fullName;		// 썸네일 이미지 링크
			uuidFileName = fullName.substr(14);								// 순수 이미지 이름만 남음 s_까지 잘림
			var originalImg = fullName.substr(0, 12) + fullName.substr(14);	// 0은 포함 12는 미포함.
			// 원본 이미지 요청 링크
			originalFileUrl = path+"/upload/displayFile?fileName=" + originalImg;
		} else {
			imgSrc = path+"/resources/img/file-icon.png"; // 파일 아이콘 이미지 링크
			uuidFileName = fullName.substr(12);
			// 파일 다운로드 요청 링크
			originalFileUrl = path+"/upload/displayFile?fileName=" + fullName;
		}
		originalFileName=uuidFileName.substr(uuidFileName.indexOf("_")+1);
		// 전체 파일명의 크기가 14보다 작으면 그대로 이름 출력, 14보다 크면 실행
		
		if(originalFileName.length > 14) {
			// 앞에서부터 11글자 자름
			var shortName = originalFileName.substr(0,10);
			// .을 기준으로 배열 생성
			var formatVal = originalFileName.split(".");
			// formatVal = originalName.substr(originalFileName.length-3)
			// 파일명에 .이 여러개 들어가 있을수도 있음
			// 배열크기를 구해와서 무조건 맨 마지막 확장자부분 출력되게 함
			var arrNum = formatVal.length -1;
			// 맨 처음 문자열 10글자 + ... + 확장자
			originalFileName = shortName + "..." + formatVal[arrNum];
		}
		return {originalFileName : originalFileName, imgSrc : imgSrc, originalFileUrl : originalFileUrl, fullName : fullName, basicFileName : basicFileName}
	}
		
		
		
	// 첨부파일 출력
	function printFiles(data, path) {
			
		// 파일 정보 처리
		var fileInfo = getFileInfo(data, path);
		console.log(fileInfo);
		// Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML 생성
		var html = fileTemplate(fileInfo);
		html += "<input type = 'hidden' class='file' value='"+fileInfo.fullName+"'>";
		// Handlbars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		$(".uploadedList").append(html);
		// 이미지 파일인 경우 aaaaaaaaaaa파일 템플릿에 lightbox 속성 추가
			
		console.log(html);
		if(fileInfo.fullName.substr(12, 2) === "s_") {
			// 마지막에 추가된 첨부파일 템플릿 선택자
			var that = $(".uploadedList li").last();
			// lightbox 속성 추가
			that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
			// 파일 아이콘에서 이미지 아이콘으로 변경
			that.find(".fa-paperclip").attr("class", "fa fa-camera");
		}
	}
		
	function getOriginalName(fileName){
		if(checkImageType(fileName)){ 	 // 이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_")+1; // uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
		
	function getImageLink(fileName){
		if(!checkImageType(fileName)){ 	 // 이미지 파일이 아니면 skip
		return;
		}
		var front=fileName.substr(0,12); // 연월일 경로
		var end=fileName.substr(14);	 // s_ 제거
		return front+end;
	}
	
	function checkImageType(fileName) {
		var pattern=/jpg|gif|png|jpeg/i; // 정규식표현식(대소문자 무시)
		return fileName.match(pattern);  // 규칙에 맞으면 true
	}
	
	// 첨부파일 리스트를 출력하는 함수
	function listAttach(){
	var listCnt = 0;
	$.ajax({
		type: "POST",
		url: "${path}/board/getAttach/${one.bno}",
		async:false,
		success:function(list){
			listCnt = list.length;
			$(list).each(function(i,e){
				printFiles(e);
			});
		}
	});
		return listCnt;
	}