package com.nlu.controller;

import com.nlu.model.Order;
import com.nlu.service.SignService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignController", value = "/main/SignController")
public class SignController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        SignService si = new SignService();
        String text = request.getParameter("signText");
        si.updateSign(text);
        request.getRequestDispatcher("/").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
