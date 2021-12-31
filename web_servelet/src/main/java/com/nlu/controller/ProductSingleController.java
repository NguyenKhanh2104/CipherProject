package com.nlu.controller;

import com.nlu.model.Product;
import com.nlu.model.ProductDetails;
import com.nlu.service.ProductDetailsService;
import com.nlu.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/products/product-single")
public class ProductSingleController extends HttpServlet {

    ProductService productService = new ProductService();
    ProductDetailsService productDetailsService = new ProductDetailsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Product product = productService.findById(Integer.parseInt(id));
        List<ProductDetails> detailsList = productDetailsService.findByProductId(Integer.parseInt(id));
        req.setAttribute("product", product);
        req.setAttribute("details", detailsList);
        req.getRequestDispatcher("/main/product-single.jsp").forward(req, resp);
    }
}
