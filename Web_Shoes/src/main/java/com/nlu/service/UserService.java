package com.nlu.service;

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
            int userid;
            while (rs.next()) {
                userid = rs.getInt(1);
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

    public User getUser(String username, String password) {
        Connection conn = getConnection();
        String query = "SELECT * FROM user WHERE username= ? AND password=?";
        User user = new User();
        String result = user.toMd5(password);
        System.out.println(result);
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

    public static void main(String[] args) {
        UserService userService = new UserService();
//       System.out.println(userService.getUserIDByName("khanh"));
//       System.out.println(userService.getUser("npk","npk"));
        List<User> li = userService.findAll();
        for (User u: li
             ) {
            System.out.println(u);
        }

//        userService.save(new User(3,"key","khanh","password","1813000@gmail.com","0869104353","dn","dn","addresss",""),"customer");
    }
}
