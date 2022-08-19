package com.nlu.controller;

import com.nlu.model.Order;
import com.nlu.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateOrderController", urlPatterns = "/admin/orders/detail")
public class DetailOrderController extends HttpServlet {
    OrderService oS = new OrderService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Order o = oS.getOrderById(id);


        req.setAttribute("odetail", o);
        req.getRequestDispatcher("/admin/order-detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req,resp);

    }
}
