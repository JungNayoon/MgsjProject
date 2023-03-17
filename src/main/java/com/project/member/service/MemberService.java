package com.project.member.service;

import java.util.List;

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
	
	// 아이디 찾기
	public MemberDTO memberFindId(MemberDTO memberDTO) throws Exception;
	
	// 비밀번호 찾기
	public MemberDTO memberFindPwd(MemberDTO memberDTO) throws Exception;
	
	
	// ---------------관리자---------------
	// 회원 관리를 위한 회원 리스트 가져오기
	public List<MemberDTO> getMemberList(int displayTotalContent, int pageContent, String searchType, String keyword) throws Exception;
	
	// 회원 검색 기능
	public int totalSearchMember(String searchType, String keyword) throws Exception;
	// ---------------관리자 끝---------------
}
