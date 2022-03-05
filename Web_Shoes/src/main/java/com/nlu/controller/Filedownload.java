package com.nlu.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Filedownload", value = "/main/Filedownload")
public class Filedownload extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("filename");
            String path = getServletContext().getRealPath("/" + "file" + File.separator + name);
            response.setContentType("APPLICATION/OCTET-STREAM");
            //force to download
            String hkey = "Content-Sisposition";
//            response.setHeader(hkey,"attachment; filename=\""+dwFile.getName()+"\"");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");
            File file;
            FileInputStream ins = new FileInputStream(path);
            //byte[] buffer = new byte[ins.available()];
            int i;
            while ((i = ins.read()) != -1) {
                out.write(i);
            }
            ins.close();
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
