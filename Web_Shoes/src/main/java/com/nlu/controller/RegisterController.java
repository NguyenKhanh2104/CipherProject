package com.nlu.controller;

import com.nlu.model.User;
import com.nlu.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");
        String district = req.getParameter("district");
        String addressDetails = req.getParameter("address-details");

        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");
        if (userService.exitsUsername(username)) {
            req.setAttribute("mess", "Username đã tồn tại vui lòng chọn tên khác");
            req.getRequestDispatcher("/main/register.jsp").forward(req, resp);
            return;
        }
        if (userService.exitsEmail(email)) {
            req.setAttribute("mess", "Email đã tồn tại vui lòng chọn email khác");
            req.getRequestDispatcher("/main/register.jsp").forward(req, resp);
            return;
        }
        if (!password.equals(confirmPassword)) {
            req.setAttribute("mess", "Vui lòng xác nhận đúng mật khẩu");
            req.getRequestDispatcher("/main/register.jsp").forward(req, resp);
            return;
        }
        User user = new User();
        user.setId(0);
        user.setUserKey(username,password);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setCity(city);
        user.setDistric(district);
        user.setAdddressDetails(addressDetails);
        user.setPasswordMD5(password);
        userService.save(user, "customer");
        req.setAttribute("register-success","success");
        req.getRequestDispatcher("/main/register.jsp").forward(req,resp);
    }
}
