package com.nlu.controller;

import com.nlu.model.Product;
import com.nlu.service.ProductDetailsService;
import com.nlu.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {


    ProductService productService = new ProductService();
    ProductDetailsService productDetailsService = new ProductDetailsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products;
        int itemPerPage = 12;

        String category = req.getParameter("category");
        int currentPage = Integer.parseInt(req.getParameter("pages"));
        products = productService.findAll(currentPage, itemPerPage, category);

        int productQuality = productService.countProductInCategory(category);
        int pagesCount = productQuality / itemPerPage;
        if (productQuality % itemPerPage > 0) {
            pagesCount++;
        }

        HashMap<Integer, Integer> sizes = productDetailsService.findAllSize();
        req.setAttribute("currentCategory", req.getParameter("category"));
        req.setAttribute("sizes", sizes.values());
        req.setAttribute("products", products);
        req.setAttribute("pagesCount", pagesCount);
        req.setAttribute("currentPage",req.getParameter("pages"));
        req.getRequestDispatcher("/main/product.jsp").forward(req, resp);

    }


}
