package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.WishlistDAO;

public class ListWishlistAction implements SistAction {
 
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WishlistDAO dao = WishlistDAO.getInstance();
        HttpSession session = request.getSession();  
		
        Integer unoInteger = (Integer) session.getAttribute("uno");
        // Check if "uno" attribute is present and not null
        if (unoInteger == null) {
            // Handle the case where "uno" is not in the session (redirect, show an error, etc.)
            // For now, let's assume you want to redirect to the login page
            return "userInfo.do"; // Adjust the actual login page URL accordingly
        }
        // Retrieve the user ID as int
        int uno = unoInteger;
        
        ArrayList<HashMap<String, Object>> wishlistList = dao.listMyWishlist(uno);
        request.setAttribute("wishlistList", wishlistList);
        
		return "listWishlist.jsp";
	}

}
  