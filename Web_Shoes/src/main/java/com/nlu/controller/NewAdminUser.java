package com.nlu.controller;

import com.nlu.model.User;
import com.nlu.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/new-admin")
public class NewAdminUser extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");
        if (userService.exitsUsername(username)) {
            req.setAttribute("mess", "Username đã tồn tại vui lòng chọn tên khác");
            req.getRequestDispatcher("/admin/user-new.jsp").forward(req, resp);
            return;
        }
        if (userService.exitsEmail(email)) {
            req.setAttribute("mess", "Email đã tồn tại vui lòng chọn email khác");
            req.getRequestDispatcher("/admin/user-new.jsp").forward(req, resp);
            return;
        }
        if (!password.equals(confirmPassword)) {
            req.setAttribute("mess", "Vui lòng xác nhận đúng mật khẩu");
            req.getRequestDispatcher("/admin/user-new.jsp").forward(req, resp);
            return;
        }
        User user = new User();
        user.setUserKey(username, password);
        user.setUsername(username);
        user.setEmail(email);
        user.setPasswordMD5(password);
        userService.save(user, "admin");
        req.setAttribute("register-success", "success");
        req.getRequestDispatcher("/admin/user-new.jsp").forward(req, resp);
    }
}

