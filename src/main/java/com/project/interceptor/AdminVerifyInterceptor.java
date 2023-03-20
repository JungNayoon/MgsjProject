package com.project.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.member.domain.MemberDTO;

public class AdminVerifyInterceptor extends HandlerInterceptorAdapter{
	
	// url 입력으로 관리자페이지 무단접속 방지용 인터셉터
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		
		// printWriter 글자 깨짐 방지용 인코딩 -> 서블릿에서 주로 쓰이는 개념
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession loginUserSession = request.getSession();
		
		MemberDTO memberSession = (MemberDTO) loginUserSession.getAttribute("memberInfo");
		
		if (memberSession == null || memberSession.getUserVerify() != 128) {
			
			PrintWriter out  = response.getWriter();
			
			out.print("<script> alert('관리자만 로그인이 가능합니다'); location.href='/mainPage/mainPage';</script>");
			
			out.flush();
			
			out.close();
			
			return false;
			
		}
		
		return true;
	}

}
