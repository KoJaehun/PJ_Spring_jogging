package com.jogging.persistence;

import com.jogging.domain.MemberDTO;

public interface LoginDAO {

	// 로그인
	public MemberDTO loginUser(MemberDTO mDto);
	
	
}
