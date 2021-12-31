package com.nlu.controller;

import com.nlu.model.Cart;
import com.nlu.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/order")
public class OrderController extends HttpServlet {

    private CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String orderId = req.getParameter("id");

        Cart cart = cartService.findById(orderId);


        req.setAttribute("cart", cart);


        req.getRequestDispatcher("/admin/order-details.jsp").forward(req, resp);

    }

}
