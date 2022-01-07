package com.nlu.controller;

import com.nlu.mail.MailService;
import com.nlu.model.Cart;
import com.nlu.model.CartItem;
import com.nlu.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/cart/add")
public class CartController extends HttpServlet {


    CartService cartService = new CartService();
//    MailService mailService = new MailService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("details_id");
//        String id = req.getParameter("id");
        String quality = req.getParameter("quality");

        if (id == null) {
            resp.sendRedirect("/");
            return;
        }
//        if (Integer.parseInt(quality) < 1) {
//            resp.sendRedirect("/");
//            return;
//        }
        CartItem item = cartService.findProductById(Integer.parseInt(id));
        HttpSession session = req.getSession();
        Cart cart = Cart.getCart(session);
        cart.put(item, 1);
        cart.commit(session);
        req.getRequestDispatcher("/main/cart.jsp").forward(req, resp);

    }
}
