package com.nlu.controller;

import com.nlu.model.User;
import com.nlu.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/users")
public class ViewUserController extends HttpServlet {
    UserService us = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/edit":
                break;
            case "/delete":
                break;
            case "/update":
                try {
                    updateUser(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void listUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> u = us.findAll();
//        String idTf = req.getParameter("idTf");
//        User detailUser = us.getUserById(Integer.parseInt(idTf));
//        HttpSession session2 = req.getSession();
//        session2.setAttribute("listU", u);
        req.setAttribute("listU",u);
    //       if(detailUser!=null){
    //           req.setAttribute("listU",detailUser);
    //           System.out.println(detailUser);
    //       }
        req.getRequestDispatcher("/admin/users.jsp").forward(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        String uKey = req.getParameter("uKey");
        String uName = req.getParameter("uName");
        String password = req.getParameter("pwd");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");
        String district = req.getParameter("dist");
        String add_de = req.getParameter("add_de");
        String role = req.getParameter("role");
        String pubKey = req.getParameter("pubKey");
        User u = new User(id, uKey, uName, password, email, phone, city, district, add_de, role, pubKey);
        us.updateUser(u);
        resp.sendRedirect("/admin/users.jsp");


    }
    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        us.deleteUser(id);
        resp.sendRedirect("/admin/users.jsp");
    }
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        User exitingUser = us.getUserById(id);
        req.getRequestDispatcher("/admin/users-seting.jsp").forward(req, resp);
        req.setAttribute("user",exitingUser);
    }
}
