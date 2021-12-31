package com.nlu.controller;

import com.nlu.model.Cart;
import com.nlu.service.CartService;
import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    CartService cartService = new CartService();

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String city = req.getParameter("city");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String note = req.getParameter("note");

        Cart cart = Cart.getCart(req.getSession());
        if (cart.getData().size() > 0) {
            cartService.save(fullName, null, email, phone, city, address, note, cart);
            cart.clear(req.getSession());
            resp.sendRedirect("/");
        }


    }
}
