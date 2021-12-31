package com.nlu.service;

import com.nlu.repository.Repository;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

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
}
