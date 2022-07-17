package com.nlu.service;

import com.nlu.model.Order;
import com.nlu.model.Product;
import com.nlu.model.ProductDetails;
import com.nlu.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.nlu.db.Datasource.getConnection;
import static com.nlu.db.Datasource.returnConnection;

public class UserService {

    public List<User> findAll() {
        List<User> user = new ArrayList<>();
        String query = "SELECT * FROM user ORDER BY user_id DESC";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                User u = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
                user.add(u);
            }

            returnConnection(connection);
            return user;
        } catch (SQLException e) {
            System.out.println(e);
            return user;
        }

    }
    public List<User> searchByUserName(String userName) {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM user WHERE username LIKE ?" ;
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, "%"+userName+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                users.add( new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;

    }

    public User getUser(String username, String password) {
        Connection conn = getConnection();
        String query = "SELECT * FROM user WHERE username= ? AND password=?";
        User user = new User();
        String result = user.toMd5(password);
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, result);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 user = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
            }
            return user;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public User getUserById(int userId) {
        Connection conn = getConnection();
        String query = "SELECT * FROM user WHERE user_id= ?";
        User user = new User();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11));
            }
            return user;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
        public boolean updateUser(User user) throws SQLException {
            boolean rowUpdate = true;
            Connection conn = getConnection();
            String query = "UPDATE `products` SET `user_key`=?,`username`=?,`password`=?,`email`=?,`phone`=?,`city`=?,`district`=?,`address_details`=?,`Role`=?,`PublicKey`=? WHERE `user_id`=?";
            try {
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, user.getKey());
                ps.setString(2, user.getUsername());
                ps.setString(3, user.getPassword());
                ps.setString(4, user.getEmail());
                ps.setString(5, user.getPhone());
                ps.setString(6, user.getCity());
                ps.setString(7, user.getDistric());
                ps.setString(8, user.getAdddressDetails());
                ps.setString(9, user.getRole());
                ps.setString(10, user.getPublicKey());
                ps.setInt(11, user.getId());
                rowUpdate = ps.executeUpdate() > 0;
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return rowUpdate;
        }
    public boolean deleteUser(int id) throws SQLException {
        boolean rowUpdate = true;
        Connection conn = getConnection();
        String query = "DELETE FROM user WHERE `user_id`=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1,id);
            rowUpdate = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }
    public void save(User user, String role,String publicKey) {
        Connection conn = getConnection();
        String query = "INSERT INTO `user`( `user_key`, `username`, `password`, `email`, `phone`, `city`, `district`, `address_details`, `role`,`publicKey`) VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getKey());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getCity());
            ps.setString(7, user.getDistric());
            ps.setString(8, user.getAdddressDetails());
            ps.setString(9, role);
            ps.setString(10, publicKey);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public int getUserIDByName(String username) {
        Connection conn = getConnection();
        String query = "SELECT * FROM user WHERE username= ?";
        User user = new User();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );
            }
            return user.getId();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public String getUserkeyByName(String username) {
        Connection conn = getConnection();
        String query = "SELECT * FROM user WHERE username= ?";
        User user = new User();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );
            }
            return user.getKey();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public boolean exitsUsername(String userName) {
        Connection conn = getConnection();
        String query = "SELECT username from user WHERE username=?";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            String username = "";
            while (rs.next()) {
                username = rs.getString(1);
            }
            if (username.equals(userName)) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean exitsEmail(String email) {
        Connection conn = getConnection();
        String query = "SELECT email from user WHERE email=?";
        String result = "";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result = rs.getString(1);
            }
            if (email.equals(result)) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        UserService userService = new UserService();
        List<User> us = userService.findAll();

        for (User o: us
        ) {
            System.out.println(o);
        }
    }
}
