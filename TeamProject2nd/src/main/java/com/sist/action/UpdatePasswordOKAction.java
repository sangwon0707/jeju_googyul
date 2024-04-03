package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.UserDAO;

public class UpdatePasswordOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        int re = -1;
        String viewPage = "updatePassword.jsp";
		HttpSession session = request.getSession(); 
        String password = (String)session.getAttribute("password");
        int uno = (Integer)session.getAttribute("uno");
        System.out.println("기존패스워드: " + password);
        System.out.println("회원번호: " + uno);
        
		String currentPassword = (String)request.getParameter("currentPassword");
		String newPassword = (String)request.getParameter("newPassword");
		String confirmNewPassword= (String)request.getParameter("confirmNewPassword");
		
		System.out.println("현재 비밀번호 : " + currentPassword);
		System.out.println("새 비밀번호: " + newPassword);
		System.out.println("새 비밀번호 확인: "+ confirmNewPassword);
		
		UserDAO dao = UserDAO.getInstance();
		
		try {
			if(password.equals(currentPassword)){
			    if(newPassword.equals(confirmNewPassword)){
			        re = dao.updatePassword(newPassword, uno);
			        System.out.println("비밀번호 변경에 성공하였습니다.");
			        session.invalidate();
			        request.setAttribute("msg", "비밀번호 변경되었습니다. 다시 로그인해주세요.");
			        request.setAttribute("viewPage", "login.jsp");
			        viewPage = "template.jsp";
			    }else{
			        request.setAttribute("msg", "오류: 변경할 비밀번호가 일치하지 않습니다.");
			    }
			} else {
			    System.out.println("오류: 패스워드 변경에 실패하였습니다.");
			    request.setAttribute("msg", "오류: 기존 비밀번호를 다시 확인해주세요.");
			}
		} catch (Exception e) {	
			System.out.println("예외발생: " + e.getLocalizedMessage());
		}
		return viewPage;
	}
} 
