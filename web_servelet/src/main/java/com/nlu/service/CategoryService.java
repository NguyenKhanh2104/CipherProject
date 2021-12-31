package com.nlu.service;

import com.nlu.model.Category;
import com.nlu.repository.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.nlu.db.Datasource.*;

public class CategoryService implements Repository<Category> {
    @Override
    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM category";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                int id = rs.getInt(1);
                int num = countProductUsed(id);
                Category category = new Category(id, rs.getString(2), rs.getInt(3), rs.getDate(4), num);
                categories.add(category);
            }
            returnConnection(connection);
            return categories;
        } catch (SQLException e) {
            System.out.println(e);
            return categories;
        }
    }

    public void save(String name, int status) {
        String query = "INSERT INTO `category`( `name`, `status`) VALUES (?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, status);
            ps.executeUpdate();
            returnConnection(conn);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Category findById(Integer id) {
        String query = "SELECT * FROM `category` WHERE category_id = ? ";
        Category category = null;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int i = countProductUsed(rs.getInt(1));
                category = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), i);
            }

            returnConnection(conn);
            return category;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Category> findByName() {
        return null;
    }

    @Override
    public void deleteById(int id) {
        String query = "UPDATE `category` SET `status`=? WHERE category_id = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, 0);
            ps.setInt(2, id);
            ps.executeUpdate();
            returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(Category category) {

    }

    public int countProductUsed(int id) {
        String query = "SELECT COUNT(category_id) FROM products WHERE category_id = ?";
        try {
            int re = 0;
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                re = resultSet.getInt(1);
            }
            returnConnection(conn);
            return re;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;

    }

    public void update(String name, int status, int id) {
        String query = "UPDATE `category` SET `name`=?,`status`=? WHERE category_id = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, status);
            ps.setInt(3, id);
            ps.executeUpdate();
            returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CategoryService categoryService = new CategoryService();
       categoryService.update("hihihi",1,13);
    }
}
