package com.nlu.controller;

import com.nlu.algorithms.algorithms.Asymmetric;
import com.nlu.model.User;
import com.nlu.service.UserService;
import com.nlu.service.test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Asymmetric as = new Asymmetric("RSA", 512);
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
        String pri = null;
        String pub = null;
        try {
            KeyPair keypair = as.genKey();
            pri = Base64.getEncoder().encodeToString(keypair.getPrivate().getEncoded());
            pub = Base64.getEncoder().encodeToString(keypair.getPublic().getEncoded());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        test t = new test();
//        String result = t.splitEqually(pri, 45);
//        result.split(" ");
        User user = new User();
        user.setId(0);
        user.setUserKey(username, password);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setCity(city);
        user.setDistric(district);
        user.setAdddressDetails(addressDetails);
        user.setPasswordMD5(password);
        userService.save(user, "customer", pub);
        req.setAttribute("register-success", "success");

        req.setAttribute("messPri", "private key : " + "\n" + pri);

        req.getRequestDispatcher("/main/register.jsp").forward(req, resp);
    }
}
