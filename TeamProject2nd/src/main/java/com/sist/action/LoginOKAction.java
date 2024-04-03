package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

public class LoginOKAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "template.jsp";
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//id (email)에서 앞의 글씨만 뽑아와 변수에 저
		String[] parts = id.split("@");
        String username = parts[0];

		
		UserDAO dao = UserDAO.getInstance();
		if(dao.login(id, pwd) == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("userID", username);
			session.setAttribute("email", id.toUpperCase());
			
            UserVO user = dao.detailUserData(id);
            session.setAttribute("uno", user.getUno());
            session.setAttribute("name", user.getU_name());
            session.setAttribute("nickname", user.getNickname());
            session.setAttribute("phone", user.getU_phone());
			session.setAttribute("password", user.getU_pwd());
			request.setAttribute("viewPage", "listProduct.do");
		}else {
			request.setAttribute("msg", "로그인에 실패하였습니다.");
			request.setAttribute("viewPage", "login.do");
		}
//		// 세션이 종료되었을 때 홈 페이지로 리다이렉트
//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("userID") == null) {
//            response.sendRedirect(request.getContextPath() + "/home"); // 홈 페이지의 URL로 수정
//        }
		
		return viewPage;
	}
}
 