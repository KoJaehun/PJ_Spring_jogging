<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입</title>
	<link rel="icon" type="image/png" href="../img/NAVERCloud/naversm.png">
	<script src="https://kit.fontawesome.com/2518bc55d6.js" crossorigin="anonymous"></script>
	<style type="text/css">
		*{
			font-family: 'Nanum Gothic', sans-serif;
			box-sizing: border-box;
		}
		body, h1, h2, h3, h4, h5, h6, u1, p, h3{
			margin: 0;
			padding: 0;
		}
		body{
			background-color: #FFFFFF;
			font-size: 14px;
		}
		ul{
			list-style: none;
		}
		a{
			text-decoration: none;
			color: inherit;
		}
		.wrap{
			width: 700px;
			height: 600px;
			margin: 100 auto;
			
		}
		.header{
			padding: 62px 0px 20px;
			position: relative;
			
		}
		.join_content{
			width: 460px;
			margin: 0 auto;
		}
		.row_group{
			overflow: hidden;
			width: 100%;
		}
		.join_title{
			margin: 19px 0 8px;
			font-size: 14px;
			font-weight: 700;
			color: black;
		}
		.ps_box{
			display: flex;
			align-items: center;
			position: relative;
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			background: #fff;
			vertical-align: top;
		}
		.ps_post{
			display: table-column;
		
		}
		.int_id{
			padding-right: 110px;
		}
		.int_pass{
			padding-right: 40px;
		}
		.int{
			display: block;
			position: relative;
			width: 100%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}
		.step_url{
			position: absolute;
			right: 11px;
			font-size: 15px;
			color: #8e8e8e;
		}
		.join_err_msg{
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
			visibility: hidden;
		}
		.pw_lock{
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
		}
		.repw_lock{
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
			background-position: -27px 0;
		}
		.bir_wrap{
			display: table;
			width: 100%;
		}
		.bir_mm, .bir_dd {
			padding-left: 10px;
		}
		.bir_yy, .bir_mm, .bir_dd{
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.sel{
			background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
			background-size: 20px 8px;
			width: 100%;
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none;
		}
		.choice{
			font-size: 12px;
			font-weight: 400;
			color: #8e8e8e;
		}
		.btn_double_area{
			display: flex;
			justify-content: space-between;
			margin: 20px 0 20px;
		}
		.btn_type{
			display: block;
			width: 225px;
			padding: 15px;
			font-size: 20px;
			font-weight: 700;
			text-align: center;
			cursor: pointer;

		
		}
		button.btn-primary{
		border: 1px solid #56565A;
		background-color: black;
		color: white;
		}
		.btn_cancel{
		    color: black; 
			background: eee;
			border: 1px solid #black
		}
		.btn_agree{
			 color: white;
			background-color: black;
			border: 1px solid black; 
			cursor: no-drop;
		}
		.container_wrap{
			background-color: #FFFFFF;
			padding: 20px;
			border: 2px solid #EEEEEE;
		}
		






		


	</style>
</head>
<body>
	




	<div class="wrap">
	<header><div class="header">
		<h1 class="naver_logo"><a href="#" class="n_logo"></a></h1>
	</div></header>
	<section>
		<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
			<div class="container_wrap">
				<div class="container">
					<div class="join_content">
						<div class="row_group">

							<h1>비밀번호 수정하기</h1>
							
							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd1">현재 비밀번호</label>
								</h3>
								<span class="ps_box int_pass">
									<input type="text" id="nowpw" name="upw" class="int">
									
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>


							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd1">변경할 비밀번호</label>
								</h3>
								<span class="ps_box int_pass">
									<input type="text" id="upw" name="pw" placeholder="비밀번호 입력" class="int">
									<span class="step_url"><span class="pw_lock"></span></span>
								</span>							
							</div>
							

							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd2">비밀번호 재확인</label>
								</h3>
								<span class="ps_box int_pass">
									<input type="text" id="urpw" name="rpw" placeholder="비밀번호 재입력" class="int">
									<span class="step_url"><span class="repw_lock"></span></span>
								</span>
								<span class="join_err_msg">필수 정보입니다.</span>
							</div>
							


						</div>
						
						
						

						<div class="btn_double_area">
							<button type="button" class="btn_type btn_cancel">취소</button>
							<button type="button" class="btn_type btn_agree" id="btn_join">수정</button>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</section>

	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/vallydation.js"></script>

<script type="text/javascript">

	
	// $(document).ready(function(){
	// }); 
	
	$(function(){
		var pwFlag = false;
		var checkArr = new Array(2).fill(false);
		
		$('#nowpw').keyup(function(){
			var nowpw = $(this).val();
			
			// console.log('입력:'+nowpw);
			var result = joinValidate.checkNowpw(nowpw);
			console.log("code: "+result.code);
			ckDesign(result.code, result.desc, 0, 0);
			
			if(result.code == 100){
				checkArr[0] = true;
			} else {
				checkArr[0] = false;
			}
			
		});
		
		$('#upw').keyup(function(){
	
			var nowpw = $.trim($('#nowpw').val());
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
			
			// 2. 유효성 체크하기
			var result = joinValidate.checkPw(nowpw,pw,rpw);
			if(result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}
			// 3. 체크 결과에 따라 디자인하기
			ckDesign(result.code, result.desc, 1, 1);
			
			
		});
		
		// 비밀번호 재확인 유효성체크
		$('#urpw').keyup(function(){

			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());

			var result = joinValidate.checkRpw(pw,rpw, pwFlag);
			if(result.code == 10) {
				checkArr[1] = true;
				$('.ps_box:eq(2)').css('border', '2px solid #3885CA');
			} else if(result.code == 6) {
				checkArr[1] = false;
				$('.ps_box:eq(2)').css('border', '2px solid #3885CA');
			} else {
				checkArr[1] = false;
			}
			ckDesign(result.code, result.desc, 2, 2);

		});
		$('.int').keyup(function(){
			printCheckArr(checkArr);
			ckColorBtn();
		});
		
		function ckColorBtn(){
			var checkAll = true;				
			for(var i = 0; i < checkArr.length ; i++){
				if(!checkArr[i]) {
					checkAll = false;
				}
			}
			if(checkAll) {
				$('#btn_join').addClass('btn-primary');
				// $('btn_join').prop('disabled', false);
				$('#btn_join').css('cursor', 'pointer');
			} else {
				$('#btn_join').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', true);
				$('btn_join').css('cursor, no-drop');
			}	
		}
		
		$('#btn_join').click(function(){
			var invalidAll = true;
			for(var i = 0; i < checkArr.length; i++){
				if(!checkArr[i]){
					invalidAll = false;
					$('.join_err_msg:eq('+i+')').css('visibility', 'visible')
												.css('color', '#d95339');
				}
			}
			if(invalidAll){
				$('#frm_member').submit();
			} else {
				alert('유효성체크를 진행해주세요!');
			}
		});
	});		
	
	
	
	

	
	
	function ckDesign(code, desc, line, msg) {
		if(code == 0 || code == 10 || code == 100) {						// 통과 O
			$('.ps_box:eq('+line+')').css('border', '2px solid #3885CA');
			$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')
								   .text(desc)
								   .css('color', '#3885CA');
			return false;

		} else {															// 통과 X
			$('.ps_box:eq('+line+')').css('border', '2px solid #d95339');
			$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')
								   .text(desc)
								   .css('color', '#d95339');
			return true;
		}
	}
	
	
    // 개발시 사용 : 유효성체크 전체여부를 출력해주는 함수(true, false)
    function printCheckArr(checkArr) {
    	for(var i=0; i < checkArr.length; i++) {
    		console.log(i + '번지: ' + checkArr[i]);
    	}
    }


</script>
</html>