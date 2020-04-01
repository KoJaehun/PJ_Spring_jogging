/*
 * Login이 필요한 기능 수행시
 * Session 체크를 하는 Interceptor
 */

package com.jogging.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{@Override
	// URL 전
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// Session 객체 생성
		HttpSession session = request.getSession();
		
		// 이전 페이지 URL을 GET
		String referer = request.getHeader("referer");
		log.info(">>>>> 이전 URL: " + referer);
		
		// Login NO
		if(session.getAttribute("userid") == null) {
			log.info(">>>>> NOLOGIN:(");
			
			//
			String uri = request.getRequestURI();
			log.info(">>>>> 목적지: " + uri);
			
			if(referer == null) {
				
				// URL로 바로 접근한 경우(referer이 없는 경우) 인덱스로 이동
				referer = "http://localhost:8081/jogging/";
				// 외부에서 접속했을때 referer이 null이면 위 url 을 넣어줌 
			} else {
				
				// 내부에서 접속했을때 문제가 생겼을경우 인덱스를 서브스트링하여 목록url로 변경해줌
				
				// 게시글 등록, 수정(로그인이 필요한 View단)
				int index = referer.lastIndexOf("/");
				int len = referer.length();
				log.info(">>>> 인덱스: " + index);
				log.info(">>>> 길이: " + len);
				String mapWord = referer.substring(index, len);
				log.info("수정된 URL: " + mapWord);
				log.info(">>>>> 이전 URL: " + referer);
			
				if(mapWord.equals("/write")) {
				response.sendRedirect(request.getContextPath() + "/board/list");
				return false;
				}
			}
			
			// String referer = request.getHeader("referer");
			
			
			// URL만 신경, GET or POST 중요하지 않음.
			// 회원수정페이지 : GET:/member/update
			// 회원수정DB : POST:/member/update
			
			// request(GET, POST) > response(forward, sendRedirect)
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			fMap.put("uri", uri);
			
			
			// URL로 바로 접근한 경우(referer이 없는 경우) 인덱스로 이동
			
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			return false; // 이동 X
		} else { // Login OK
			log.info(">>>>> LOGIN:)");
			return true; // 이동 O
		}
		
		
	}
	

	// URL 후
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}

	
	
}
