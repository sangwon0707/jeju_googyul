package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

public class JoinMemberAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage="template.jsp";
		request.setAttribute("viewPage", "joinMember.jsp");
		return viewPage;
	}	
} 
