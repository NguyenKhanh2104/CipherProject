package com.nlu.service;

import com.nlu.model.Order;
import com.nlu.repository.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import static com.nlu.db.Datasource.getConnection;

public class OrderService implements Repository<OrderService> {

    @Override
    public Collection<OrderService> findAll() throws SQLException {
        return null;
    }

    @Override
    public OrderService findById(Integer id) throws SQLException {
        return null;
    }

    @Override
    public List<OrderService> findByName() {
        return null;
    }

    @Override
    public void deleteById(int id){
    }

    @Override
    public void add(OrderService orderService) {

    }
    public void save(Order order){
        Connection conn = getConnection();
        String query = "INSERT INTO `order` VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, order.getOrderId());
            ps.setString(2, order.getAddress());
            ps.setTimestamp(3, order.getDate());
            ps.setInt(4, order.getStatus());
            ps.setString(5, order.getNote());
            ps.setInt(6,order.getUser().getId());
            ps.setString(7,order.getEmail());
            ps.setString(8,order.getCity());
            ps.setString(9,order.getPhone());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
