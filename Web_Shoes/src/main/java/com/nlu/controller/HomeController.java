package com.nlu.controller;

import com.nlu.model.Category;
import com.nlu.model.Product;
import com.nlu.model.ShopDetails;
import com.nlu.model.Tag;
import com.nlu.service.CategoryService;
import com.nlu.service.ProductService;
import com.nlu.service.ShopDetailsService;
import com.nlu.service.TagService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("")
public class HomeController extends HttpServlet {

    ProductService productService = new ProductService();
    CategoryService categoryService = new CategoryService();
    TagService tagService = new TagService();
    ShopDetailsService shopDetailsService = new ShopDetailsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAll();
        List<Category> categories = categoryService.findAll();
        List<Tag> tags = tagService.findAll();
        ShopDetails shopDetails = shopDetailsService.find();
        HttpSession session = req.getSession();
        session.setAttribute("products", products);
        session.setAttribute("categories", categories);
        session.setAttribute("tags", tags);
        session.setAttribute("shopDetails", shopDetails);
        req.getRequestDispatcher("index.jsp").forward(req, resp);

    }
}
