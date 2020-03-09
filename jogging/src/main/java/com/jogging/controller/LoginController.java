package com.jogging.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jogging.domain.MemberDTO;
import com.jogging.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@Slf4j
@RestController
public class LoginController {
	
	@Autowired
	LoginService IService;
	
	
	@PostMapping("/in")
	public Integer logIn(MemberDTO mDto, HttpSession session) {
		log.info(">>>>> POST : LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		
		
		
		// 로그인
		int result = IService.login(mDto, session);
		log.info("결과는~~~~~~" + result);
		
		return result;
	}
	
	@PostMapping("/out")
	public void logOut(HttpSession session) {
		log.info(">>>> POST: LOGOUT/LOGOUT ACTION");
		
		IService.logout(session);
	}
	
}
