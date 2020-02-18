package com.jogging.service.index;

import java.util.List;

import com.jogging.domain.ProductDTO;

public interface IndexService {
	
	// 베스트 상품 5건 출력
	public List<ProductDTO> bestPdtList();
	
	// 신상품을 5건 출력
	public List<ProductDTO> newPdtList();
	
}
