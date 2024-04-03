package com.sist.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sist.dao.ReservationDAO;
import com.sist.vo.ReservationVO;

public class InsertReservationOKAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		ReservationDAO dao = ReservationDAO.getInstance();
		int rno = dao.getNextRno();
		System.out.println("예약번호 "+rno);
		
		// 현재 날짜를 가져오기 위해 java.sql.Date를 사용
		Date sysDate = new Date(System.currentTimeMillis());
		String cardNumber = request.getParameter("cardNumber");
		String checkin_date = request.getParameter("checkin_date");
		String checkout_date = request.getParameter("checkout_date");
		int guest_cnt = Integer.parseInt(request.getParameter("guest_cnt"));
		System.out.println("인원수 "+guest_cnt);
		int saleprice = Integer.parseInt(request.getParameter("saleprice"));
		System.out.println("총가격 "+saleprice);
		int uno = (int)session.getAttribute("uno");
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("상품번호 "+pno);
		int re = dao.insertReservation(new ReservationVO(rno, sysDate, cardNumber, checkin_date, checkout_date, guest_cnt, saleprice, uno, pno));
		System.out.println(re);
		
        request.setAttribute("viewPage", "listProduct.jsp");
		return "template.jsp";
	}

}
