package com.nlu.controller;

import com.nlu.model.Category;
import com.nlu.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/update-category")
public class UpdateCategory extends HttpServlet {

    CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Category category = categoryService.findById(Integer.parseInt(id));
        req.setAttribute("category", category);
        req.getRequestDispatcher("/admin/update-category.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String status = req.getParameter("status");
        categoryService.update(name, Integer.parseInt(status), Integer.parseInt(id));
        req.getRequestDispatcher("/admin/category.jsp").forward(req, resp);

    }
}
