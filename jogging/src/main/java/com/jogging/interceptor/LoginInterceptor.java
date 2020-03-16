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
		
		// Login NO
		if(session.getAttribute("userid") == null) {
			log.info(">>>>> NOLOGIN:(");
			// 이전 페이지 URL을 GET
			String referer = request.getHeader("referer");
			log.info(">>>>> 이전 URL: " + referer);
			
			// URL만 신경, GET or POST 중요하지 않음.
			// 회원수정페이지 : GET:/member/update
			// 회원수정DB : POST:/member/update
			
			// request(GET, POST) > response(forward, sendRedirect)
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			
			
			// URL로 바로 접근한 경우(referer이 없는 경우)
			if(referer == null) {
				referer = "http://localhost:8081/jogging/";
			}
			
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
