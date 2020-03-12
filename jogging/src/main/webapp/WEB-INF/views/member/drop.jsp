<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/modal.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>회원탈퇴</title>
	<script src="https://kit.fontawesome.com/2518bc55d6.js" crossorigin="anonymous"></script>
	<style type="text/css">

		@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
		body{
			background-color: #FFFFFF;
			
		}
		body, ul, h1, h2, h3, h4, h5, h6{
			margin: 0;
			padding: 0;
		}
		a{
			text-decoration: none;
		}
		body, th, td, input, select, textarea, button {
			font-size: 14px;
			font-family: 'Nanum Gothic', sans-serif;
			font-weight: bold;
			line-height: 1.5;
			color: #333;
			
		}
		.address, caption, cite, code, dfn, em, var{
			font-style: normal;
			font-weight: normal;
		}
		.wrap{
			width: 800px;
			margin: 100 auto;
			position: relative;
		}
		/* header */
		#header{
			width: 800px;
			height: 100px;
			padding-top: 70px;
			position: relative;
			border: 1px solid red;
			
		}
		h1{
			display: block;
			font-size: 20px;
			
		}
		/* section */
		#section{
			width: 800px;
			height: 100px;
			padding-top: 70px;
			position: relative;
			border: 1px solid blue;
		}
		.form{
			display: block;
			margin: 0;
			padding: 0;
		}
		.info_agree{
			padding: 30px 30px 20px;
			overflow: hidden;
			border-top: 1px solid #e1e1e1;
			border-bottom: 1px solid #e1e1e1;
			background-color: #FFFFFF;
		}
		.info_agree .info_user{
			position: relative;
			width: 740px;
			height: 120px;
			margin-bottom: 30px;
			padding: 25px 30px 20px 20px;
			overflow: hidden;
			border: 1px solid #dfdfdf;
			background-color: #fff;
			color: #444;
		}
		.info_user .tit_agree{
			display: block;
			margin-right: 30px;
			padding-bottom: 5px;
			font-size: 18px;
			line-height: 24px;
			letter-spacing: -1px;
		}
		.info_user .txt_agree{
			line-height: 22px;
		}
		.info_user .emph_g{
			color: red;
			font-weight: bold;
		}
		.info_user > label{
			background: url('${path}/resources/img/checkbox222.png') 100% 50% no-repeat;
			display: block;
			position: absolute;
			right: 25px;
			width: 25px;
			height: 25px;
			margin-top: -11px;
			top: 50%;
		}
		.info_user{
			position: relative;
			display: block;
			height: 58px;
		}
		.info_user > input:checked + label {
			background-image: url('${path}/resources/img/checkbox333.png');
		}
		
		.info_user > input {
			visibility: hidden;
			position: absolute;
			right: 25px;
			width: 25px;
			height: 25px;
			margin-top: -11px;
			top: 50%;
		}
		.info_user > label{
			background: url('${path}/resources/img/checkbox222.png') 100% 50% no-repeat;
			display: block;
		}
		.info_user > input:checked + label{
			background-image: url('${path}/resources/img/checkbox333.png');
		}
		
		.drop_err_msg{
		}

		/* 취소 확인 */
		.btn_double_area{
			margin: 30px -5px 0px;
			overflow: hidden;
			
		}
		.btn_double_area > span{
			display: block;
			float: left;
			width: 50%;
			
		}
		.btn_type{
			width: auto;
			margin: 0px 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 61px;
			display: block;
			box-sizing: border-box;
			height: 61px;
			padding-top: 1px;
			text-align: center;
			cursor: no-drop;
			
		}
		.btn_default{
			color: #333;
			border: 1px solid #E1E1E1;
			background-color: white;
		}
		.btn_agree{
			color: #fff;
			/* border: 1px solid #1fbc02; */
			background-color: black;
			font-weight: bold;
			
		}
		.usercheck{
			
			
			border-bottom: 1px solid #e1e1e1;
			margin-top: -20px;
			padding: 10px 0px 17px 0px;


		}
		.usercheck h1{
			display: block;
			font-weight: bold;
			font-size: 19px;
			text-align: center;
			
		}
		.id_section{
			text-align: center;
			width: 100%;
			font-size: 14px;
			padding: 15px 0px 0px 0px;
		}
		.id_box{
			margin: 10px 0;
			display: inline-block;
			width: 280px;
			height: 38px;
			padding: 0 15px;
			border: 1px solid #d4d4d4;
			border-radius: 3px;
			
			line-height: 38px;
			background-color: white;
			text-align: left;
		}
		.pw_input_group{
			display: inline-block;
			width: 280px;
			height: 38px;
			padding: 0 15px;
			border: 1px solid #d4d4d4;
			border-radius: 3px;
			line-height: 38px;
			background-color: white;
			text-align: left;
		}
		.pw_input_group .wrapper input{
			width: 90%;
		}
		.wrapper input {
			outline: none;
			display: block;
			
			border: 0;
			width: 100%;
			margin-top: 10px;
			line-height: 100%;
			background-color: white;
		}
		.myinfo{
			display: block;
			width: 100%;
			overflow: hidden;
			height: 150px;
		}
		.header_logo{
			padding-top: 50px;
		}
		.tit_outagree{
			width: 620px;
			background-position: 0 -1500px;
		}
		
		.info_agree h1{
			color: #333;
			display: block;
			font-weight: bold;
			font-size: 21px;
			text-align: center;
		}
		.header_logo {
			
			font-weight: bold;
			color: red;
		}


		/* 모달 시작 */
		.modal_wrap{
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			display: none;
		}
		.modal_content{
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

		/* 모달 끝 */
		
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
		}
		.content_body > h3 > em {
			font-weight: bold;
			color: red;
		}
		.content_foot{
			display: flex;
			justify-content: space-around;

		}
		.cancel{
			background-color: white;
			width: 150px;
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
		
		.join_err_msg{
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
			/* visibility: hidden; */
		}


	</style>
</head>
<body>
	<div class="modal_wrap">
		<div class="modal_content">


			
			<div class="content_box">
				

				<div class="content_head">
					<h1>회원탈퇴</h1>
				</div>


				<div class="content_body">
					<h3>탈퇴한 후에는 더 이상 조깅계정으로 로그인<br>할 수 없으므로, 조깅계정으로
				연결하여 사용한 외부 서비스들도 모두 이용할 수 없게 됩니다.<br>
				<em class="point">탈퇴된 계정의 정보와 서비스 
				이용기록</em> 등은<br>복구할 수 없으니 신중하게 선택하시길 바랍니다.</h3></div>
				
				

				<div class="content_foot">
					<div class="modal_cancel">취소</div>
					<div class="modal_okay">확인</div>
				</div>


			</div>


		</div>
	</div>
		










		<div class="wrap">
			
			<header>
				<div class="info_agree">
						<h1 class="header">회원탈퇴 <em class="header_logo"> 유의사항 및 안내 </em>를 반드시 읽고 진행해주세요</h1>
					</div>
				
			</header>
				
			
				<form>
					<div class="info_agree">
						
						<div class="info_user">
							<strong class="tit_agree">Jogging 아이디 재사용 및 복구 불가 안내</strong>
							<span class="txt_agree">회원탈퇴 진행 시 본인을 포함한 타인 모두
								<em class="emph_g">아이디 재사용이나 복구가 불가능합니다.</em><br>
								신중히 선택하신후 결정해주세요.
							</span>
							<input type="checkbox" id="cbox1" class="ckboxs">
						  			<label for="cbox1">

							
						</div>
						<div class="info_user">
							<strong class="tit_agree">내정보 및 개인형 서비스 이용 기록 삭제 안내</strong>
							<span class="txt_agree">내정보 및 개인형 서비스 이용기록이 모두 삭제되며,
								<em class="emph_g">삭제된 데이터는 복구되지 않습니다.</em><br>
							삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.</span>
							<input type="checkbox" id="cbox2" class="ckboxs">
						  			<label for="cbox2">
						</div>

						<div class="info_user">
							<strong class="tit_agree">게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
							<span class="txt_agree">삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 
								비공개 처리하거나 삭제하시기 바랍니다.<br>
							탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어,
							<em class="emph_g">게시글을 임의로 삭제해드릴 수 없습니다.</em></span>
							<input type="checkbox" id="cbox3" class="ckboxs">
						  			<label for="cbox3">
						</div>


					</div>
					

					<div class="usercheck">
							<h1>회원정보 확인</h1>
							<h1>회원님의 정보보호를 위해 현재 <em class="header_logo">비밀번호</em>를 확인해주세요.</h1>
						</div>
						
					
						<div class="id_section">
							<div class="id_box">
								<div class="id_input">andy0589@naver.com</div>
							</div>

							<div class="pw_box">
								<fieldset class="pw_input_group">
									<div class="wrapper">
										<div>
											<input id="upw" placeholder="비밀번호">
										</div>
									</div>
								</fieldset>
							</div>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>
					</form>



						<span class="join_err_msg">필수 정보입니다.</span>
						<div class="btn_double_area">
							<button class="btn_type btn_default">취소</button>
							<button class="btn_type btn_agree">확인</button>
						</div>
					</div>



				
			
			
		
		


	<footer></footer>



		
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/vallydation.js"></script>
<script type="text/javascript">
$(function(){
	var checkArr = new Array(2).fill(false);
	
	$('#upw').keyup(function(){
		var pw = $(this).val();
		// console.log(pw);
		// return 4개중에 1개
		var result = joinValidate.checkNowpw(pw);
		console.log(result.code +","+result.desc)
		
		if(result.code == 100) {
			color = '#3885CA';
			checkArr[0] = true;
		} else {
			color = '#d95339';
		}
		$('.join_err_msg:eq(0)').css('visibility', 'visible')
								.text(result.desc)
								.css('color', color);
	});
	
	$('.ckboxs').click(function(){
		var ckLen = $('.ckboxs:checkbox:checked').length;
		if(ckLen == 3) {
			checkArr[1] = true;
			$('.join_err_msg:eq(1)').css('visibility', 'hidden');
		} else {
			checkArr[1] = false;
		}
		ckColorBtn();
	});
	
	function ckColorBtn() {
		var checkAll = true;
		
		for(var i = 0; i < checkArr.length; i++) {
			if(!checkArr[i]) {
				checkAll = false;
			}
		}
		if(checkAll) {
			$('.btn_agree').addClass('btn-primary');
			$('.btn_agree').css('cursor', 'pointer');
		} else {
			$('.btn_agree').addClass('btn-primary');
			$('.btn_agree').css('cursor', 'pointer');
		}
		
	}
	
	$('.btn_agree').click(function(){
		var checkAll = true;
		for(var i=0; i < checkArr.length; i++){
			if(checkArr[i] == false) {
				$('.join_err_msg:eq('+i+')').css('visibility', 'visible');
				checkAll = false;
			}
		}
		
		if(checkAll) {
			$('.modal_wrap').css('display', 'flex');
		} else {
			return false;
		}
	});
	$('.modal_okay').click(function(){
		location.href='${path}/member/dropAction';		
	});
	
	
});	
	
	







/* 	$(document).on('click', '.btn_agree', function(){
	$('.modal_wrap').css('display', 'flex');
});

	

	$(document).on('click', '.cancel', function(){
	$('.modal_wrap').css('display', 'none');
	
	

}); */
</script>
</html>