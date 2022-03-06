package com.nlu.service;

import com.nlu.algorithms.algorithms.Hash;
import com.nlu.model.Order;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.nlu.db.Datasource.getConnection;

public class SignService {
    Hash hashText = new Hash();

    public void updateSign(String idOrder, String signText) {
        Connection conn = getConnection();
        String query = "UPDATE `order` SET sign =  ?  where order_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, signText);
            ps.setString(2, idOrder);
            ps.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String hashIDOrder(String text) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String result = null;
        result = hashText.bytesToHex(Hash.hash(text, "SHA-1"));
        return result;
    }

    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        SignService si = new SignService();
        String idOrder = "HD1646554077963";
        String userKey = "fa7f08233358e9b466effa1328168527";
        System.out.println(si.hashIDOrder(idOrder+userKey));
    }
}
