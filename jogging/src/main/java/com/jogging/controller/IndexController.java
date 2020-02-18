package com.jogging.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jogging.domain.ProductDTO;
import com.jogging.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	// @Inject, @Autowired, @Resource 중 1개라도
	// 붙어있으면 의존성 주입
	
	// @Inject와 @Autowired는 타입으로 의존성 주입
	// @Resource는 변수명으로 의존성 주입
	
	@Autowired
	IndexService iService;
	
	
	@GetMapping("/index")
	public String indexView(Model model) {
		log.info(">>>>> INDEX PAGE 출력");
		
		
		// View 단에 출력할 데이터
		List<ProductDTO> list = iService.bestPdtList();
		model.addAttribute("BestPdt", list);
		 model.addAttribute("NewPdt", iService.newPdtList());
		// 출력할 화면을 결정
		return "index";
		
		
		
		// 2. View단에 출력할 베스트상품 5건
		// model.addAttribute("BestPdt", iService.bestPdtList());
		
		// 2. View단에 출력할 신상품 5건
		//  : 신상품 5건을 출력하는 비즈니스 로직을 처리하는
		//    서비스단으로 이동
		
		// 5건 신상품 데이터
		
		
	}
}
