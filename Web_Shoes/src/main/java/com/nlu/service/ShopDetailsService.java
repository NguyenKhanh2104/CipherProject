package com.nlu.service;

import com.nlu.model.ShopDetails;
import com.nlu.model.User;
import com.nlu.repository.Repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import static com.nlu.db.Datasource.getConnection;
import static com.nlu.db.Datasource.returnConnection;

public class ShopDetailsService implements Repository<ShopDetailsService> {

    public ShopDetails find() {
        ShopDetails shopDetails = new ShopDetails();
        String query = "SELECT * FROM shop_details";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                shopDetails.setId(rs.getInt(1));
                shopDetails.setShopName(rs.getString(2));
                shopDetails.setPhone(rs.getString(3));
                shopDetails.setEmail(rs.getString(4));
                shopDetails.setAddress(rs.getString(5));
                shopDetails.setBottomDescription(rs.getString(6));
            }
            returnConnection(connection);
            return shopDetails;
        } catch (SQLException e) {
            System.out.println(e);
            return shopDetails;
        }
    }

    @Override
    public List<ShopDetailsService> findAll() throws SQLException {
        return null;
    }

    @Override
    public ShopDetailsService findById(Integer id) throws SQLException {
        return null;
    }

    @Override
    public List<ShopDetailsService> findByName() {
        return null;
    }

    @Override
    public void deleteById(int id) {
    }

    @Override
    public void add(ShopDetailsService shopDetailsService) {

    }

    public static void main(String[] args) {
        Date date = new Date();
        String mhd = "HD" + date.getTime();
        User u =  new User();
        System.out.println(u.toMd5(mhd));
    }
}
