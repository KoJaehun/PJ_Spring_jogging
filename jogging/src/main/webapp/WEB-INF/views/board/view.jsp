<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>상세게시판</title>
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
		display: block;
	}

	.wrap{
		width: 1000px;
		margin: 100px auto;
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
	.board_title_wrap{
	}
	.board_title{
		display: block;
		border-top: 1px solid #e8e8e8;
		border-bottom: 1px solid #e8e8e8;
		height: 50px;
		margin-top: 10px;
	}
	.board_title_content{
		display: flex;
		justify-content: space-between;
		margin: 15px auto;
	}
	.title_bold{
		font-size: 14px;
		font-weight: bold;
	}
	.title_left{
		margin-left: 15px;
	}
	.title_right{
		margin-right: 10px;
		
	}
	.board_content{
		display: block;
		/* border-top: 1px solid #e8e8e8; */
		border-bottom: 1px solid #e8e8e8;
		
		margin-top: 10px;
	}
	.side_box{
		border: 1px solid #e8e8e8;
		font-size: 12px;
		margin-top: -5px;
		padding: 5px;
	}

	.board_content_review{
		margin: 0 auto;
		
	}

	.board_content_content{
		display: block;
		border: 1px solid #FFFFFF;
		
		margin-top: 10px;
	}
	.board_writer_content{
		margin: 15px;
	}
	.content_nav{
		margin-top: 10px;
		margin-bottom: 10px;
		display: flex;
		justify-content: space-between;
	}

	.nav_flex{
		display: flex;
		justify-content: space-between;
	}
	.nav_btn{
		border: 1px solid #E8E8E8;
		padding: 6px 8px;
		line-height: 20px;
		text-align: center;
		width: 90px;
		margin: 0 2px;
	}
	.black{
		background-color: #000000;
		color: #FFFFFF;
	}
	.grey{
		background-color: #E8E8E8;
		color: #444444;
	}
	.white{
		background-color: #FFFFFF;
		color: #222222;
	}
	.reply_writer_txt{
		margin-left: 10px;
	}
	.reply_writer{
		/* border-bottom: 1px solid #AAAAAA; */
		margin-bottom: 5px;
		line-height: 2;
	}
	.reply_txt{
		display: block;
		border-bottom: : 1px solid #E8E8E8;
		
		
	}
	.reply_box{
		margin: 0 2px;
		font-size: 14px;
		margin-top: 10px;
		display: block;
		border: 1px solid #e8e8e8;
		height: 150px;
	}
	.reply_user{
		display: flex;
		justify-content: space-between;
		border: 1px solid #e1e1e1;
		background-color: #9e9e9e4f;
		color: #444444;
		width: 996px;
		height: 38px;
		text-align: left;
		line-height: 35px;
		margin: 10px 2px;
	}
	.left_margin{
		margin-left: 10px;
	}
	.reply_box span{
		margin-left: 10px;
	}
	.reply_content{
		margin-left: 10px;
		display: block;
		margin-top: 5px;
		padding: 0;
		height: 100%;
	}
	.reply_content{
		height: 50%;
	}
	.reply_content span{
		/* border-bottom: 1px solid #AAAAAA; */
	}
	.err_msg{
		visibility: hidden;
		color: red;
		font-weight: bold;
		line-height: 3;
	}
	.reply_err_box{
		display: flex;
		justify-content: space-between;
	}
	.reply_button{
		display: block;
	}
	
	#reply{
		margin: 5px;
		width: 99%;
		height: 50px;
		border: 1px solid #9999;
		outline-color: #555;
	}
	.reply_input_box{
		/* display: flex; */
		display: block;
		justify-content: space-between;
		padding: 5px;
	}

	.reply_new_user{
		border: 1px solid #000000;
		background-color: #000000;
		color: #FFFFFF;
		height: 38px;
		text-align: left;
		
		line-height: 35px;
	}
	
	.space{
		margin-top: -1px;
	}
	.good_box{
		margin: 0 auto;
		display: flex;
		width: 30px;
		height: 30px;
		align-items: center;
		justify-content: center;			
		border-radius: 50%;
		font-size: 15px;
		background-color: #FFFFFF;
		padding: 15px;

	}
	.good_box:hover {
		background-color: rgba(90, 23, 28, .05);
		border-color: rgba(90, 23, 28, .05);
	}
	


	.insert_btn{
		padding: 2px;
		margin: 5px;
		width: 90px;
		height: 34px;
		text-align: center;
		border: 1px solid #E8E8E8;
		line-height: 28px;
		cursor: pointer;
	}
	.reply_update{
		display: flex;
		margin-top: 30px;
	}
	.reply_update_box{
		background-color: black;
		color: white;
		border: 1px solid black;
		cursor: pointer;
		margin-top: 10px;
		margin-left: 10px;
	}
	.reply_update_box1{
		background-color: black;
		color: white;
		border: 1px solid black;
		cursor: pointer;
		margin-top: 10px;
		margin-left: 10px;
	}
	
	
	#login_txt{
		font-weight: bold;
		color: red;
		line-height: 6;
	}
	.flex_box{
		display: flex;
	}
	.update_reply_check{
		
		display: block;
		color: white;
		background-color: black;
		border : 1px solid black;
		cursor: pointer;
		height: 91%;
		line-height: 28px;
		padding: 2px;
		margin: 5px;
		
	}
	.update_btn{
		
	}
	.update_time{
		
	}
	
	
</style>
</head>

<body>
	<%@ include file="../include/modal.jsp" %>
	<div class="wrap">
		<div class="block_line"></div>
		<div class="board_main">상세게시글</div>
		<div class="block_line"></div>
		

		<div class="board_title">
			<div class="board_title_content">
				<div class="title_bold title_left">${one.bno} ${one.type} ${one.title}</div>
					<div class="title_right side_box">							
						<span><i class="far fa-eye"></i> ${one.viewcnt} </span>
						<span><i class="far fa-comment"></i> <span id="view_replycnt"> ${one.replycnt} </span></span>
						<span><i style="color: red" class="fas fa-heart"></i> ${one.goodcnt} </span>							
					</div>					
			</div>
		</div>
		<div class="board_title space">
			<div class="board_title_content">
				<div class="title_bold title_left">${one.writer}</div>
				<div style="display: flex;">
					<div class="title_right side_box">
						<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>						
						<span>작성시간 ${regdate}</span>
					</div>
					
					<c:if test="${one.regdate != one.updatedate}">
					<div class="title_right side_box update_time">
						<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" var="updatedate"/>						
						<span>수정시간 ${updatedate}</span>
					</div>
					</c:if>
				</div>
			</div>
		</div>
			

		<div class="board_content">
			<div class="board_content_review">
				<div class="board_content_content">
					<div class="board_writer_content">${one.view_content}</div>
					<a href="#" class="good_box"><i style="color: red" class="fas fa-heart"></i></a>
				</div>
				
			</div>
		</div>
		
		<div class="content_nav">
			<div class="left_button nav_flex">
				<a id="list_btn" href="${header.referer}"><div class="nav_btn grey" id="border_list">목록</div></a>
				<a href="${path}/board/answer?bno=${one.bno}"><div class="nav_btn white">답글</div></a>
			</div>
			
			<c:if test="${name == one.writer}">
				<div class="right_button nav_flex">
					<a href="${path}/board/update?bno=${one.bno}"><div class="nav_btn white" id="btn_view_update">수정</div></a>
					<a href="#"><div class="nav_btn black" id="btn_view_delete">삭제</div></a>
				</div>
			</c:if>
		</div>

		
		<div class="block_line"></div>

		<!-- 댓글 쓰기, 목록 -->
		<div id="listReply"></div>
		
		<!--  -->
		<div class="block_line"></div>
		
		
		
		
		
	</div>
</body>
<script type="text/javascript">
	// 문서가 완료되면 시작
	$(function(){
		setInterval(refreshReply(), 3000);
		
		
		
		// 댓글 목록 호출(실행)
		listReply();
		
		//삭제 버튼 클릭시 모달창 Open
		$('#btn_view_delete').click(function(){
			$('.modal_msg_wrap').css('display', 'flex');
		});
		// 삭제 알림 모달창에서 확인버튼 Click -> 게시글 삭제
		$('.modal_msg_yes').click(function(){
			location.href='${path}/board/delete?bno=${one.bno}';
		});
		
		// 1. 댓글 등록버튼 클릭시 
		$(document).on('click', '#reply_btn', function(){
			/* $('.err_msg').css('visibility', 'visible'); */
			
			// 2. reply_txt
			var reply_txt = $('#reply').val();
			
			/* 알럿으로 값을 잘 받는지 체크 */
			/* alert(reply_txt); */
			
			/* 정상적인값이 들어오는지 유효성체크*/
			if(reply_txt == '' || reply_txt.length == 0){
				$('#reply').focus();
				$('.err_msg').css('visibility', 'visible');
				return false;
			}
			
			$('.reply_bno').val('${one.bno}');
			$('.reply_type').val('${one.type}');
			$('.reply_writer').val('${name}');
			
			$.ajax({
				url: '${path}/reply/insert',
				type: 'POST',
				async: false,
				
			
				data: $('.frm_reply').serialize(),
				
				
				success: function() {
					listReply();
					
				}
				
			});
		});
		
		// 댓글 삭제
		
		$(document).on('click', '.reply_update_box', function(){
			var rno = $(this).attr('data_num');	
		 	var bno = '${one.bno}';		 	
			
			$.ajax({
				type: "POST",
				url: '${path}/reply/delete',
				data: {'rno' : rno, 'bno':bno},
				success: function() {
					listReply();
				},
				error: function(){
					alert('고재훈 ㄱㅅ');
				}
			});
		});
		
		
		// 목록 버튼클릭시 비정상적인 접근이면 리스트로 보냄
		$(document).on('click', '#border_list', function(){
			var referer = '${header.referer}';
			console.log('이전 URL: ' + referer);
			
			var index = referer.indexOf('/board/list');
			console.log('index: '+referer.indexOf('/board/list'))
			
			if(index == '-1') {
				// 버튼에서는 href라는 속성을 태그에 줄수없음 
				// location.href = '${path}/board/list';
				
				// a태그는 href속성을 줄 수 있다.
				$('#list_btn').attr('href','${path}/board/list');
			}
		});
		
	});
	
	// 댓글 목록 출력 함수
	function listReply(){
		$.ajax({
			type: "get",
			url: "${path}/reply/list?bno=${one.bno}",
			success: function(result){
				// result : responseText 응답텍스트(html)
				$("#listReply").html(result);
				$('#view_replycnt').text($('.replyListCnt').val());
			}
		});
	}
	
	function refreshReply() {
		
		listReply();
	}
	
	
	
	
</script>
</html>
