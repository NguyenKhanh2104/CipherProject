package com.nlu.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/products/update-details")
public class UpdateProductDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String[] colors = req.getParameterValues("color");
        String[] sizes = req.getParameterValues("size");
        String[] qualities = req.getParameterValues("quality");

        for (String size :
                sizes) {
            System.out.println(size);
        }
        for (String color :
                colors) {
            System.out.println(color);
        }
        for (String quality :
                qualities) {
            System.out.println(quality);
        }

    }
}
