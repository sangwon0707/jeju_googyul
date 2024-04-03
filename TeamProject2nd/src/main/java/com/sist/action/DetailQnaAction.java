package com.sist.action;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.QnaDAO;
import com.sist.vo.QnaVO;

public class DetailQnaAction implements SistAction { 

	@Override 
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int uno = (Integer)session.getAttribute("uno");
		String u_name = (String)session.getAttribute("name");
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		System.out.println("uno: " + uno);
		System.out.println("qno: " + qno);
		
		QnaDAO dao = QnaDAO.getInstance();
		QnaVO q = dao.detailQna(qno, uno);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String q_date = sdf.format(q.getQ_date());
		String q_title = q.getQ_title();
		String q_content = q.getQ_content();
		String a_content = q.getA_content();
		if(a_content ==null){
			a_content = "관리자의 답변을 대기중입니다...\n" +
		            "저희는 항상 최선을 다해 고객님들에게 최상의 서비스를 제공하고 있습니다. " +
		            "언제든지 궁금한 사항이나 문의사항이 있으시면 아래 연락처로 문의 주시기 바랍니다.\n" +
		            "고객센터 연락처:\n" +
		            "- 전화번호: [1988-6868]\n" +
		            "- 이메일: [helpdesk@gugyul.com]\n\n" +
		            "감사합니다.\n" +
		            "GOOGYUL 고객서비스팀 드림\n";
		}
		System.out.println("q_date: " + q_date);
		System.out.println("q_title: " + q_title);
		System.out.println("q_content: " + q_content);
		System.out.println("a_content: " + a_content);
		System.out.println("qno: " + qno);
		
		
		request.setAttribute("u_name", u_name);
		request.setAttribute("qno", qno);
		request.setAttribute("q_date", q_date);
	    request.setAttribute("q_title", q_title);
	    request.setAttribute("q_content", q_content);
	    request.setAttribute("a_content", a_content);
	    request.setAttribute("uno", uno);
	    
		return "detailQna.jsp";
	}

} 
