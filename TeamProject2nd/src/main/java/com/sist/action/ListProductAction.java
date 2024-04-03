package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.ProductDAO;
import com.sist.dao.WishlistDAO;

public class ListProductAction implements SistAction {
 
    @Override
    public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "template.jsp";
        int uno = 0;

        HttpSession session = request.getSession();
        Integer unoAttribute = (Integer) session.getAttribute("uno");

        if (unoAttribute != null) {
            uno = unoAttribute;
        } 

        ProductDAO dao = ProductDAO.getInstance();
        session.setAttribute("mainlist", dao.listProduct(uno));

        if (uno != 0) {
            WishlistDAO dao2 = WishlistDAO.getInstance();
            session.setAttribute("wishList", dao2.listMyWishlist(uno));
        }

        request.setAttribute("viewPage", "listProduct.jsp");
        return viewPage;
    }
}


