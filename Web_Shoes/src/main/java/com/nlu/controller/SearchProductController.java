package com.nlu.controller;

import com.nlu.model.Product;
import com.nlu.service.ProductService;
import com.nlu.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchProductController", value = "/searchProduct")
public class SearchProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearchProduct = request.getParameter("txt");
        ProductService prS = new ProductService();
        if(!txtSearchProduct.isEmpty()){
            List<Product> list = prS.searchByName(txtSearchProduct);
            request.setAttribute("txtS",txtSearchProduct);
            request.setAttribute("products",list);
            request.getRequestDispatcher("/main/product.jsp").forward(request,response);
        }
    }
}
