package com.nlu.controller;

import com.nlu.model.Order;
import com.nlu.service.OrderService;
import lombok.SneakyThrows;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/admin/orders/update")
public class UpdateOrderController extends HttpServlet {
    private OrderService orderService = new OrderService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Order existingDetail = orderService.getOrderById(id);
        req.setAttribute("orderDetail", existingDetail);
        req.getRequestDispatcher("/admin/order-detail.jsp").forward(req, resp);
    }
    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        int status = Integer.parseInt(request.getParameter("status"));
        Order o = new Order(orderId,status);
        orderService.updateStatusOrder(o);
        response.sendRedirect("/admin/orders");
    }
}
