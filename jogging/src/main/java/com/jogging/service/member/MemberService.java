package com.jogging.service.member;

import com.jogging.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 id중복체크(AJAX)
	public int idOverlap(String id);
	
	// 회원가입 (DB에 등록)
	public int memInsert(MemberDTO mDto);
}