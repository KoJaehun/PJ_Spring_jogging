<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>my page</title>
	<link rel="icon" type="image/png" href="{path}/resources/img/NAVERCloud/naversm.png">
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
			font-weight: bold;
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
			
			margin: 100px auto;
			
		}
		.header{
			padding: 62px 0px 20px;
			position: relative;
			
		}
		.join_content{
			width: 656px;
			padding: 30px;
			margin: 0;
			display: flex;
			justify-content: space-between;
			align-items: center;
			border-bottom: 2px solid #e1e1e1;

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
		
		
		
		.btn_double_area{
			display: flex;
			justify-content: space-between;
			margin: 20px 0 20px;
		}
		.btn_type{
			display: block;
			width: 32.6%;
			padding: 15px;
			font-size: 15px;
			font-weight: 700;
			text-align: center;
			cursor: pointer;
			background-color: black;
			color: #FFFFFF;
			border-radius: 5px;

		
		}
		button.btn-primary{
		border: 1px solid #56565A;
		background-color: black;
		color: white;
		}
		.container_wrap{
			background-color: #FFFFFF;
			padding: 20px;
			border: 1px solid #E1E1E1;
		}
		


	.mypage_title_content{
		display: block;
		width: 70px;
		font-weight: bold;
		font-size: 14px;
		line-height: 2;
		border-bottom: 1px solid #FFFFFF
	}

	.mypage_data_content{
		display: block;
		width: 200px;
		font-size: 14px;
		line-height: 2;
		border-bottom: 1px solid #e7e7e7;
	}
	.mypage_info{
		padding: 5px;
		width: 350px;
		height: 210px;
		display: flex;
		justify-content: flex-start;
	}
	.mypage_mypage{
		font-size: 20px;
		padding: 10px;
		border-bottom: 2px solid #e1e1e1;
	}
	.mypage_line{
		display: block;
		border-bottom: 2px solid #e1e1e1;
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
					<h1 class="mypage_mypage">내 정보</h1>
					<div class="join_content">
						
						<div class="mypage_img">
							<img src="${path}/resources/img/asd2.jpg" style="width: 213px">
						</div>

						<div class="mypage_info">
							<div class="mypage_title">
								<span class="mypage_title_content"> 아이디 </span>
								<span class="mypage_title_content"> 이름 </span>
								<span class="mypage_title_content"> 전화번호 </span>
								<span class="mypage_title_content"> 이메일 </span>
								<span class="mypage_title_content"> 주소 </span>
								<span class="mypage_title_content"> 상세주소 </span>
							</div>
							<div class="mypage_data">
								<span class="mypage_data_content"> qorwlswn2 </span>
								<span class="mypage_data_content"> 백진주 </span>
								<span class="mypage_data_content"> 010-1234-5678 </span>
								<span class="mypage_data_content"> qorwlswn2@jogging.com </span>
								<span class="mypage_data_content"> 00000 </span>
								<span class="mypage_data_content"> 광주광역시 북구 중흥동 </span>
								<span class="mypage_data_content"> 한국경영원 5층 </span>
							</div>
						</div>
					</div>
						
						
						

						<div class="btn_double_area">
							<button type="button" class="btn_type btn_infoup" id="mypage_btn_update">회원정보수정</button>
							<button type="button" class="btn_type btn_pwup" id="mypage_btn_pwupdate">비밀번호변경</button>
							<button type="button" class="btn_type btn_out" id="mypage_btn_drop">회원탈퇴</button>
						</div>

						<div class="mypage_line">
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</section>


</body>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/vallydation.js"></script>

<script type="text/javascript">

	$(document).on('click', '#mypage_btn_update', function() {
		location.href="${path}/member/update";
	});
	$(document).on('click', '#mypage_btn_pwupdate', function() {
		location.href="${path}/member/pwupdate";
	});
	$(document).on('click', '#mypage_btn_drop', function() {
		location.href="${path}/member/drop";
	});
</script>

</html>