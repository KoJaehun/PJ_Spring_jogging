<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
	<a href="${path}/sample/view?user=배뚱&pass=1234">GET</a>
	
	<form action="${path}/sample/view" method="POST">
		<input type="text" name="user">
		<input type="password" name="pass">
		<button type="submit">POST</button>
	</form>
	
	
	<img src="${path}/resources/img/forbes.jpg" style="width: 500px; height: 500px;">
	
	<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
	<button type="button" id="ajax_btn">비동기방식(AJAX)</button>
	
	<br>
	<div><span>동기: ${name}</span></div>
	<div><span>비동기: <span id="ajax_txt"></span></span></div>
	
</body>
<script type="text/javascript">
	
	$('#ajax_btn').on('click', function(){
		// type: GET or POST
		// URL: 서버단 목적지(RequestMapping으로 받는 요청)
		// contentType: 서버단으로 전송하는 데이터의 타입
		// data: 서버로 전송하는 실제 데이터
		// dataType: 서버단에서 View단으로 전송하는 데이터 타입
		// success: AJAX 성공했을 때 작업(DATA: AJAX 서버단 Return값)
		// error: AJAX 실패했을 때 작업
		// Json = {key:value, key:value, key:value}
		
		// data: {name: '뚱깐징어'} 를 주석처리하고 아래 url을 사용해도
		// url: '${path}/sample/ajax?name=뚱깐징어', 가능
		$.ajax({
			type: 'POST',
			url: '${path}/sample/ajax',
			contextType: 'application/json',
			data: {name: '뚱깐징어'},        // JSON
			success: function(data) {
				
				$('#ajax_txt').text(data);
			},
			error: function(){
				alert('System ERROR :( ');
			}
		});
	});
</script>
</html>