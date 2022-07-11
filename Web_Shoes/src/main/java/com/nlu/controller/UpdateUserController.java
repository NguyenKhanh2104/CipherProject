//package com.nlu.controller;
//
//import com.nlu.model.Product;
//import com.nlu.model.ProductDetails;
//import com.nlu.model.User;
//import com.nlu.service.ProductDetailsService;
//import com.nlu.service.ProductService;
//import com.nlu.service.UserService;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//
//@WebServlet(name = "UpdateUserController", value = "/admin/users/update")
//public class UpdateUserController extends HttpServlet {
//    UserService uS = new UserService();
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String id = req.getParameter("id");
//        User u = uS.getUserById(Integer.parseInt(id));
////        Li
//        req.setAttribute("listU", u.getKey());
//    }
//}
