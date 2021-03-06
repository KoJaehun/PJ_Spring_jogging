package com.jogging.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jogging.domain.MemberDTO;
import com.jogging.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override
	public int idOverlap(String id) {
		return mDao.idOverlap(id);
	}
	
	@Override
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	}
	
	@Override
	public MemberDTO userView(String id) {
		return mDao.userView(id);
	}

	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		
		if(result > 0) { // 수정성공
			// 세션에 로그인유저 정보를 저장 
			session.removeAttribute("name");
			session.setAttribute("name", mDto.getName());
		}
		
	}

	@Override
	public int getKey(String id, String key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int alterKey(String id, String key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int pwCheck(String id, String pw) {
		String encPw = mDao.pwCheck(id);
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		mDao.pwUpdate(mDto);
		
	}

	
	
	@Override
	public void memDrop(HttpSession session, String id) {
		// 비즈니스로직(회원탈퇴)
		// 1) 해당회원의 useyn = n 으로 Update(DB)
		int result = mDao.memDrop(id);
		
		// 2) 로그인 정보를 삭제 (session 초기화)
		if(result > 0) {
			session.invalidate();
		}
	}
	
	

	
}
