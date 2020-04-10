<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글쓰기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script src="https://kit.fontawesome.com/912e79718f.js" crossorigin="anonymous"></script>
<style type="text/css">
* {
	font-family: 'Nanum Gothic', sans-serif;
	box-sizing: border-box;
}

body, h1, h2, h3, h4, h5, h6, u1, p, h3, ul, li {
	margin: 0;
	padding: 0;
}

body {
	background-color: #FFFFFF;
	font-size: 14px;
	font-family: 'Nanum Gothic', sans-serif;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

div {
	text-align: center;
	align-items: center;
}

.wrap {
	width: 1200px;
	margin: 100px auto;
	/* border: 1px solid red; */
}

.wrap_content {
	width: 1000px;
	margin: 100px auto;
	text-align: center;
	align-items: center;
}

.board_main {
	display: block;
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	color: #2F3138;
	margin: 20px;
}

.block_line {
	margin-top: 10px;
	margin-bottom: 10px;
	display: block;
	border-top: 1px solid #e8e8e8;
}

.board_title_box {
	display: block;
	border-top: 1px solid #e8e8e8;
	height: 50px;
	line-height: 50px;
}

.board_title_content {
	display: flex;
	/* justify-content: space-between; */
	/* margin: 16px auto; */
	height: 100%;
}

/* 내용 */
.board_content_box {
	display: block;
	border-top: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
}

.board_content_content {
	display: flex;
	/* margin: 90px auto; */
	text-align: center;
}
/* 첨부파일 */
.upload_box {
	display: block;
	border-top: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
	height: 125px;
	margin-top: 10px;
}

.board_upload_content {
	display: flex;
	/* margin: 40px auto; */
	text-align: center;
	height: 100%;
}

.upload_title {
	display: block;
	line-height: 125px;
}

.board_div {
	display: block;
	width: 100%;
	border: 2px dashed #333;
}

.title_bold {
	font-size: 14px;
	font-weight: bold;
	width: 75px;
	height: 100%;
}

.margin_left {
	margin-left: 10px;
	height: 100%;
}

.margin_right {
	margin-right: 10px;
}

.margin_top {
	margin-top: 10px;
}

.box {
	border: 1px solid red;
}

.writer_btn {
	display: flex;
	justify-content: space-between;
}

.cancle_btn {
	cursor: pointer;
	display: block;
	background-color: black;
	color: white;
	border: 1px solid black;
	padding: 8px;
	width: 90px;
}

.agree_btn {
	cursor: pointer;
	display: block;
	background-color: black;
	color: white;
	border: 1px solid black;
	padding: 8px;
	width: 90px;
}

.content_line {
	line-height: 180px;
}

.uproad_txt {
	margin-top: 50px;
}

.txt_content {
	width: 903px;
	height: 100%;
}

.title_input {
	width: 100%;
	height: 80%;
	margin: 5px 0;
}

.title_line {
	width: 903px;
}

.select_box {
	margin: 12px 0;
	padding: 5px;
}

.input_wrap {
	width: 95%;
	border: 1px solid #FFFFFF;
}

.board_div {
	height: 100%;
}
.uploadedList{
	display: inline-flex;
}

</style>
</head>
<body>
	<div class="wrap">
		<div class="wrap_content">
			<div class="block_line"></div>
			<div class="board_main">게시글 등록</div>
			<div class="block_line"></div>


			<form:form id="frm_board">
				<div class="board_title_box">
					<div class="board_title_content">
						<div class="title_bold margin_left">작성자</div>
						<div class="margin_left">
							<span>${name}</span> <input type="hidden" value="${name}"
								name="writer">
						</div>
					</div>
				</div>
				<div class="board_title_box">
					<div class="board_title_content">
						<div class="title_bold margin_left">종류</div>
						<div class="margin_left">
							<select class="select_box" name="type">
								<option value="free" selected>자유게시판</option>
								<option value="review">후기게시판</option>
								<option value="qna">Q&A</option>
							</select>
						</div>
					</div>
				</div>
				<div class="board_title_box">
					<div class="board_title_content">
						<div class="title_bold margin_left">제목</div>
						<div class="margin_left title_line">
							<input id="board_title" class="title_input"
								placeholder="제목을 입력하세요" type="" name="title"
								value="${one.title}">

						</div>
					</div>
				</div>

				<div class="board_content_box">
					<div class="board_content_content">
						<div class="title_bold margin_left content_line">내용</div>
						<div class="margin_left title_line">
							<script type="text/javascript"
								src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
								charset="utf-8"></script>
							<textarea style="min-width: 900px; width: 100%; height: 100%;"
								id="board_content" name="view_content"
								class="txt_content margin_left" placeholder="내용을 입력하세요">${one.view_content}</textarea>

						</div>

					</div>
				</div>



				<div class="upload_box">
					<div class="board_upload_content">
						<div>
							<div class="upload_title title_bold margin_left">첨부파일</div>
						</div>

						<div class="input_wrap form-group margin_left">
							<div class="board_div fileDrop">
							<ul class="mailbox-attachments flex clearfix uploadedList"></ul>
								<p class="drop_txt">
									<i class="fas fa-paperclip uproad_txt"></i>첨부파일을 드래그 해주세요.
								</p>
							</div>
						</div>
					</div>
					
				</div>
					
				<div class="block_line"></div>

				<div class="writer_btn">
					<button class="cancle_btn" type="button">취소</button>
					<button class="agree_btn" type="button">등록</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
	<script id="fileTemplate" type="text/x-handlebars-template">
		<li>
			<div class="mailbox-attachment-icon has-img" style="width=805px;">
				<img src="{{imgSrc}}" alt="Attachment" class="s_img">
			</div>
			<div class="mailbox-attachment-info">
				<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
					<i class="fa fa-paperclip"></i> {{originalFileName}}
				</a>
				<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
					<i class="fas fa-times"></i>
				</span>
			</div>
		</li>
	</script>
<script type="text/javascript">
	
	
	var flag = '${flag}';
	console.log('flag:' + flag);
	
	// Handlebars 파일템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	
	
	$(function(){		
		// register ==> 게시글 등록과 게시글 수정
		// ${one}에 값이 있으면 수정페이지 로딩!
		if(flag == 'update') {
			// 수정페이지로 디자인 변경
			
			// SelectBox 값으로 Selected
			$('.select_box').val('${one.type}').attr('selected', 'selected');
			$('.board_main').text('글 수정하기');
			$('.agree_btn').text('수정').css('background-color', '#FFFFFF');
			$('.agree_btn').css('border', '1px solid #e8e8e8');
			$('.agree_btn').css('color', '#333');
		} else if (flag == 'answer') {
			// 답글 체크박스 죽이기
			$('.select_box').val('${one.type}')
							.attr('selected', 'selected')
							.attr('onFocus', 'this.initialSelect = this.selectedIndex')
							.attr('onChange', 'this.selectedIndex = this.initialSelect');
							
			$('.board_main').text('게시글 답글');
			$('.agree_btn').text('등록').css('background-color', '#FFFFFF');
			$('.agree_btn').css('border', '1px solid #e8e8e8');
			$('.agree_btn').css('color', '#333');
			
			// 답글 제목 죽이기
			$('#board_title').val('${one.title}')
							 .attr('readonly', 'readonly')
							 .css('border', '1px solid #FFFFFF')
							 .css('outline', 'none');
		}
		
		// 1. 웹브라우저에 drag&drop시 파일이 열리는 문제 ( 기본효과 ) 
		$('.fileDrop').on('dragenter dragover', function(e){
			e.preventDefault();
		});
		
		// 2. 사용자가 파일을 drop 했을 때
		$('.fileDrop').on('drop', function(e){
			e.preventDefault();
			
			// 드래그에 전달된 첨부파일
			var files = e.originalEvent.dataTransfer.files;
			
			// 그중 하나만 꺼내옴
			var file = files[0];
			
			// 폼 객체 생성
			var formData = new FormData();
			
			// 폼에 파일 1개 추가!
			formData.append('file', file);
			
			// 서버에 파일 업로드
			$.ajax({
				url: '${path}/upload/uploadAjax',
				data: formData,
				datatype: "text",   // 생략가능
				processData: false, // 쿼리스트링 방식 생성X
				contentType: false, // 서버단으로 전송하는 데이터 타입(multipart)
				// false로 주게 되면 multipart가 됨 첨부파일을 넣으려면 multipart를 사용. 확장팩
				type: 'POST', 		// 파일을 보낼때는 무조건 'POST'
				success: function(data) { // 이 data가 받는게 datatype
					console.log(data);
					// data : 업로드한 파일 정보와 http 상태 코드
					// 첨부파일 출력 메서드 호출
					printFiles(data);
					
					$('.drop_txt').text('');
				}
			});
		});
	
	// 첨부파일 삭제 리스트
		$('.uploadedList').on('click', '.delBtn', function(event){
			var bno = '${one.bno}';
			var that = $(this);
			
			if(bno == '') {	// 게시글 등록
				$.ajax({
					url: '${path}/upload/deleteFile',
					type: 'POST',
					data: {fileName: $(this).attr('data-src')},
					success: function(data) { // success: data = 'deleted'
						if(data == 'deleted') {
							that.parents('li').remove();
						}
					}, error: function() {
						alert('System Error!!!');
					}
				});
			
			} else { // 게시글 수정
				
			}
		});
	});
		
		// 파일 정보 처리
		function getFileInfo(fullName) {  // 2020.... 이거
			var originalFileName;		  // 화면에 출력할 파일명
			var imgSrc;					  // 썸네일 of 파일아이콘 이미지 파일
			var originalFileurl;		  // 원본파일 요청 URL
			var uuidFileName;			  // 날짜경로를 제외한 나머지 파일명
			var basicFileName = fullName; // 삭제시 값을 전달하기 위한
		
		
		// 이미지 파일이면
		if(checkImageType(fullName)) {
			imgSrc = "${path}/upload/displayFile?fileName=" + fullName;		// 썸네일 이미지 링크
			uuidFileName = fullName.substr(14);								// 순수 이미지 이름만 남음 s_까지 잘림
			var originalImg = fullName.substr(0, 12) + fullName.substr(14);	// 0은 포함 12는 미포함.
			// 원본 이미지 요청 링크
			originalFileUrl = "${path}/upload/displayFile?fileName=" + originalImg;
		} else {
			imgSrc = "${path}/resources/img/file-icon.png"; // 파일 아이콘 이미지 링크
			uuidFileName = fullName.substr(12);
			// 파일 다운로드 요청 링크
			originalFileUrl = "${path}/upload/displayFile?fileName=" + fullName;
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
		function printFiles(data) {
			
			// 파일 정보 처리
			var fileInfo = getFileInfo(data);
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
	
	
	// 글쓰기에서 취소버튼 눌렀을때
	$(document).on('click', '.cancle_btn', function(){
		var referer = '${header.referer}';
		console.log('이전 URL: ' + referer);
		
		var index = referer.indexOf('/board/list');
		console.log('index: '+referer.indexOf('/board/list'));
		
		if(index == '-1') {
			location.href = '${path}/board/list';
		} else {
			location.href = '${header.referer}';	
		}
	});
	
	// 등록 버튼눌렀을때 (유효성체크)
	$(document).on('click', '.agree_btn', function(){
		
		// 유효성체크(제목)
		var title = $('.title_input').val();
		
		if(title == '' || title.length == 0) {
			alert('제목을 입력하세요.');
			return false;
		} else {			
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);			
			var view_content = $('#board_content').val();			
			var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp;", "");	
			$('#frm_board').append('<textarea id="search_content" name="search_content"></textarea>');
			$('#search_content').val(search_content);
			$('#frm_board').submit();
			
		}
	});
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "board_content",
	sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

</script>


</html>
