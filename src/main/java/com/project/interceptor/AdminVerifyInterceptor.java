package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.member.domain.MemberDTO;

public class AdminVerifyInterceptor extends HandlerInterceptorAdapter{
	
	// url 입력으로 관리자페이지 무단접속 방지용 인터셉터
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		
		HttpSession loginUserSession = request.getSession();
		
		MemberDTO memberSession = (MemberDTO) loginUserSession.getAttribute("memberInfo");
		
		if (memberSession == null || memberSession.getUserVerify() != 128) {
			
			response.sendRedirect("/mainPage/mainPage");
			
			return false;
			
		}
		
		return true;
	}

}
