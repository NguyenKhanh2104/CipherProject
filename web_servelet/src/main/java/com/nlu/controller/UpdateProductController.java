package com.nlu.controller;

import com.nlu.model.Product;
import com.nlu.service.ProductDetailsService;
import com.nlu.service.ProductService;
import com.nlu.service.SaveImageUtil;
import lombok.SneakyThrows;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/products/update")
public class UpdateProductController extends HttpServlet {
    ProductService productService = new ProductService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        Product product = productService.findById(Integer.valueOf(productId));
        req.setAttribute("product", product);
        req.getRequestDispatcher("/admin/update-product.jsp").forward(req, resp);
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletContext servletContext = this.getServletConfig().getServletContext();
        String productId = req.getParameter("productId");
        ProductService productService = new ProductService();
        Product product = productService.findById(Integer.parseInt(productId));
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);
        ProductDetailsService productDetailsService = new ProductDetailsService();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(req);
        Iterator<FileItem> iter = items.iterator();
        Product productUpdate = new Product();
        int size = 21;
        int quality = 1;
        String color = "";
        List<Integer> tagIds = new ArrayList<>();
        while (iter.hasNext()) {
            FileItem item = iter.next();
            if (item.isFormField()) {
                String name = item.getFieldName();
                String value = item.getString();
                switch (name) {
                    case "product_name": {
                        productUpdate.setName(value);
                        break;
                    }
                    case "product_price": {
                        productUpdate.setPrice(Integer.valueOf(value));
                        break;

                    }
                    case "product_description": {
                        productUpdate.setDescription(value);
                        break;

                    }
                    case "category": {
                        productUpdate.setCategoryId(Integer.valueOf(value));
                        break;

                    }
                    case "tag": {
                        tagIds.add(Integer.parseInt(value));
                        break;

                    }
                }
            } else {
                String fileName = item.getName();
                productUpdate.setImg("/images/" + fileName);
                InputStream is = item.getInputStream();
                SaveImageUtil.write(is, fileName);
            }
            for (Integer tagId :
                    tagIds) {
                productService.addTag(Integer.parseInt(productId), tagId);
            }

            productUpdate.setStatus(1);
            productUpdate.setProductId(Integer.parseInt(productId));
            productService.updateProduct(productUpdate);
        }
        req.getRequestDispatcher("/admin/update-product.jsp").forward(req, resp);

    }

}
