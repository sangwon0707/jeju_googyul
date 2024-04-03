package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.UserDAO;

public class UserInfoAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String viewPage = "";
//		
//		return viewPage;
//		
		String viewPage="template.jsp";
		request.setAttribute("viewPage", "userInfo.jsp");
		return viewPage;
	}
 
}
