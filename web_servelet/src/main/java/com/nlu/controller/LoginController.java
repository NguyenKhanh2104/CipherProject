package com.nlu.controller;

import com.nlu.model.User;
import com.nlu.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/main/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserService userService = new UserService();
        User user = userService.getUser(username, password);
        if (user == null) {
            req.setAttribute("err", "User name hoặc mật khẩu sai");
        }
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("auth", user);
            if (user.getRole().equals("admin")) {
                req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
            }
            if (user.getRole().equals("customer")) {
                resp.sendRedirect("/");
            }
        }

    }
}
