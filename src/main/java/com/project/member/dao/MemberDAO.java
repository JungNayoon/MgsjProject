package com.project.member.dao;

import com.project.member.domain.MemberAddressDTO;
import com.project.member.domain.MemberDTO;

public interface MemberDAO {
	
	// 회원가입 로직 구현 DAO
	public void signUpMember(MemberDTO memberDTO, MemberAddressDTO memberAddressDTO) throws Exception;
	
	// 로그인 로직 구현 DAO
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception;
	
	// 회원정보 수정 DATO
	public void memberModify(MemberDTO memberDTO) throws Exception;
	
	// 아이디 중복검사 로직
	public int checkDuplicateId(String userId) throws Exception;
}
