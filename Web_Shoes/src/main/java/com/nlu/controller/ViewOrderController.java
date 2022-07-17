package com.nlu.controller;

import com.nlu.model.Order;
import com.nlu.model.User;
import com.nlu.service.OrderService;
import com.nlu.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/orders")
public class ViewOrderController extends HttpServlet {
    OrderService os = new OrderService();

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
                    updateOrder(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                listOrder(request, response);
                break;
        }
    }

    private void listOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> o = os.findAll();
//        String idTf = req.getParameter("idTf");
//        User detailUser = us.getUserById(Integer.parseInt(idTf));
//        HttpSession session2 = req.getSession();
//        session2.setAttribute("listU", u);
        req.setAttribute("listO",o);
        //       if(detailUser!=null){
        //           req.setAttribute("listU",detailUser);
        //           System.out.println(detailUser);
        //       }
        req.getRequestDispatcher("/admin/orders.jsp").forward(req, resp);
    }

    private void updateOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {



    }

}
