package com.nlu.service;

import com.nlu.model.Tag;
import com.nlu.repository.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.nlu.db.Datasource.*;

public class TagService implements Repository<Tag> {


    @Override
    public List<Tag> findAll() {
        List<Tag> tags = new ArrayList<>();
        String query = "SELECT * FROM tag";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Tag tag = new Tag(rs.getInt(1), rs.getString(2), rs.getInt(3));
                tags.add(tag);
            }
            returnConnection(connection);
            return tags;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Integer> findTagIdsByProductId(int productId) {
        String query = "SELECT tag_id from product_tag WHERE product_id = ?";
        List<Integer> integers = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                integers.add(rs.getInt(1));
            }
            returnConnection(conn);
            return integers;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return integers;
    }

    @Override
    public Tag findById(Integer id) throws SQLException {
        return null;
    }

    @Override
    public List<Tag> findByName() {
        return null;
    }

    @Override
    public void deleteById(int id) {
    }

    @Override
    public void add(Tag tag) {

    }

    public static void main(String[] args) {
        System.out.println(new TagService().findAll().toString());
    }
}
