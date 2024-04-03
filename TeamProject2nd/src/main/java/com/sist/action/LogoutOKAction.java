package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutOKAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		//로그아웃시 세션상태가 폴스이면 로그인 페이 뷰페이지로 하여 메인페이지로 돌려 보낸다. 
        session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
        	request.setAttribute("viewPage", "login.do");
        }		
		return "template.jsp";
	}

}
 