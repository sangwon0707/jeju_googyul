package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

public class JoinMemberOkAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Retrieve user information from the registration form
	    UserDAO userDao = UserDAO.getInstance();
	   
		int uno = userDao.getNextUno();
	    String u_name = request.getParameter("u_name");
	    String u_email = request.getParameter("u_email");
	    String u_phone = request.getParameter("u_phone");
	    String u_pwd = request.getParameter("u_pwd");
	    String u_pwd_confirm = request.getParameter("u_pwd_confirm");
	    String nickname = request.getParameter("nickname");
	    
	    // Check if the passwords match
	    if (!u_pwd.equals(u_pwd_confirm)) {
	        request.setAttribute("message", "비밀번호가 불일치 합니다!");
	        return "joinMember.jsp";
	    }

	    // Create a UserVO object with the retrieved information
	    UserVO user = new UserVO(uno, u_name, u_email, u_phone, u_pwd, nickname);
	    
	    // Perform user registration
	    int result = userDao.joinUser(user);

	    // Handle the result and set attributes accordingly
	    if (result > 0) {
	        request.setAttribute("message", "회원가입을 환영합니다!");
	        return "login.jsp";
	    } else {
	        request.setAttribute("message", "회원가입 실패!. 다시 입력해주세요!");
	        return "joinMember.jsp";
	    }
	}

}
 