package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.QnaDAO;

public class ListMyQna implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int uno = (Integer)session.getAttribute("uno");
		
		QnaDAO dao = QnaDAO.getInstance();
		ArrayList<HashMap<String, Object>> qnaList = dao.listMyQna(uno);
				
		//다오출력확인
		for (HashMap<String, Object> qna : qnaList) {
	        System.out.println("Q_TITLE: " + qna.get("q_title"));
	        System.out.println("Q_CONTENT: " + qna.get("q_content"));
	        System.out.println("Q_DATE: " + qna.get("q_date"));
	        System.out.println("----------------------------");
	    }
        request.setAttribute("qnaList", qnaList);
		        

		
		return "listMyQna.jsp";
	}
} 
