package com.nlu.service;

import com.nlu.model.Cart;
import com.nlu.model.CartItem;
import com.nlu.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import static com.nlu.db.Datasource.*;

public class CartService {

    public CartItem findProductById(int id) {
        try {
            Connection conn = getConnection();
            String sql = "select p1.product_id,p1.name,p1.img,p1.price,p1.sales_percent,p2.product_details_id,p2.size from products p1 join product_details p2 on p1.product_id = p2.product_id where p2.product_details_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            CartItem cartItem = null;
            while (rs.next()) {
                cartItem = new CartItem(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getInt(6), rs.getInt(7), 1);
            }
            returnConnection(conn);
            return cartItem;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }



    public List<Cart> findAll() {
        try {
            List<Cart> carts = new ArrayList<>();
            String query = "SELECT * FROM cart";
            Connection connection = getConnection();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                Cart cart = new Cart();
                cart.setCartId(rs.getString(1));
                cart.setUsername(rs.getString(2));
                cart.setShippingAddress(rs.getString(3));
                cart.setPhone(rs.getString(4));
                cart.setEmail(rs.getString(5));
                cart.setUserId(rs.getInt(6));
                cart.setStatus(rs.getInt(7));
                cart.setTotal(rs.getDouble(8));
                cart.setOrderDate(rs.getString(9));
                cart.setCartNo(rs.getInt(10));
                cart.setCity(rs.getString(11));
                cart.setNote(rs.getString(12));
                carts.add(cart);
            }
            returnConnection(connection);
            return carts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Cart findById(String cartId) {
        try {
            String sql = "SELECT * FROM cart WHERE cart_id = ?";
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cartId);
            ResultSet rs = ps.executeQuery();
            Cart cart = null;
            while (rs.next()) {
                cart = new Cart();
                cart.setCartId(rs.getString(1));
                cart.setUsername(rs.getString(2));
                cart.setShippingAddress(rs.getString(3));
                cart.setPhone(rs.getString(4));
                cart.setEmail(rs.getString(5));
                cart.setUserId(rs.getInt(6));
                cart.setStatus(rs.getInt(7));
                cart.setTotal(rs.getDouble(8));
                cart.setOrderDate(rs.getString(9));
                cart.setCartNo(rs.getInt(10));
                cart.setCity(rs.getString(11));
                cart.setNote(rs.getString(12));
            }
            String sql2 = "SELECT  product_id,size,quality,id FROM `cart_item` WHERE order_id = ?";
            PreparedStatement ps3 = conn.prepareStatement(sql2);
            ps3.setString(1, cartId);
            ResultSet rs4 = ps3.executeQuery();
            CartItem cartItem;
            HashMap<Integer, CartItem> hashMap = new HashMap<>();
            ProductService productService = new ProductService();

            while (rs4.next()) {
                Product byId = productService.findById(rs4.getInt(1));
                cartItem = new CartItem();
                cartItem.setQuality(rs4.getInt(3));
                cartItem.setSize(rs4.getInt(2));
                cartItem.setId(rs4.getInt(4));
                cartItem.setProduct(byId);
                hashMap.put(cartItem.getId(), cartItem);
            }
            cart.cart = hashMap;
            return cart;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public void save(String fullName, String userId, String email, String phone, String city, String address, String note, Cart cart) {
        try {
            Date date = new Date();
            Connection conn = getConnection();
            String query = "INSERT INTO cart VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, String.valueOf(date.getTime()));
            ps.setString(2, fullName);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, userId);
            ps.setInt(7, 1);
            ps.setDouble(8, cart.total());
            ps.setString(9, date.toString());
            ps.setString(10, null);
            ps.setString(11, city);
            ps.setString(12, note);
            ps.executeUpdate();
            String query2 = "INSERT INTO cart_item VALUES (?,?,?,?,?,?)";
            PreparedStatement ps2 = conn.prepareStatement(query2);
            ps2.setString(1, null);
            ps2.setString(6, String.valueOf(date.getTime()));
            for (CartItem item :
                    cart.getData()) {
                ps2.setInt(2, item.getProductId());
                ps2.setInt(3, item.getProductDetailsId());
                ps2.setInt(4, item.getSize());
                ps2.setInt(5, item.getQuality());
                ps2.executeUpdate();
            }
            returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public static void main(String[] args) {
        CartService ca = new CartService();
        System.out.println(ca.findProductById(1));
//        System.out.println(ca.findProductById(1));
//        ca.save("khanh1","2","abc@gmail.com","123456","aaa","Binh Duong","mau le",));
    }
}
