
//package com.nlu.controller;
//
//import com.nlu.model.Order;
//import com.nlu.model.Product;
//import com.nlu.service.OrderService;
//import lombok.SneakyThrows;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.sql.Timestamp;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.List;
//
//@WebServlet("/admin/orders/update")
//public class DetailOrderController extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    private OrderService orderService;
//
//    public void init() {
//        orderService = new OrderService();
//    }
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//        String id = req.getParameter("id");
//        Order existingDetail = orderService.getOrderById(id);
//        req.setAttribute("order", existingDetail);
//        req.getRequestDispatcher("/admin/order-detail.jsp").forward(req, resp);
//    }
//    @SneakyThrows
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doGet(request, response);
//    }
//
//
//
//    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, ServletException, IOException {
//        String id = request.getParameter("id");
//        Order existingDetail = orderService.getOrderById(id);
//        System.err.println("ahahahahah");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/order-detail.jsp");
//        System.err.println("hiihijihihihihih");
//        request.setAttribute("orderDetail", existingDetail);
//        dispatcher.forward(request, response);
//
//    }
//
//    private void insertUser(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException {
////        String name = request.getParameter("name");
////        String email = request.getParameter("email");
////        String country = request.getParameter("country");
////        User newUser = new User(name, email, country);
////        userDAO.insertUser(newUser);
////        response.sendRedirect("list");
//    }
//
//    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException, ParseException {
//        String orderId = request.getParameter("id");
//        String address = request.getParameter("address");
//        SimpleDateFormat formatter6=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
//        String date = request.getParameter("date");
//        Timestamp dateTime= (Timestamp) formatter6.parse(date);
//        int status = Integer.parseInt(request.getParameter("status"));
//        String note = request.getParameter("note");
//        int user_id = Integer.parseInt(request.getParameter("user_id"));
//        String email = request.getParameter("email");
//        String city = request.getParameter("city");
//        String phone = request.getParameter("phone");
//        String sign = request.getParameter("sign");
//        String dataSign = request.getParameter("dataSign");
//        Order o = new Order(orderId, address, dateTime, status,note,user_id,email,city,phone,sign,dataSign);
//        orderService.updateOrder(o);
//        response.sendRedirect("/admin/orders.jsp");
//    }
//
//    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException {
////        int id = Integer.parseInt(request.getParameter("id"));
////        userDAO.deleteUser(id);
////        response.sendRedirect("list");
//
//    }
//
//}

