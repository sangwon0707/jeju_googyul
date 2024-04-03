package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.ImageDAO;
import com.sist.dao.ProductDAO;
import com.sist.dao.ReviewDAO;
import com.sist.vo.ImageVO;
import com.sist.vo.ProductVO;

public class DetailProductAction implements SistAction {  

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println(pno);
		
		ImageDAO dao = ImageDAO.getInstance();
		ImageVO img = dao.listImage(pno);
		request.setAttribute("imageList", img);
		
		ProductDAO pdao = ProductDAO.getInstance();
		ProductVO pd = pdao.detailProduct(pno);
		request.setAttribute("pd", pd);
		
		ReviewDAO rdao = ReviewDAO.getInstance();
		ArrayList<HashMap<String, Object>> list = rdao.detailReview(pno);
		request.setAttribute("reviewList", list);
		
		return "detailProduct.jsp";

	}

}
