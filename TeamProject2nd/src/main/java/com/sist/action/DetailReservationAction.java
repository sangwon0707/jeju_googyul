package com.sist.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.ProductDAO;
import com.sist.dao.ReservationDAO;
import com.sist.vo.ReservationVO;

public class DetailReservationAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int uno = (Integer)session.getAttribute("uno");
		String u_name = (String)session.getAttribute("name");
		String u_email = (String)session.getAttribute("email");
		String u_phone = (String)session.getAttribute("phone");
		int rno = Integer.parseInt(request.getParameter("rno"));
		request.setAttribute("u_name", u_name);
	    request.setAttribute("u_email", u_email);
	    request.setAttribute("u_phone", u_phone);
		
		//유저 정보 세션 받아오기
		System.out.println(u_name);
		System.out.println(u_email);
		System.out.println(u_phone);
		System.out.println(rno+"");
		
		//선택된 예약번호에 해당되는 예약정보 불러오
		ReservationDAO dao = ReservationDAO.getInstance();
		ReservationVO r = dao.detailReservation(rno);
		if (r != null) {
			Date r_Date = r.getR_date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = sdf.format(r_Date);
		    String checkin = r.getCheckin_date();
		    String checkout = r.getCheckout_date();
		    
		    String resevation_date = formattedDate; 
		    System.out.println(checkin + checkout);
		    request.setAttribute("r_date", resevation_date);
		    request.setAttribute("checkIn_date", checkin);
		    request.setAttribute("checkOut_date", checkout);
		} else {
		    // Handle the case where no reservation is found for the given rno
		    // You can redirect to an error page or do some other appropriate action.
		}
		
		//선택된 예약번호에 해당하는 숙소 정보 불러오기
		ProductDAO dao2 = ProductDAO.getInstance();
		HashMap<String, Object> productInfo = dao2.getProductVoucher(rno, uno);

		// request에 값 설정
		request.setAttribute("pno", productInfo.get("pno"));
		request.setAttribute("p_name", productInfo.get("productName"));
		request.setAttribute("p_phone", productInfo.get("pPhone"));
		request.setAttribute("addr", productInfo.get("addr"));
		
		return "detailReservation.jsp";
	}

} 
