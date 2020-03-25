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
		height: 200px;
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
		height: 95%;
	}

	.board_content_content{
		display: block;
		border: 1px solid #FFFFFF;
		height: 90%;
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
		border: 1px solid #e1e1e1;
		background-color: #9e9e9e4f;
		color: #444444;
		height: 38px;
		text-align: left;
		line-height: 35px;
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
		border-bottom: 1px solid #AAAAAA;
	}


	.reply_button{
		display: block;
	}
	
	#reply{
		margin: 5px;
		width: 90%;
		height: 90px;
		border: 1px solid #9999;
		outline-color: #555;
	}
	.reply_input_box{
		display: flex;
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
	}
	.reply_update{
		display: flex;
		justify-content: flex-end;
		margin-right: 10px;
	}
	.reply_update_update{
		margin-right: 5px;
	}
	.reply_update_delete{
		margin-right: 5px;
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
				<div class="title_bold title_left">${one.title}</div>
					<div class="title_right side_box">							
						<span><i class="far fa-eye"></i> ${one.viewcnt} </span>
						<span><i class="far fa-comment"></i> ${one.replycnt} </span>
						<span><i style="color: red" class="fas fa-heart"></i> ${one.goodcnt} </span>							
					</div>					
			</div>
		</div>
		<div class="board_title space">
			<div class="board_title_content">
				<div class="title_bold title_left">${one.writer}</div>
				<div style="display: flex;">
					<div class="title_right side_box">
						<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>						
						<span>${regdate}</span>
					</div>				
				</div>
			</div>
		</div>
			

		<div class="board_content">
			<div class="board_content_review">
				<div class="board_content_content">
					<div class="board_writer_content">${one.content}</div>
					
				</div>
				<a href="#" class="good_box"><i style="color: red" class="fas fa-heart"></i></a>
			</div>
		</div>
		
		<div class="content_nav">
			<div class="left_button nav_flex">
				<a href="${header.referer}"><div class="nav_btn grey">목록</div></a>
				<a href="#"><div class="nav_btn white">답변</div></a>
			</div>
			
			<c:if test="${name == one.writer}">
				<div class="right_button nav_flex">
					<a href="#"><div class="nav_btn white" id="btn_view_update">수정</div></a>
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
	});
	
	// 댓글 목록 출력 함수
	function listReply(){
		$.ajax({
			type: "get",
			url: "${path}/reply/list?bno=${one.bno}",
			success: function(result){
				// result : responseText 응답텍스트(html)
				$("#listReply").html(result);
			}
		});
	}
</script>
</html>
