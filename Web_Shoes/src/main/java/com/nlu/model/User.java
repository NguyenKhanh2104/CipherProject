package com.nlu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private int id;
    private String key;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String city;
    private String distric;
    private String adddressDetails;
    private String role;
    private String publicKey;

    public String toMd5(String str){
        String result = "";
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(str.getBytes());
            BigInteger bigInteger = new BigInteger(1,digest.digest());
            result = bigInteger.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
       return result;
    }

    public void setPasswordMD5(String pass){
        String result = "";
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(pass.getBytes());
            BigInteger bigInteger = new BigInteger(1,digest.digest());
            result = bigInteger.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        this.password  = result;
        System.out.println(result);
    }

    public void setUserKey (String name, String password){
        String result = "";
        MessageDigest digest;
        String str = name+password;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(str.getBytes());
            BigInteger bigInteger = new BigInteger(1,digest.digest());
            result = bigInteger.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        this.key  = result;
    }

    public static void main(String[] args) {
        User u = new User();
        System.out.println(u.toMd5("npk"));
        u.setPasswordMD5("npk");
    }
}
