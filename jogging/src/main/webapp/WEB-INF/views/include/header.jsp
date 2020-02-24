<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>

 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - JOGGING - </title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<script src="https://kit.fontawesome.com/2518bc55d6.js" crossorigin="anonymous"></script>
	<style type="text/css">
		body{
			background-color: white;
		}
		div.header_wrap{
			position: fixed;
			top: 0;
			z-index:100;
			width: 100%;
			background-color: white;
			box-shadow: 0 0 1px 1px rgba(20, 23, 28, .1), 0 3px 1px 0 rgba(20, 23, 28, .1);
			margin: 0;
			padding: 0;
		}
		div.header_content{
			width: 1400px;
			margin: 0 auto;
			height: 65px;
			box-sizing: border-box;
			/* border-left: 1px solid red;
			border-right: 1px solid red; */
			display: flex;
			justify-content: space-between;
			
			align-items: center;
		}
		.header_content_logo{

		}
		.header_content_search {}
		.header_content_search_group{
			display: flex;
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
		}
		.header_content_search_input{
			background-color: transparent;
			font-size: 13px;
			border-color: transparent;
			width: 220px;
			height: 44px;
			border-radius: 2px;
			padding: 10px 12px;
			outline: none; /* input 태그 Focus시 파랑테두리 */
		}
		.header_content_search_btn{
			background-color: transparent;
			border-color: transparent;
			width: 44px;
			height: 44px;
			cursor: pointer;
			color: red;
			border-top-right-radius: 2px;
			border-bottom-right-radius: 2px;
		}
		.header_content_search_btn:hover{
			background-color: #56565A;
			color: yellow;
		}
		.header_content_nav{
			display: flex;
			align-items: center;
			justify-content: space-between;
			width: 350px; /* new men women 사이즈 */
		}
		.header_content_nav > div {
			/* border: 1px solid red; */
			padding: 10px 0;
		}
		.header_content_member{
			/* width: 160px; */
			display: flex;
			align-items: center;
			justify-content: space-between;
			flex-direction: row; /* default(생략가능) */
		}
		.header_content_member > div {
			padding: 10px 0px 10px 3px;
		}
		.header_content_dropdown_group {
			position: relative;
		}
		.header_content_dropdown_wrap:hover .header_dropdown {
			display: block;
		}
		.header_content_dropdown_group > a {
			display: inline-block;
			padding: 12px 15px;
			font-weight: 400;
			border: 1px solid transparent;
			border-radius: 2px;
			height: 45px;
			color: #506763;
			line-height: 19px;
		}

		.header_content_dropdown_wrap:hover > div > a,
		.header_content_member_cart:hover > a{
			background-color: rgba(20, 23, 28, .05);
			border-color: rgba(20, 23, 28, .05);
		}
		.header_content_member_cart > a {
			display: inline-block;
			width: 45px;
			height: 45px;
			border-radius: 50%;
			color: #506763;
			border: 1px solid transparent;
			text-align: center;
			padding: 12px;
			line-height: 19px;
		}
		.header_content_logo_img{
			max-width: 145px;
			vertical-align: middle;
		}
		.header_content_logo_text{
			font-size: 10px;
			font-weight: bold;
			vertical-align: middle;
			font-family: 'Acme', sans-serif;
		}
		.header_dropdown_menu{
			border-bottom-left-radius: 2px;
			border-bottom-right-radius: 2px;
			box-shadow: 0 4px 16px rgba(20, 23, 28, .25);
			background-color: white;
			padding: 10px 0;
			
		}
		.header_dropdown_menu a{
			width: 120px;
			display: inline-block;
			font-size: 15px;
			color: #505763;
			text-align: center;
			padding: 5px 15px;
			font-weight: 400;
			position: relative;
			z-index: 100;
		}
		.header_dropdown_menu a:hover{
			color: #007791;
			background-color: #f2f3f5;
		}
		.header_dropdown{
			position: absolute;
			top: 53px;
			left: 0;
			display: none;
		}
		.arrow{
			position: absolute;
			top: -7px;
			left: 3px;
			width: 15px;
			height: 15px;
			transform: rotate(45deg);
			background-color: white;
			border-color: transparent transparent #fff transparent;
			z-index: 99;
		}

		

		/* 모달 로그인 창 */
		.modal_wrap{
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: none;
			justify-content: center;
			align-items: center;
			/* display: none; */
		}
		.modal_content{
			position: relative;
			width: 440px;
			height: 580px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0, 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			overflow: hidden;

		}
		.title .jogging_logo{
			display: block;
			width: 330px;
			height: 110px;
			background: url('${path}/resources/img/jogging.png') 0 -20px;
			margin: 5px;
		}
		/* 모달끝 */

div#content_layout{
			width: 350px;
			margin: 0px auto;

		}
		header{
			padding: 5px;
			margin: 0px;

		}
		div#header{
			display: block;
			width: 330px;
			height: 100px;
			background: url('${path}/resources/img/jogging.png') 0 -20px;
			margin: auto;
			
		}
		div#header_div{
			width: 240px;
			margin: 60px auto;
		}
		div.div_input{
			background-color: white;
			border: 1px solid #e7e7e7;
			width: 350px;
			height: 50px;
			margin-bottom: 10px;
			padding: 13px 35px 10px 15px;
			position: relative;
		}
		span.input_box{
			display: inline-block;
			overflow: hidden; /*사이즈를 정해놓고 그 이상 넘어버리면 숨기는것*/
		}
		input.input_login{
			display: block;
			border-width: 0px;
			width: 280px;
			font-weight: 15px;
			margin: 0px;
			padding: 5px;
		}
		button.btn_login{
			display: block;/*사이즈 줄수있는데 가로 다 내꺼*/
			background-color: black;
			color: white;
			font-size: 15px;
			font-weight: 500;
			width: 100%;
			height: 50px;
			text-align: center;/*글자 가운데 정렬*/
			padding-top: 0px;/*안쪽여백 윗쪽*/
			line-height: 50px;/*글자가 가운데 정렬된다.//heigt랑 같은값을 주면됨 (패딩 탑2 가 있어서 2를 더해서 준다.)*/
			text-decoration: none;
			margin: 15px 0px 15px 0px;/*시계방향으로 상우하좌*/
		}
		table{
			width: 100%;
		}
		#state{
			font-size: 13px;
			position: relative;
			align-items: left;
		}
		td{
			height: 26px;
		}
		#state > label{
			background:url('${path}/resources/img/check_off.gif') no-repeat;
			display: block;
			height: 26px;
			line-height: 26px;
			padding-left: 30px;

		}
		#state > input{
			/*visibility: hidden;*/

			position: absolute;
			left: -85px;
			width: 200px;
			height: 22px;
			margin-top: 3px;
		}

		#state > input:checked + label{
			background-image: url('${path}/resources/img/check_on.gif');
		}

		#secure{
			text-align: right;
			font-size: 12px;
		}

		#ip_ud{
			color: #747474;
		}
		/*#ip_ud:hover{
			text-decoration: none;
		}*/
		#off{
			display: inline-block;
			font-weight: bold;
			width: 22px;
			text-align: left;
			color: #747474;
			cursor:pointer;
		}
		.si{
			color: #d5d5d5;
		}
		#login_ud > a{
			text-decoration: underline;
			color: #747474;
		}
		#secure img{
			/*수직정렬
			: display가 inline 또는 inline-block일 때만 사용 가능
			: baseline, sub, super, middle, top, bottom 등*/
			vertical-align: bottom;

		}
		hr{
			width: 100%;
			margin: 10px auto;
			border: thin solid #eaeaea;
		}
		div#member{
			color: #8c8c8c;
			font-size: 12px;
			text-align: center;
		}
		
		
		img#naver_img{
			width: 460px;
			display: block;
			margin: 47px 0px 15px 0px;
		}
		#footer{
			padding: 15px 0;/*상하 (두개일떄는)*/
		}
		#footer > ul{ 
			margin: 0 auto 9px;
			text-align: center;

		}
		#footer * {
			font-size: 11px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer > ul > li{
			display: inline;/*인라인:사이즈 조절은 안하는데 내 옆으로 다 붙어라*/
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li a:hover{
			color: #1fbc02;
			text-decoration: underline;
		}
		#footer ul li:first-child{/* first-child: 첫번째 자식만*/
			border-left: 0px!important;/* ! 느낌표 찍으면 가장 높은 레벨이니까 이놈만 먹음*/
		}
		#addr_logo{
			width: 63px;
			height: 11px;
		}
		#address{
			margin:0 auto;
			text-align: center;
		}
		#address * {
			font: 9px verdana;
		}
		#address a{
			font-weight: bold;
		}
		#address a: hover{
			color: #1fbc02;
		}
		.title h1{
			display: block;
			clear: both;
			margin: 0 0 10px;
			font-size: 35px;
			text-align: center;
			font-weight: 400;
			color: #333;
			letter-spacing: -0.03em;
		}
		.title span{
			display: block;
			clear: both;
			margin: 0 0 30px;
			text-align: center;
			font-size: 12px;
			font-weight: 400;
			color: #999;
			letter-spacing: -0.03em;
		}
		a#btnface{
			display: block;
			background: #536FC4;
			color: white;
			font-size:15px;
			width: 100%;
			height: 50px;
			text-align: center;
			padding-top: 0px;
			line-height: 50px;
			text-decoration: none;
			margin: 20px 0px 0px 0px;
		}
		a#btnkaka{
			display: block;
			background: #fae100;
			color: black;
			font-size: 15px;
			width: 100%;
			height: 50px;
			text-align: center;
			padding-top: 0px;
			line-height: 50px;
			text-decoration: none;
			margin: 10px 0px 5px 0px;
		}
		.login_close{
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.login_close > button {
			color: rgb(142, 142, 142);
			border: none;
			background: white;
			font-size: 30px;
			cursor: pointer;
			outline: none;
		}
		.login_close > button:hover{
			color: #eba444;
		}
		.pw_eye{
			position: absolute;
			color: #aaa;
			font-size: 17px;
			top: 0px;
			right: 7px;
			cursor: pointer;
			height: 45px;
			line-height: 45px;
			width: 30px;
			text-align: center;
		}
		
		
	</style>
		

</head>
<body>
	<div class="modal_wrap">
		<div class="modal_content">
			<div class="login_close">
				<button><i class="fas fa-times"></i></button>
			</div>
			<div id="content_layout">


			<header>
				<div class="title">
				 <h1 class="jogging_logo"><a href="#" class="n_logo"></a></h1>
				
				</div>
			</header>
				<section>

				<form class=frm_login>
				<div class="div_input" id="naver_id">
					<span class="input_box">
						<input type="email" placeholder="아이디" required id="login_id" class="input_login" >
					</span>

				</div>
				<div class="div_input" id="naver_pw">
					<span class="input_box">
						<input type="password" placeholder="비밀번호" required minlength="6" maxlength="18" 
						id="login_pw" class="input_login" >
						<span class="pw_eye"><i class="fas fa-eye-slash"></i></span>
					</span>
					
				</div>
				

				<div>
					<button type="submit" class="btn_login">로그인</button>
				</div>

				</form>

				<div>
					<table>
						<tr>
							<td id="state">
								<input type="checkbox" id="loginck">
								<label for="loginck" class="label1">
									&nbsp로그인상태유지
								</label>
							</td>
							<td id="secure">
								<span id="ip_ud"><a href="#">IP보안</a></span>
								<span id="off">OFF</span>&nbsp;<!--여백줄때 사용-->
								<span class="si">|</span>&nbsp;
								<span id="login_ud"><a href="#">일회용 로그인</a></span>&nbsp;
								<!-- <img src="../Img/NAVER/help.png"> -->
							</td>
						</tr>
					</table>
				</div>
				<div><hr></div>
				<div id="member">
					<a href="#">아이디 찾기</a>&nbsp;<span class="si"> | </span>&nbsp;
					<a href="#">비밀번호 찾기</a>&nbsp;<span class="si"> | </span>&nbsp;
					<a href="#">회원가입</a>
					
				</div>
			</section>
			<aside>
				<div class="snsArea">
					<a id="btnface" href="#"><i class="fab fa-facebook-square"></i>
					페이스북 로그인</a>
					<a id="btnkaka" href="#"><i class="fas fa-comment"></i>

	
					카카오톡 로그인</a>			
			</div>
		</aside>
		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
			
				<div id="address">
					<span>
					<!-- 	<a href="httms://www.naver.com">
						<img id="addr_logo" src="../Img/NAVER/naver_logo.png"> -->
						</a>
					</span>
					<!-- <span>Copyright</span>
					<span>@</span>
					<span><strong><a href="#">NAVER Corp.</a></strong></span>
					<span>All Rights Reserved.</span>
				 -->
				</div>

			</div>
		</footer>
		
	</div>

			
	    </div>
	</div>












	<header>
		<div class="header_wrap">
			<div class="header_content">
				<div class="header_content_logo">
					<img class="header_content_logo_img" src="${path}/resources/img/jogging.png" alt="로고이미지" >
					<span class="header_content_logo_text">JOGGING</span>
				</div>
				
				<div class="header_content_nav">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">NEW</a>
								<div class="header_dropdown">
								<div class="arrow"></div>
									<ul class="header_dropdown_menu">
									<li><a href="#">OUTER</a></li>
									<li><a href="#">TOP</a></li>
									<li><a href="#">BOTTOM</a></li>
									<li><a href="#">SHOES</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">MEN</a>
								<div class="header_dropdown">
								<div class="arrow"></div>
									<ul class="header_dropdown_menu">
									<li><a href="#">OUTER</a></li>
									<li><a href="#">TOP</a></li>
									<li><a href="#">BOTTOM</a></li>
									<li><a href="#">SHOES</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">WOMEN</a>
								<div class="header_dropdown">
								<div class="arrow"></div>
									<ul class="header_dropdown_menu">
									<li><a href="#">OUTER</a></li>
									<li><a href="#">TOP</a></li>
									<li><a href="#">BOTTOM</a></li>
									<li><a href="#">SHOES</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">KIDS</a>
								<div class="header_dropdown">
								<div class="arrow"></div>
									<ul class="header_dropdown_menu">
									<li><a href="#">OUTER</a></li>
									<li><a href="#">TOP</a></li>
									<li><a href="#">BOTTOM</a></li>
									<li><a href="#">SHOES</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">ETC</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
									<ul class="header_dropdown_menu">
									<li><a href="#">모자</a></li>
									<li><a href="#">장갑</a></li>
									<li><a href="#">양말</a></li>
									<li><a href="#">악세사리</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="header_content_search">
					<form name="" action="" method="GET">
						 <div class="header_content_search_group">
						 	<input type="text" placeholder="상품 검색" name="keyword" class="header_content_search_input"> 
							<button type="button" class="header_content_search_btn">
								<i class="fas fa-search"></i></button>
						 </div>
					</form>
				</div>
				<div class="header_content_member">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#">마이페이지</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
								<li><a href="#">구매내역</a></li>
								<li><a href="#">회원정보관리</a></li>
								<li><a href="#">위시리스트</a></li>
								<li><a href="#">고객센터</a></li>
							</ul>
							</div>
						</div>
					</div>
					<div>
						<div class="header_content_member_cart">
							<a href="#"><i class="fas fa-shopping-cart"></i></a></div>
					</div>
					<div><button type="button" class="btn btn-basic login_open">로그인</button></div>
					<div><button type="button" id="header_btn_join" class="btn btn-primary">회원가입</button></div>
				</div>
			</div>
		</div>
	</header>
</body>

<script type="text/javascript">
	// jQuery 문법
	// $('선택자').옵션();
	// $('#test').css('color','green');
	// $ = jQuery
	// ('#test') = 선택자(id가 test)
	// .css() = 옵션 (글자색을 녹색)

	// jQeury 이벤트 문법(클릭, 포커스, 블러 등)
	// $(document).on('이벤트', '선택자', function()
	// 		이벤트 발생시 동작할 내용들..
	// });
	// $(document).on('click', '#test', function()
	// 		$(this).css('color', 'blue');
	// });
	// $(document).on() = 문서 전체에서 ~
	// ('click')		= 클릭 이벤트가 발생하면
	// ('#test')		= 아이디가 test인
	// function(){}		= 익명함수(이름이 없는 함수)
	// $(this)			= 나 자신 (여기서는 #test)
	// 해석 : 문서전체에서 id가 test인 태그가 클릭되면
	//		나를(#test) 글자색을 blue로 변경해라!

	// 로그인 input(id, pw)에 focus 되면 테두리색 변경
	 $(document).on('focus', '.login_check', function(){
	 	$(this).css('border', '1px solid #3885CA');
	 });
	 $(document).on('focus', '.login_check', function(){
	 	$(this).css('border', '1px solid #3885CA');
	 });


	// login 버튼 클릭 시 modal창 open
	$(document).on('click', '.login_open', function(){
		$('.modal_wrap').css('display', 'flex');
		

	});
	// Modal 창의 X 버튼을 클릭하면 Modal창 Close
		$(document).on('click', '.login_close', function(){
		$('.modal_wrap').css('display', 'none');
		// $('.div_input').val('');
		$('.frm_login')[0].reset();
		$('.pw_eye').prev().attr('type', 'password');
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
				   .css('color', '#aaa');

	});

	// 값을 가져오는 방법
		// <span class="aaa" > 동토리 </span>
		// <input type="text" class="dobby">동비</input>
		//
		// input 태그 값 가져오는 방법
		// : 서버단으로 값을 보낼 때 사용하는 태그들이 대부분
		// $('.dobby').val();
		// input태그 값 넣는 방법
		// $('.dobby').val('메롱');

		// input 태그 이외의 값 가져오는 방법
		// $('.aaa').text();
		// input 태그 이외의 값 넣는 방법
		// $('.aaa').text('뭐시여?');

		// 태그의 옵션 (attribute)을 가져오고 싶을 때
		// $('.dobby').attr('type');
		// $('.dobby').attr('class');




	// LOGIN Modal 창 암호 보이기 or 숨기기
	$(document).on('click','.pw_eye', function(){
		var code = $(this).prev().attr('type');
		
		if(code == 'password'){
			$(this).prev().attr('type', 'text');
			$(this).html('<i class="fas fa-eye"></i>')
				   .css('color', '#666');
		}else{
			$(this).prev().attr('type', 'password');
			$(this).html('<i class="fas fa-eye-slash"></i>')
				   .css('color', '#aaa');
		}

	});
	
	
	
	// Header 가입하기 버튼 클릭시 동의 페이지 이동 
	$(document).on('click', '#header_btn_join', function() {
		location.href="${path}/member/constract";
	});
	
</script>
</html>