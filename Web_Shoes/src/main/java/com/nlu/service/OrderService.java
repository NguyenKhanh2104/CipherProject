package com.nlu.service;

import com.nlu.model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.nlu.db.Datasource.getConnection;
import static com.nlu.db.Datasource.returnConnection;

public class OrderService {
    public List<Order> findAll() {
        System.err.println("kkkkkkkkkkkkkkkk");
        List<Order> order = new ArrayList<>();
        String query = "SELECT * FROM `order` ORDER BY order_id DESC ";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Order o = new Order(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getTimestamp(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
                order.add(o);
            }

            returnConnection(connection);
            System.out.println("ok");
            return order;
        } catch (SQLException e) {
            System.out.println(e);
            return order;
        }

    }

    public Order getOrderById(String orderId) {
        Connection conn = getConnection();
        String query = "SELECT * FROM `order` WHERE order_id= ?";
        Order o = new Order();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order(rs.getString(1), rs.getString(2), rs.getTimestamp(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
            }
            return o;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public void save(Order order) {
        Connection conn = getConnection();
        String query = "INSERT INTO `order` VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, order.getOrderId());
            ps.setString(2, order.getAddress());
            ps.setTimestamp(3, order.getDate());
            ps.setInt(4, order.getStatus());
            ps.setString(5, order.getNote());
            ps.setInt(6, order.getUser_id());
            ps.setString(7, order.getEmail());
            ps.setString(8, order.getCity());
            ps.setString(9, order.getPhone());
            ps.setString(10, order.getSign());
            ps.setString(11, order.getDataSign());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStatusOrder(Order order) {

        String query = "update `order` set status =? where order_id = ?;";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, order.getStatus());
            ps.setString(2, order.getOrderId());
             ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public static void main(String[] args) {
        OrderService os = new OrderService();
        System.out.println(os.getOrderById("HD1657809575373"));
    }


}
