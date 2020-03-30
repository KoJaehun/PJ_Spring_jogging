<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="listReply">
		<c:choose>
			<c:when test="${empty userid}">	
				<div class="reply_box">
					<div class="reply_new_user">
						<span>REPLY WRITE</span>
					</div>
					<div class="reply_input_box">
						<div class="reply_content">
							<span><a id="login_txt" href="#">로그인</a>을 하셔야만 댓글을 등록하실 수 있습니다.</span>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<form class="frm_reply">
					<input type="hidden" name="bno" class="reply_bno">
					<input type="hidden" name="type" class="reply_type">
					<input type="hidden" name="writer" class="reply_writer">
					<div class="reply_box">
						<div class="reply_new_user">
							<span>REPLY WRITE</span>
						</div>
						<div class="reply_input_box">
							<textarea id="reply" name="content"></textarea>
							<div class="reply_button">
								<div class="reply_err_box">
									<div class="flex_box">
									<div id="reply_btn" class="aaaa"><button class="insert_btn black" type="button">등록</button></div>
									<div class="err_msg">댓글을 입력하세요</div>
									</div>
									<div>
									<button class="update_reply_check" type="button"><i class="fas fa-wrench"></i>새로운 댓글을 확인하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</c:otherwise>
					
		</c:choose>

			
			<c:if test="${list.size()!=0}">
				
					<div class="reply_user">
						<input type="hidden" class="replyListCnt" value="${list.size()}">
						<span class="left_margin"> REPLY LIST 댓글 ${list.size()} </span>
					</div>
				
			</c:if>
			
		<c:forEach items="${list}" var="reply">
		<div class="reply_box">
				<div class="reply_content">
					<div class="reply_writer">
						<span>${reply.writer}</span>
						<span>rno ${reply.rno}</span>
						<span>
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</span>
					</div>
					<div class="reply_txt"><span>${reply.content}</span></div>
					
					<c:if test="${name == reply.writer}">
					
					<div class="reply_update">
						<button type="button" class="reply_update_box1 " data_num="${reply.rno}">수정</button>
						<button type="button" class="reply_update_box" data_num="${reply.rno}">삭제</button>
						<span style="display:none">${reply.rno}</span>
						<input type ="hidden" value="${reply.rno}">
					</div>
					
					</c:if>
				</div>
					
			</div>
		</c:forEach>
			
		
		<c:if test="${list.size() == 0}">
		
			<div class="reply_box">
				
			
			
				<div class="reply_content">
					<div class="reply_writer"><span>관리자</span><span>${now}</span></div>
					<div class="reply_txt"><span>등록된 댓글이 없습니다. 댓글을 등록해주세요.</span></div>
				</div>
			</div>
		</c:if>
			

		
	</div>
</body>
<script type="text/javascript">
	// 비로그인 댓글창에 로그인버튼 클릭시 로그인모달 띄우기 
	$(function(){
		$('#login_txt').click(function(){
			$('.modal_wrap').css('display','flex');
		});
	});
	
	
	/*
	// rno 값 받아오기
	$(function(){
		$('.reply_delete_btn').click(function(){
		alert($(this).next().text());
		alert($(this).next().next().val());				
		});
	});
	*/

	
</script>
</html>