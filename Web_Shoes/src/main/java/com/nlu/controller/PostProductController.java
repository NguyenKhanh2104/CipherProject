package com.nlu.controller;

import com.nlu.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/products/post")
public class PostProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        ProductService productService = new ProductService();
        productService.updateStatus(Integer.parseInt(productId), 1);
        req.setAttribute("message","Da Hoan Tac");
        req.removeAttribute("mess");
        req.getRequestDispatcher("/admin/products.jsp").forward(req,resp);


    }
}
