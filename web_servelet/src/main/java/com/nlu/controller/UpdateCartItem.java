package com.nlu.controller;

import com.nlu.model.Cart;
import com.nlu.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/cart")
public class UpdateCartItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String quality = req.getParameter("quality");

        String id = req.getParameter("id");


        HttpSession session = req.getSession();
        Cart cart = Cart.getCart(session);
        HashMap<Integer, CartItem> cart1 = cart.getCart();
        CartItem item = cart1.get(Integer.parseInt(id));
        if (item.getProductDetailsId() == Integer.parseInt(id) && Integer.parseInt(quality) == 1) {
            item.setQuality(item.getQuality() + 1);
            cart.put(item, item.getQuality());
            cart.commit(session);
            req.getRequestDispatcher("/main/cart.jsp").forward(req, resp);
        }
        if (item.getProductDetailsId() == Integer.parseInt(id) && Integer.parseInt(quality) == -1) {
            item.setQuality(item.getQuality() - 1);
            cart.put(item, item.getQuality());
            cart.commit(session);
            req.getRequestDispatcher("/main/cart.jsp").forward(req, resp);
        }


    }
}
