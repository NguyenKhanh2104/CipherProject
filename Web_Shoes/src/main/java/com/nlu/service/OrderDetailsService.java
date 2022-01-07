package com.nlu.service;

import com.nlu.model.OrderDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.nlu.db.Datasource.getConnection;

public class OrderDetailsService {
    public void Save(OrderDetails orderDetails){
        Connection conn = getConnection();
        String query = "INSERT INTO `order_item` VALUES (?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, orderDetails.getOrderDetailsId());
            ps.setString(2, orderDetails.getOrder().getOrderId());
            ps.setInt(3, orderDetails.getCartItem().getProductDetailsId());
            ps.setInt(4, orderDetails.getQuality());
            ps.setDouble(5,orderDetails.getTotal_price());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
