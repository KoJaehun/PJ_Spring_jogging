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
		<div class="reply_box">
			<div class="reply_new_user">
				<span>REPLY WRITE</span>
			</div>
			<div class="reply_input_box">
				<textarea id="reply"></textarea>
				<div class="reply_button">
					<a href="#"><div class="insert_btn black">등록</div></a>
				</div>
			</div>
		</div>

		<!-- 댓글 목록 창 -->
		<c:forEach items="${list}" var="reply">
			<div class="reply_box">
				<div class="reply_user">
					<span>REPLY LIST 댓글 (${list.size()})</span>
				</div>
			
			
				<div class="reply_content">
					<div class="reply_writer"><span>${reply.writer}</span><span>작성시간</span></div>
					<div class="reply_txt"><span>${reply.content}</span></div>
					<div class="reply_update">
						<a href="#"><div class="reply_update_update">수정</div></a>
						<a href="#"><div class="reply_update_delete">삭제</div></a>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
</body>
</html>