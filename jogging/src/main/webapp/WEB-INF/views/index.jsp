<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
	<style type="text/css">
		* {
			box-sizing: border-box;
			line-height: normal;
		}
		
		body {
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 14px;
			color: #2F3138;
			margin: 0;
			padding: 0;
		}
		img {
		vertical-align: middle;
		}
		div {
			/* border: 1px solid red; */
			padding: 0;
			margin: 0;
			outline: 0;
			display: block;
		}
		.main_section {
			width: 100%;
			height: 100%;
		}
		.main_collection{
			position: relative;
			margin-left: 100px;
			margin-right: 100px;
		}
		.main_img{
			background-image: url(${path}/resources/img/flims_laax_trailrunning3.jpg);
			display: block;
			width: 100%;
			height: 69vh;
			overflow: hidden;
			position: relative;
			background-position: center;
			background-repeat: no-repeat;
			background-size: cover;
			
		}
		
		.headline_content > p {
			color: #111;
			font-size: 35px;
			font-weight: bold;
			width: 100%;
			text-align: center;
			letter-spacing: -1px;
		}
		.subline_content > p {
			color: #111;
			font-size: 30px;
			font-weight: 500;
			width: 100%;
			text-align: left;
			padding-left: 15px;
			letter-spacing: -1px;
		}
		
		.product_main{
			width: auto;
			margin: 0;
			padding: 0;
			width: 100%;
		}
		
		.product_list{
			display: flex;
			position: relative;
			margin: 0 auto;
		}

		.product_item{
			width: 33.3%;
			overflow: hidden;
		}
		.item_img{
			width: 549px;
			height: 549px;
			margin: 5px;
		}
		
		
		
		.product_font{
			text-align: center;
		}
		.item_name{
			letter-spacing: -1px;
			font-size: 19px;
			font-weight: bold;
			color: #111;
		}
		.item_category{
			letter-spacing: -1px;
			font-size: 16px;
			font-weight: 500;
			color: #8d8d8d;
		}
		.item_price{
			letter-spacing: -1px;
			font-size: 17px;
			font-weight: 500;
			color: #8d8d8d;

		}





		

	</style>	
</head>
<body>
	<%@ include file="include/modal.jsp" %>
	
	<!-- 전체 -->
	<div class="main_section">
		 
		 <!-- 메인 -->
		<div class="main_collection">
			<div class="main_img">
				
			</div>
		
			<!-- 헤드라인 글 -->
			<div class="headline_content">
				<p class="headline_text">조깅과 함께 달리기를 시작해보세요 !</p>		
			</div>
			
			<!-- 서브라인 글 -->
			<div class="subline_content">
					<p class="subline_text">Best Product
					</p>
			</div>
		<!-- 상품박스 -->
			<div class="product_main">
				
					
				<div class="product_box">
					<div class="product_list">
						<c:forEach items="${BestPdt}" var="pdt">
							<div class="product_item">
								<img class="item_img" src="${path}/resources/img/${pdt.p_img}">
								<div class="product_font">
									<h4 class="item_name">${pdt.pname}</h1>
									<p class="item_category">${pdt.ptype}</p>
									<p class="item_price">${pdt.price}</p>
								</div>							
							</div>
						</c:forEach>
					</div>
				</div>
					

			</div>
			<!-- 서브라인 글 -->
			<div class="subline_content">
					<p class="subline_text">New Product
					</p>
			</div>
			<!-- 신상 상품박스 -->
			<div class="product_main">
				
				<div class="product_box">
					<div class="product_list">
						<c:forEach items="${NewPdt}" var="pdt">
							<div class="product_item">
								<img class="item_img" src="${path}/resources/img/${pdt.p_img}">
								<div class="product_font">
									<h4 class="item_name">${pdt.pname}</h1>
									<p class="item_category">${pdt.ptype}</p>
									<p class="item_price">${pdt.price}</p>
								</div>							
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
			<!-- 2번째 상품박스 끝 --> 
		
		</div>
		
				<!-- -->
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">	
</script>
</html>




