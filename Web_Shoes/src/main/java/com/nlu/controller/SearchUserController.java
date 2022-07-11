package com.nlu.controller;

import com.nlu.model.User;
import com.nlu.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchUserController", value = "/admin/SearchUser")
public class SearchUserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearchUser = request.getParameter("txtUser");
        UserService uS = new UserService();
        if(!txtSearchUser.isEmpty()){
            List<User> users = uS.searchByUserName(txtSearchUser);
            request.setAttribute("listU",users);
            request.setAttribute("txtUser",txtSearchUser);
            request.getRequestDispatcher("/admin/users.jsp").forward(request,response);

        }
    }
}
