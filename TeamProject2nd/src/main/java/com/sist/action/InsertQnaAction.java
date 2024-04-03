package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.QnaDAO;
import com.sist.vo.QnaVO;

public class InsertQnaAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int re = -1;
		HttpSession session = request.getSession();
		
		int uno = (Integer)session.getAttribute("uno");
		
		QnaDAO dao = QnaDAO.getInstance();
		
		int qno = dao.getNextQno();
	
		String q_title = request.getParameter("q_title");
		String q_content= request.getParameter("q_content");

		System.out.println("q_title: " + q_title);
		System.out.println("q_content " + q_content);		
		
		QnaVO q = new QnaVO();
		q.setQno(qno);
		q.setQ_title(q_title);
		q.setQ_content(q_content);
		q.setUno(uno);
		
		re = dao.insertQna(q);
		if(re == 1){
			System.out.println("문의하기 입력에 성공하셨습니다.");
		}else{
			System.out.println("오류: 문의하기 입력실패");
		}
		return "listMyQna.do";
	}

}
