<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> 글쓰기 </title>
	<script src="https://kit.fontawesome.com/912e79718f.js" crossorigin="anonymous"></script>
	<style type="text/css">
	
	*{
		font-family: 'Nanum Gothic', sans-serif;
		box-sizing: border-box;
	}
	body, h1, h2, h3, h4, h5, h6, u1, p, h3, ul, li{
		margin: 0;
		padding: 0;
	}
	body{
		background-color: #FFFFFF;
		font-size: 14px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
		color: inherit;
	}
	div{
		
		text-align: center;
		align-items: center;

	}
	.wrap{
		width: 1200px;
		margin: 100px auto;
		/* border: 1px solid red; */
	}
	.wrap_content{
		
		width: 1000px;
		margin: 100px auto;
		text-align: center;
		align-items: center;
	}
	.board_main{
		display: block;
		text-align: center;
		font-size: 24px;
		font-weight: bold;
		color: #2F3138;
		margin: 20px;
	}
	.block_line{
		margin-top: 10px;
		margin-bottom: 10px;
		display: block;
		border-top: 1px solid #e8e8e8;
	}
	.board_title_box{
		display: block;
		border-top: 1px solid #e8e8e8;
		height: 50px;
		line-height: 50px;
		
	}
	.board_title_content{
		display: flex;
		/* justify-content: space-between; */
		/* margin: 16px auto; */
		height: 100%;
		
	}

	/* 내용 */
	.board_content_box{
		display: block;
		border-top: 1px solid #e8e8e8;
		border-bottom: 1px solid #e8e8e8;
		
			
	}
	.board_content_content{
		display: flex;
		/* margin: 90px auto; */
		text-align: center;	
		
	}
	/* 첨부파일 */
	.upload_box{
		display: block;
		border-top: 1px solid #e8e8e8;
		border-bottom: 1px solid #e8e8e8;
		height: 100px;
		margin-top: 10px;
	}
	.board_upload_content{
		display: flex;
		/* margin: 40px auto; */
		text-align: center;
		height: 100%;
	}
	.upload_title{
		display: block;
		line-height: 98px;

	}
	.upload_content{
		display: block;
		width: 100%;
		outline-style: dotted;
		

	}

	.title_bold{
		font-size: 14px;
		font-weight: bold;
		width: 75px;
		height: 100%;

		
	}
	.margin_left{
		margin-left: 10px;
		height: 100%;

	}
	.margin_right{
		margin-right: 10px;
	}
	.margin_top{
		margin-top: 10px;
	}
	.box{
		border: 1px solid red;
	}

	.writer_btn{
		display: flex;
		justify-content: space-between;
	}
	.cancle_btn{
		cursor: pointer;
		display: block;
		background-color: black;
		color: white;
		border: 1px solid black;
		padding: 8px;
		width: 90px;
	}
	.agree_btn{
		cursor: pointer;
		display: block;
		background-color: black;
		color: white;
		border: 1px solid black;
		padding: 8px;
		width: 90px;
	}
	.content_line{
		line-height: 180px;
	}
	.outline_box{
		margin-top: 41px;
	}
	.txt_content{
		width: 903px;
		height: 100%;
	}

	.title_input{
		width: 100%;
		height: 80%;
		margin: 5px 0;
	}
	.title_line{
		width: 903px;
	}
	.select_box{
		margin: 12px 0;
		padding: 5px;
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
						<span>${name}</span>
						<input type="hidden" value="${name}" name="writer">
					</div>
				</div>
			</div>
			<div class="board_title_box">
				<div class="board_title_content">
					<div class="title_bold margin_left"> 종류 </div>
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
					<div class="title_bold margin_left"> 제목 </div>
					<div class="margin_left title_line">
						<input class="title_input" placeholder="제목을 입력하세요" type="" name="title" value="${one.title}">
						
					</div>
				</div>
			</div>

			<div class="board_content_box">
				<div class="board_content_content">
					<div class="title_bold margin_left content_line">내용</div>
					<div class="margin_left title_line">					
						<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
						<textarea style="min-width: 900px;width:100%;height:100%;" id="board_content" name="content" class="txt_content margin_left" placeholder="내용을 입력하세요">${one.content}</textarea>
					
					</div>						
					
				</div>
			</div>
			
			
			
			<div class="upload_box">
				<div class="board_upload_content">
					<div>
						<div class="upload_title title_bold margin_left">첨부파일</div>
					</div>
					<div class="upload_content margin_left">
						<div class="outline_box">
							<span>첨부파일을 드래그 해주세요.</span>
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
<script type="text/javascript">
	$(function(){
		
		
		// register ==> 게시글 등록과 게시글 수정
		// ${one}에 값이 있으면 수정페이지 로딩!
		if('${one}' != '') {
			// 수정페이지로 디자인 변경
			
			// SelectBox 값으로 Selected
			$('.select_box').val('${one.type}').attr('selected', 'selected');
			$('.board_main').text('글 수정하기');
			$('.agree_btn').text('수정').css('background-color', 'red');
			$('.agree_btn').css('border', '1px solid red');
			$('.agree_btn').css('color', 'white');
		}
	});
	
	
	// 글쓰기에서 취소버튼 눌렀을때
	$(document).on('click', '.cancle_btn', function(){
		var referer = '${header.referer}';
		console.log('이전 URL: ' + referer);
		
		var index = referer.indexOf('/board/list');
		console.log('index: '+referer.indexOf('/board/list'))
		
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
			// 올바른 title 값을 서버로 전송
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
			$('#frm_board').submit();
		}
	});
	
</script>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "board_content",
 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
</script>
</body>
</html>