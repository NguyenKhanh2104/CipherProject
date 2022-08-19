package com.nlu.controller;

import com.nlu.model.Order;
import com.nlu.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
                try {
                    showEditForm(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/delete":
                break;
            case "/update":
                try {
                    updateOrder(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ParseException e) {
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

        private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        Order existingDetail = os.getOrderById(id);
        System.err.println("ahahahahah");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/order-detail.jsp");
        System.err.println("hiihijihihihihih");
        request.setAttribute("orderDetail", existingDetail);
        dispatcher.forward(request, response);

    }
    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        String orderId = request.getParameter("id");
        String address = request.getParameter("address");
        SimpleDateFormat formatter6=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
        String date = request.getParameter("date");
        Timestamp dateTime= (Timestamp) formatter6.parse(date);
        int status = Integer.parseInt(request.getParameter("status"));
        String note = request.getParameter("note");
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String sign = request.getParameter("sign");
        String dataSign = request.getParameter("dataSign");
//        Order o = new Order(orderId, address, dateTime, status,note,user_id,email,city,phone,sign,dataSign);
//        os.updateStatusOrder(o);
        response.sendRedirect("/admin/orders.jsp");
    }

}
