<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>게시판</title>
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
		font-family: Verdana, sans-serif;
		font-size: 14px;
		color: #2F3138;
		margin: 0;
		padding: 0;
		text-algin: center;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
		color: inherit;
	}
	.wrap{
		width: 1000px;
		margin: 100px auto;
	}
	.board_main{
		margin: 20px;
		display: block;
		text-align: center;
		font-size: 27px;
		font-weight: bold;
	}
	
	
	/* 게시판 상단 네비, 검색*/
	.board_title{
		display: flex;
		justify-content: space-between;
		border: 1px solid #e9e9e9;
		
	}
	.board_nav{
		padding-top: 13px;
		padding-right: 16px;
		padding-left: 16px;
		background-color: #FFFFFF;
		color: #333;
		font-weight: bold;
		font-size: 14px;
		
	}
	.board_nav span{
		
	}
	.nav_btn{
		display: inline-block;
		padding: 0px 10px;
		line-height: 19px;
	}
	.board_content_search_group{
		display: flex;
		align-items: center;
		background-color: #f2f3f5;
		border-radius: 2px;
	}
	.board_content_search_input{
		background-color: transparent;
		font-size: 13px;
		border-color: transparent;
		width: 220px;
		height: 44px;
		border-radius: 2px;
		padding: 10px 12px;
		outline: none; /* input 태그 Focus시 파랑테두리 */
	}
	.board_content_search_btn{
		background-color: black;
		border-color: transparent;
		width: 44px;
		height: 44px;
		cursor: pointer;
		color: #F5F5F5;
		border-top-right-radius: 2px;
		border-bottom-right-radius: 2px;
		border: 1px solid black;
	}
	.board_content_search_btn:hover{
		background-color: red;
		color: white;
		border: 1px solid red;
	}
	
	/* 테이블 상단 네비, 검색 끝 */

	/* 검색결과 표시 */
	.search_result{
		display: flex;
		justify-content: center;
		width: 100%;
		height: 20px;
		line-height: 19px;
		background-color: #FFFFFF;
		color: #333;
		font-weight: bold;
		font-size: 14px;
		text-align: center;
	}
	.search_result span{
		display: block;
	}
	.result_red{
		color:red;
	}
	
	.clear_button{
		padding: 0 5px;
		margin-left: 10px;
		border: 1px solid #333;
		text-align: center;
		
	}
	

	/* 테이블 */
	table{
		width: 100%;
		border: 0;
		border-spacing: 0;
		border-collapse: collapse;
		text-align: center;
		font-weight: bold;
		font-size: 14px;
	}
	.table_body td:nth-child(2){
		
		text-align: left;
		padding-left: 10px;
	}
	.table_head th:nth-child(2){
		
		text-align: left;
		padding-left: 10px;
	}
	.board_content{
		text-align: center;
		font-size: 13px;
	}
	.board_content table{
		position: relative;
		margin: 10px 0 0;
		line-height: 1.5;

	}
	.board_content table th{
		padding: 10px 0 10px;
		color: #444;
		vertical-align: middle;
		font-weight: bold;
		background: #fbfbfb;
		letter-spacing: 0.025em;
	}
	.board_content th{
		word-break: break-all;
		word-wrap: break-word;
		border-top: 1px solid #e8e8e8;
		border-bottom: 1px solid #e8e8e8;
		border-left: 1px solid #FFFFFF;
		border-right: 1px solid #FFFFFF;

	}
	.board_content tr{
		display: table-row;
		background-color: #FFFFFF;
		color: #55555;
	}
	.board_content td{
		padding: 10px 0 10px;
		border-top: 1px solid #e8e8e8;
		border-bottom: 1px solid #e8e8e8;
		border-left: 1px solid #FFFFFF;
		border-right: 1px solid #FFFFFF;
	}
	.body_txtleft{
		text-decoration: none;
		padding-left: 10px;
	}
	/*  테이블 끝 */
	
	.board_page_write{
		margin-top: 10px;
		display: flex;
		justify-content: space-between;
		font-weight: bold;
		font-size: 14px;
		
	}
	/* 글쓰기 */
	.board_txt{
		float: right;
		color: white;
		padding: 10px;
		background-color: black;
		border: 1px solid black;
		cursor: pointer;
	}
	.board_txt:hover{
		background-color: red;
		border: 1px solid red;
		color: white;
		
	}
	/* 
	.board_txt a{
		background-color: black;
		padding: 10px;
	}
	.board_txt a:lastchild{
	}

	*/

	/* 페이지네이션 */
	
	.board_page{
		margin: 0 auto;
		text-align: center;
		/* border: 1px solid red; */
		padding-top: 7px;
		
	}
	.board_page ul li{
		list-style: none;
		display: inline-block;
		/* outline: 1px dotted red; */
		margin: 0 10px;
		font-size: 14px;
	}
	#check_color{
		color: red;
	}
	
	/* 페이지네이션 끝 */
	
	.block_line{
		margin-top: 10px;
		margin-bottom: 10px;
		display: block;
		border-top: 1px solid #e8e8e8;
	}
	
	/* 좋아요 애니메이션 */
	
	
	.new_animation{
		font-size: 13px;
		color: red;
		font-weight: bold;
		
		/* 설정할 애니메이션 이름 */
		animation-name: twinkle;
		/* 애니메이션 반복 횟수 */
		animation-iteration-count: infinite;
		/* 애니메이션 실행 시간 */
		animation-duration: 1.2s;
		
	}
	
	@keyframes twinkle{
		0%		{opacity: 0;}
		100%	{opacity: 1;}

		/* from    {opacity: 0;}
		to      {opacity: 1} */
	}
	 
	
	/* 깜빡깜빡 애니메이션 (new) */
	.twincle_eff{
		animation-name: twinkle;
		animation-duration: 1.2s;
		animation-iteration-count: infinite;
	}
	@keyframes twinkle {
		0%		{opacity: 0;}
		100% 	{opacity: 1;}
	}
	
	.new_color{
		color: tomato;
		margin-left: 7px;
		font-weight: bold;
		font-size: 12px;
	}
	/* 네비 버튼 애니메이션 */
	.cool_link:after{
		content: '';
		display: block;
		width: 0;
		height: 2px;
		background-color: #FFD700;
		transition: width 0.8s;
			
	}
	.cool_link:hover:after{
		width: 100%;
	}
	
	.err_msg_box{
		display: flex;
		justify-content: flex-end;
		visibility: hidden;
	}
	.err_msg_txt{
		font-size: 13px;
		color: red;
		font-weight: bold;
		
	}
	
</style>
</head>

<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div class="wrap">
		<div class="block_line"></div>
		<div class="board_main">게시판</div>
		<div class="block_line"></div>
		<div class="board_title">
			<div class="board_nav">
				<span class="nav_btn cool_link"><a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" id="sort_new">최신순</a></span>
				<span class="nav_btn cool_link"><a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" id="sort_good">추천순</a></span>
				<span class="nav_btn cool_link"><a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" id="sort_reply">댓글순</a></span>
				<span class="nav_btn cool_link"><a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt">조회순</a></span>
			</div>


			<div class="board_content_search">
				<div class="board_content_search_group">
					<form action="${path}/board/list" method="GET">
						<input type="text" placeholder="게시글 검색" name="keyword" class="board_content_search_input"> 
						<button type="button" class="board_content_search_btn"><i class="fas fa-search"></i></button>
					</form>
				</div>
			</div>
		</div>
		<div class="block_line"></div>
		<div class="search_result">
			<c:if test="${!empty map.keyword}">
				<span>"<em class="result_red">${map.keyword}</em> "검색결과 "<em class="result_red">${map.count} </em>"건 검색되었습니다.</span>
				<a href="${path}/board/list"><div class="clear_button">CLEAR</div></a>
			</c:if>
			
		</div>
		
			
		
		
			<div class="board_content">
				<table border="1">
					<thead class="table_head">
						<tr>
							<th style="width:10%" scope="col">번호</th>
							<th scope="col">제목</th>
							<th style="width:10%" scope="col"></th>
							<th style="width:10%" scope="col">작성자</th>
							<th style="width:10%" scope="col">작성일자</th>
							<th style="width:10%" scope="col">조회수</th>
							<th style="width:10%" scope="col">첨부파일</th>
						</tr>
					</thead>
					<!-- 게시글 -->
					<c:forEach items="${map.list}" var="list">
						
						<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
						<tbody class="table_body">
							<tr>
								<td >${list.bno}</td>
								<td class="body_txtleft">
									<a href="${path}/board/view/${list.bno}">
									
									<c:if test="${list.re_level != 0}">
										<c:forEach begin="1" end="${list.re_level}">
											<i class="fas fa-greater-than"></i>
										</c:forEach>
										RE:
									</c:if>
									
									${list.title}</a>
									
									<c:if test="${today == regdate}">
										<span class="new_color twincle_eff">NEW</span>
									</c:if>
								</td>
								<td>
								<a href="#"><i class="far fa-comment"></i></a> ${list.replycnt} 
								<a href="#"><i style="color:red" class="fas fa-heart"></i></a> ${list.goodcnt}
								</td>
								<td>${list.writer}</td>
								<td class="regdate">
								<c:choose>
									<c:when test="${today == regdate}">
										<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>
									</c:otherwise>
								</c:choose>
								</td>
								<td>${list.viewcnt}</td>
								
								<td class="file_box"><i class="far fa-file"></i></td>
								
							</tr>					
						</tbody>
					</c:forEach>
				</table>		
			</div>
			
			<div class="board_page_write">
				<div class="board_page">
					<ul>
					
					<li id="pagination_start">
					<c:if test="${map.pager.curBlock > 1}">
						<li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_left"><i class="fas fa-angle-left"></i></a></li>
						<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=&{map.keyword}" class="">1</a></li>
						<li><span>...</span></li>
					</c:if>
					</li>
					
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num == map.pager.curPage}">
								<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="check_color">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						
					<li id="pagination_end">
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<span>...</span>
							<li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">${map.pager.totPage}</a></li>
							<li><a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_right"><i class="fas fa-angle-right"></i></a></li>
						</c:if>	
					</li>
					
					</ul>
				</div>
				
				<button id="write_btn" class="txt_background board_txt" type="button">글쓰기</button>
				
			</div>

			<div class="block_line"></div>
			<div class="err_msg_box"><span class="err_msg_txt">로그인이 필요한 서비스입니다.</span></div>
	</div>
	






</body>
<script type="text/javascript">
	$(function(){
		var sort_option = '${map.sort_option}';
		
		if(sort_option == 'new'){
			$('#sort_new').css('color', '#FFD700');
		} else if(sort_option == 'good'){
			$('#sort_good').css('color', '#FFD700');
		} else if(sort_option == 'cnt'){
			$('#sort_cnt').css('color', '#FFD700');
		} else if(sort_option == 'reply'){
			$('#sort_reply').css('color', '#FFD700');
		}
		
		
		$(document).on('click', '#write_btn', function(){
			location.href = '${path}/board/write';
		});
		
		if()
		
	});
	
	

</script>

</html>