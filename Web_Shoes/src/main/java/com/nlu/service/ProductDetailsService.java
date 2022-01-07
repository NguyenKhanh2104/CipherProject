package com.nlu.service;

import com.nlu.model.ProductDetails;
import com.nlu.repository.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.nlu.db.Datasource.*;

public class ProductDetailsService implements Repository<ProductDetails> {
    @Override
    public List<ProductDetails> findAll() {
        String query = "SELECT * FROM product_details";
        List<ProductDetails> productDetailsList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                ProductDetails details = new ProductDetails(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)
                );
                productDetailsList.add(details);
            }
            returnConnection(connection);
            return productDetailsList;

        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public List<ProductDetails> findByProductId(int productId) {
        String query = "SELECT * FROM product_details WHERE  product_id = ?";
        List<ProductDetails> productDetailsList = new ArrayList<>();
        ProductDetails details = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                details = new ProductDetails(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)
                );
                productDetailsList.add(details);
            }
            returnConnection(connection);
            return productDetailsList;

        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }

    public ProductDetails findByProductId(Integer productId) {
        String query = "SELECT * FROM product_details WHERE  product_id = ?";
        ProductDetails details = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                details = new ProductDetails(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)
                );
            }
            returnConnection(connection);
            return details;

        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }

    public HashMap<Integer, Integer> findAllSize() {
        String query = "SELECT size FROM product_details";
        List<Integer> sizes = new ArrayList<>();
        Connection connection = getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                sizes.add(rs.getInt(1));
            }
            HashMap<Integer, Integer> hashMap = new HashMap();
            for (Integer details :
                    sizes) {
                hashMap.put(details, details);
            }
            hashMap.entrySet()
                    .stream()
                    .sorted(Map.Entry.comparingByValue());
            returnConnection(connection);
            return hashMap;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public void save(int size, String color, int quality, int productId, int status) {
        String query = "INSERT INTO `product_details`( `size`, `color`, `quality`, `product_id`, `status`) VALUES (?,?,?,?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, size);
            ps.setString(2, color);
            ps.setInt(3, quality);
            ps.setInt(4, productId);
            ps.setInt(5, status);
            ps.executeUpdate();
            returnConnection(conn);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public ProductDetails findById(Integer id) throws SQLException {
        return null;
    }

    @Override
    public List<ProductDetails> findByName() {
        return null;
    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public void add(ProductDetails productDetails) {

    }

    public static void main(String[] args) {
        ProductDetailsService productDetailsService = new ProductDetailsService();
        System.out.println(productDetailsService.findAllSize());


    }
}
