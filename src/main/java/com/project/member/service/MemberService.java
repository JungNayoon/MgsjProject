package com.project.member.service;

import com.project.member.domain.MemberAddressDTO;
import com.project.member.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 로직
	public void signUpMember(MemberDTO memberDTO, MemberAddressDTO memberAddressDTO) throws Exception;
	
	// 로그인 로직
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception;
	
	// 회원정보 수정 로직
	public void memberModify(MemberDTO memberDTO) throws Exception;
	
	// 아이디 중복검사 로직
	public int checkDuplicateId(String userId) throws Exception;
}
