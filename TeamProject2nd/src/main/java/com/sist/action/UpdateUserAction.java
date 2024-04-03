package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

public class UpdateUserAction  implements SistAction{
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
        String password = (String)session.getAttribute("password");
        int uno = (Integer)session.getAttribute("uno");	
        String phone = request.getParameter("phone");
        String nickname = request.getParameter("nickname");
        
        
        
        UserDAO dao = UserDAO.getInstance();
        int re = dao.updateUser(phone, nickname, uno);
       
        
        
        if(re > 0){
        	session.setAttribute("phone", phone);
        	session.setAttribute("nickname", nickname);
            request.setAttribute("msg", "회원정보변경에 성공하였습니다.");
        }else {
        	request.setAttribute("msg", "회원정보 업데이트에 실패. 다시 시도해주세요.");
        }       
        return "listUserData.jsp";
	} 
}

