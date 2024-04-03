package com.sist.action;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertReservationAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			int guest_cnt = Integer.parseInt(request.getParameter("guests"));
			int price = Integer.parseInt(request.getParameter("price"));
			System.out.println(price);
			String checkin_date = request.getParameter("checkin_date");
			String checkout_date = request.getParameter("checkout_date");
			
			String p_name = request.getParameter("p_name");
			String rating = request.getParameter("rating");		
			
			int cleanPrice = 20000;
			int saleprice = Integer.parseInt(request.getParameter("saleprice"))+cleanPrice;
			
			
//			String checkin_date = "2024-01-15";
//			String checkout_date = "2024-01-16";
			
			// 문자열을 LocalDate로 변환
	        LocalDate checkinDate = LocalDate.parse(checkin_date, DateTimeFormatter.ISO_DATE);
	        LocalDate checkoutDate = LocalDate.parse(checkout_date, DateTimeFormatter.ISO_DATE);
			long daysBetween = java.time.temporal.ChronoUnit.DAYS.between(checkinDate, checkoutDate);
//			int guest_cnt = 3;
//			String p_name = "드루와 게스트하우스";
			int pno = 710001;
//			String rating = "4.5";
//			int price = 50000;
//			int cleanPrice = 20000;
//			int saleprice = (int) (price*daysBetween)+cleanPrice;
			
		request.setAttribute("checkin_date", checkinDate);
		request.setAttribute("checkout_date", checkoutDate);
		request.setAttribute("daysBetween", daysBetween);
		request.setAttribute("guest_cnt", guest_cnt);
		request.setAttribute("p_name", p_name);
		request.setAttribute("rating", rating);
		request.setAttribute("price", price);
		request.setAttribute("cleanPrice", cleanPrice);
		request.setAttribute("saleprice", saleprice);
		request.setAttribute("pno", pno);
		return "insertReservation.jsp";
	}

}
