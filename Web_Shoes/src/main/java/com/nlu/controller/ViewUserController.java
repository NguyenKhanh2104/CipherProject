package com.nlu.controller;

import com.nlu.model.User;
import com.nlu.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/ViewUserController")
public class ViewUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService us = new UserService();
        List<User> u = us.findAll();
        HttpSession session2 = request.getSession();
        session2.setAttribute("listU", u);
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }

}
