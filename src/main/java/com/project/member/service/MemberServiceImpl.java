package com.project.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.member.dao.MemberDAO;
import com.project.member.domain.MemberAddressDTO;
import com.project.member.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDAO memberDAO;

	// 회원가입 로직 service
	@Override
	public void signUpMember(MemberDTO memberDTO, MemberAddressDTO memberAddressDTO) throws Exception {

		logger.info("회원가입 실행 signUpMember - (Service)");

		memberDAO.signUpMember(memberDTO, memberAddressDTO);
	}

	// 로그인 로직 service
	@Override
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {

		logger.info("로그인 실행 memberLogin - (service)");

		return memberDAO.memberLogin(memberDTO);
	}
	
	// 회원정보 수정
	@Override
	public void memberModify(MemberDTO memberDTO) throws Exception {
		
		logger.info("회원정보 수정 memberModify - service");
		
		memberDAO.memberModify(memberDTO);
		
	}
	
	// 아이디 중복검사 로직
	@Override
	public int checkDuplicateId(String userId) throws Exception {
		
		logger.info("아이디 중복검사 수행 checkDuplicateId - service : {}", userId);
		
		return memberDAO.checkDuplicateId(userId);
	}
	
	// 아이디 찾기
	@Override
	public MemberDTO memberFindId(MemberDTO memberDTO) throws Exception {
		
		logger.info("회원 아이디 찾기 실행 - service");
		
		return memberDAO.memberFindId(memberDTO);
	}
	
	// 비밀번호 찾기
	@Override
	public MemberDTO memberFindPwd(MemberDTO memberDTO) throws Exception {
		
		logger.info("회원 비밀번호 찾기 실행 - service");
		
		return memberDAO.memberFindId(memberDTO);
	}
	
	// 회원 탈퇴
	@Override
	public void removeMember(MemberDTO memberDTO) throws Exception {
		
		logger.info("회원탈퇴 - service");
		
		memberDAO.removeMember(memberDTO);
	}
	
	// 회원 탈퇴에 필요한 비밀번호 가져오기
	@Override
	public String getUserPwd(String userId) throws Exception {
		
		return memberDAO.getUserPwd(userId);
	}
	
	// ---------------관리자---------------
	// 회원 관리를 위한 회원 리스트 가져오기
	@Override
	public List<MemberDTO> getMemberList(int displayTotalContent, int pageContent, String searchType, String keyword) throws Exception {
		
		logger.info("회원 리스트 가져오기(관리자) getMemberList - service");
		
		return memberDAO.getMemberList(displayTotalContent, pageContent, searchType, keyword);
	}

	// 회원 검색 기능
	@Override
	public int totalSearchMember(String searchType, String keyword) throws Exception {
		
		logger.info("회원 검색 시작 (관리자) totalSearchMember - service");
		
		return memberDAO.totalSearchMember(searchType, keyword);
	}
}
