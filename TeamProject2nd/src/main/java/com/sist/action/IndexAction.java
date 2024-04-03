package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String viewPage="template.jsp";
		request.setAttribute("viewPage", "listProduct.jsp");
		System.out.println(viewPage);
		return viewPage;
	}
}
