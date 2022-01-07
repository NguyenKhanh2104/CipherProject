package com.nlu.controller;

import com.nlu.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/products/update-status")
public class UpdateProductStatus extends HttpServlet {

    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status = req.getParameter("status");
        if (Integer.parseInt(status) == 1){
            String productId = req.getParameter("productId");
            String name = req.getParameter("productName");
            int success = productService.updateStatus(Integer.parseInt(productId), 1);
            if (success == 1) {
                req.setAttribute("mess", "Sản phẩm " + name + " vừa được đăng");
            }
            req.setAttribute("productName", name);
            req.setAttribute("productId", productId);
            req.getRequestDispatcher("/admin/products.jsp").forward(req, resp);
            return;
        }
        if (Integer.parseInt(status) == 2){
            String productId = req.getParameter("productId");
            String name = req.getParameter("productName");
            int success = productService.updateStatus(Integer.  parseInt(productId), 2);
            if (success == 1) {
                req.setAttribute("mess", "Sản phẩm " + name + " đã được gỡ");
            }
            req.setAttribute("productName", name);
            req.setAttribute("productId", productId);
            req.getRequestDispatcher("/admin/products.jsp").forward(req, resp);
            return;
        }


        if (Integer.parseInt(status) == 3){
            String productId = req.getParameter("productId");
            String name = req.getParameter("productName");
            int success = productService.updateStatus(Integer.parseInt(productId), 3);
            if (success == 1) {
                req.setAttribute("mess", "Sản phẩm " + name + " vừa được chuyển vào thùng rác");
            } else {
                req.setAttribute("mess", "Khong thế chuyển vào thùng rác");
            }
            req.setAttribute("productName", name);
            req.setAttribute("productId", productId);
            req.getRequestDispatcher("/admin/products.jsp").forward(req, resp);
            return;
        }

    }
}
