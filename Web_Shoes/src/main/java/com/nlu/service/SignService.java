package com.nlu.service;

import com.nlu.algorithms.algorithms.Hash;
import com.nlu.model.Order;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.nlu.db.Datasource.getConnection;
import static com.nlu.db.Datasource.returnConnection;

public class SignService {
    Hash hashText = new Hash();
    OrderService ors = new OrderService();


    public void updateSign( String signText) {
        Connection conn = getConnection();
        String query = "UPDATE `order` SET sign =  ?  WHERE order_id =?";
        Order or = findLastOrder();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, signText);
            ps.setString(2, or.getOrderId());
            ps.executeUpdate();
            System.out.println(or);
            System.out.println("cau query ok");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Order findLastOrder() {
        try {
            List<Order> ors = new ArrayList<>();
            String query = "SELECT * FROM `order`";
            Connection connection = getConnection();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getString(1));
                o.setAddress(rs.getString(2));
                o.setDate(rs.getTimestamp(3));
                o.setStatus(rs.getInt(4));
                o.setNote(rs.getString(5));
                o.setUser_id(rs.getInt(6));
                o.setEmail(rs.getString(7));
                o.setCity(rs.getString(8));
                o.setPhone(rs.getString(9));
                o.setSign(rs.getString(10));
                o.setDataSign(rs.getString(11));
                ors.add(o);
            }
            returnConnection(connection);
            return ors.get(ors.size() - 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public Order getOrderByIDOrder(String idOrder) {
        Connection conn = getConnection();
        String query = "SELECT * FROM `order` WHERE order_id=?";
        Order order = new Order();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idOrder);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getString(1), rs.getString(2), rs.getTimestamp(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
            }
            return order;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public String hashDataSign(String text) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String result = null;
        result = hashText.bytesToHex(Hash.hash(text, "SHA-1"));
        return result;
    }

    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        SignService si  =new SignService();
//        System.out.println(si.findLastOrder());
        si.updateSign("kkk");
    }
}
