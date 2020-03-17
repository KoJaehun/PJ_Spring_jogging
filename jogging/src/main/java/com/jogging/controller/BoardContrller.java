package com.jogging.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardContrller {
	
	@GetMapping("/list")
	public String board() {
		
		log.info(">>>> GET Board Success");
		
		return "board/list";
	}

}
