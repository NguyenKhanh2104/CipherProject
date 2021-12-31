package com.nlu.controller;

import com.nlu.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/add-category")
public class AddCategoryController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("category_name");
        categoryService.save(name, 1);

        req.getRequestDispatcher("/admin/category.jsp").forward(req, resp);
    }
}
