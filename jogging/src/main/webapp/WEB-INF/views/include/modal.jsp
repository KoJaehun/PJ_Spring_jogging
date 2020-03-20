<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		
		.body{
			font-family: 'Nanum Gothic', sans-serif;
		
		}
		
		.modal_msg_wrap{
			position: fixed;
			z-index: 1001;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: none;
			justify-content: center;
			align-items: center;			
		}
		.modal_content_msg{
			display: flex;
			justify-content: center;
			align-items: center;
			position: relative;
			width: 400px;
			height: 400px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0, 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 5px;
			overflow: hidden;
			padding: 0;
			margin: 0;

		}

	
		
		.content_box{
			display: block;
			width: 380px;
			height: 330px;	
			justify-content: center;
			align-items: center;
			text-align: center;

		}
		.content_head{
			display: flex;
			justify-content: center;
			align-items: center;
			color: #333;
			font-weight: bold;
			font-size: 25px;
			text-align: center;
			width: 380px;
			height: 80px;
			margin: 0px;
			border-top: 2px solid #eee;
			border-bottom: 2px solid #eee;
		}
		.content_head > h1 {
			font-size: 25px;
			color: black;
		}
		.content_body{
			max-width: 380px;
			height: 150px;
			display: block;
			border-bottom: 2px solid #eee;
			font-size: 14px;
			display: flex;
			justify-content: center;
			align-items: center;
			padding-left: 35px;
			padding-right: 35px;
		}
		.content_foot{
			width: 380px;
			height: 94px;
			display: block;
			border-bottom: 2px solid #eee;
			font-weight: bold;
			font-size: 25px;
			display: flex;
			justify-content: center;
			align-items: center;

		}
		.content_body > h3 {
			font-size: 15px;
			font-weight: bold;
			color: red;
		}
		
		.content_foot{
			display: flex;
			justify-content: space-around;

		}
		.modal_msg_cancel{
			background-color: white;
			width: 350px;
			padding: 10px;
			border: 2px solid #eee;
		}
		.okay{
			background-color: black;
			color: white;
			width: 150px;
			padding: 10px;
			font-weight: 600;
		}
		.modal_msg_cancel{
			text-align: center;
		}
		
	</style>
</head>

<body>	
	<div class="modal_msg_wrap">
		<div class="modal_content_msg">
			<div class="content_box">				
				<div class="content_head">
					<h1>회원가입성공</h1>
				</div>
				<div class="content_body">
					<div><h3 id="modal_msg_main_txt"></h3></div>
					<div><h3 id="modal_msg_sub_txt"></h3></div>	
				</div>					
				<div class="content_foot">
					<div class="modal_msg_cancel">닫기</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var id='${id}';
		var email='${email}';
		var key='${key}';
		
		var join_main_txt = id+'님 회원가입을 축하드립니다.';
		var join_sub_txt = email+'으로 인증메일을 보냈습니다. 인증하셔야만 사이트 활동이 가능합니다.';				
		var auth_main_txt = id+'님 이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다';
		var drop_main_txt = '$[userid}님 정말 탈퇴하시겠습니까?';
		var dropResult_main_txt = id+'님 탈퇴되었습니다. ';
		var dropResult_sub_txt = '그동안 JOGGING을 이용해주셔서 감사합니다.';
		
		if(key == 'join') {
			$('#modal_msg_main_txt').text(join_main_txt);
			$('#modal_msg_sub_txt').text(join_sub_txt);
			$('.modal_msg_yes').css('display', 'none')  // 확인버튼제거
							   .text('확인');
			
			$('.modal_msg_wrap').css('display','flex');  // 모달창 출력
		} else if(key == 'auth') {
			$('#modal_msg_main_txt').text(auth_main_txt);
			$('#modal_msg_sub_txt').text(auth_sub_txt);
			$('.modal_msg_yes').css('display', 'none')
							   .text('확인');
			
			$('.modal_msg_wrap').css('display','flex');
		}  else if(key == 'dropResult'){
			$('#modal_msg_main_txt').text(dropResult_main_txt);
			$('#modal_msg_sub_txt').text(dropResult_sub_txt);
			$('.modal_msg_yes').css('display', 'none')
							   .text('확인');
			$('.modal_msg_wrap').css('display','flex');
		}
		

		$('.modal_msg_close').on('click', function() {
			$('.modal_msg_wrap').css('display', 'none');
		});
		$('.modal_msg_cancel').on('click', function(){
			$('.modal_msg_wrap').css('display','none');
		});
	});
</script>
</html>