package com.nlu.controller;

import com.nlu.model.*;
import com.nlu.service.OrderDetailsService;
import com.nlu.service.OrderService;
import com.nlu.service.UserService;
import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    OrderService order = new OrderService();
    OrderDetailsService orderItem = new OrderDetailsService();
    UserService userService = new UserService();

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String city = req.getParameter("city");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String note = req.getParameter("note");

        HttpSession session = req.getSession();
        Cart cart = Cart.getCart(session);
        HashMap<Integer, CartItem> cart1 = cart.getCart();
        if (cart.getData().size() > 0) {
            try {
                Date date = new Date();
                String mhd = "" + date.getTime();
                User u = new User();
                if (userService.exitsUsername(fullName)) {
                    u.setId(userService.getUserIDByName(fullName));
                } else {
                    req.setAttribute("mess1", "User không tồn tại");
                }
                Order o = new Order(mhd, address, new Timestamp(new Date().getTime()), 0, note, u, email, city, phone);
                order.save(o);
                for (Map.Entry<Integer, CartItem> ds : cart1.entrySet()) {
                    CartItem ca = new CartItem();
                    ca.setProductDetailsId(ds.getValue().getProductDetailsId());

                    orderItem.Save(new OrderDetails(0, o, ca, ds.getValue().getQuality(), ds.getValue().getPrice()));
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        cart.clear(req.getSession());
        resp.sendRedirect("/");

    }
}
