package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.member.domain.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession loginSession = request.getSession();

		MemberDTO memberLogin = (MemberDTO) loginSession.getAttribute("memberInfo");

		if (memberLogin == null) {
			
			response.sendRedirect("/member/memberLoginPage");

			return false;

		}

		return true;
	}
}
