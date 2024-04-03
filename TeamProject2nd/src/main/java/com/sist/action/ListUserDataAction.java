package com.sist.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;
 
public class ListUserDataAction implements SistAction {
    @Override
    public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String viewPage = "listUserData.jsp";
    	UserDAO dao = UserDAO.getInstance();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        request.setAttribute("msg", ""); //메세지 초기화
        // 클라이언트로부터 이메일 주소를 받아온다

        // 이메일이 null이 아닌 경우에만 dao.listUserData(email) 호출
        if (email != null) {
            // dao.listUserData(email)를 호출하여 회원 정보를 가져온다
            UserVO user = dao.detailUserData(email);

            // 회원 정보를 request 속성에 저장
            if (user != null) {
                request.setAttribute("name", user.getU_name());
                request.setAttribute("nickname", user.getNickname());
                request.setAttribute("phone", user.getU_phone());
                request.setAttribute("email", user.getU_email());
            } else {
                // 회원 정보가 없을 경우에 대한 처리 (예: 오류 메시지 설정 등)
                // 예시로 오류 메시지를 설정하였지만 실제 상황에 따라 다르게 처리할 수 있습니다.
                request.setAttribute("error", "해당 이메일 주소에 대한 회원 정보를 찾을 수 없습니다.");
            }
        } else {
        	viewPage = "login.jsp";
            // 이메일이 null인 경우 처리 (예: 오류 메시지 설정 등)
            // 예시로 오류 메시지를 설정하였지만 실제 상황에 따라 다르게 처리할 수 있습니다.
            request.setAttribute("error", "이메일 주소가 제공되지 않았습니다.");
        }
        return viewPage;
    }
}
 
