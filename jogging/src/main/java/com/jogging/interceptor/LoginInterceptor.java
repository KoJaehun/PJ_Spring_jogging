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
		// 이동하기 전 있었던 Page URL
		String referer = request.getHeader("referer");
		log.info(">>>> referer : " + referer);
		
		String qString = request.getQueryString();
		log.info(">>>> queryString: " + qString);
		
		// 이동하려고 했던 목적지 Page URL
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String nextUrl = uri.substring(ctx.length());
		String prevUrl = "";
		String finalUrl = "http://localhost:8081/jogging/";
		
		// session [ ] 
		// referer [ http://localhost:8081/metop/board/list ]
		// uri [ /jogging/board/write ]
		// ctx [ /jogging ]
		// nextUrl = [ /board/write ]
		// prevUrl = [ ]
		// finalUrl = [ http://localhost:8081/jogging/ ]
		
		// 비정상적인 접근을 막는 기능!
		if(referer == null) {
			log.info("WARING >>> 비정상적인 접근 :( ");
			
			// 세션을 받기도전에 비정상적인 접근이면 finalUrl로 보내버림.
			response.sendRedirect(finalUrl);
			return false;	
		} else {
			// referer에서 ?를 찾아 그 주소를 indexQuery에 담는다
			// referer에 ?가 없다면 indexQuery 에 -1이 담긴다.
			int indexQuery = referer.indexOf("?");
			//  
			if(indexQuery == -1) {
				prevUrl = referer.substring(finalUrl.length()-1);
			} else {
				prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
			}
			log.info("PREV URL >>>> " + prevUrl );
			log.info("NEXT URL >>>> " + nextUrl );
			
			if(nextUrl.equals("/board/update") || nextUrl.equals("/board")) {
				log.info("sadsasa: " + prevUrl.indexOf("board/view"));
				if(request.getParameter("title") == null) {
					if(prevUrl.indexOf("board/view") == -1) {
					log.info("WARNING >>> 비정상적인 접근 :(");
					response.sendRedirect(finalUrl);
					return false;
					}
				}
			}
		}
		
		// 정상적인 접근인 경우 실행!
		if(session.getAttribute("userid") == null) {
			if(prevUrl.equals(nextUrl)) {
				log.info("WARNING >> prevUrl == nextUrl :/");
				response.sendRedirect(finalUrl);
				return false;
			}
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			if(qString != null) {
				uri = uri + "?" + qString;
			}
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
