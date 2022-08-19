package com.nlu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    private String orderId;
    private String address;
    private Timestamp date;
    private Integer status;
    private String note;
    private int user_id;
    private String email;
    private String city;
    private String phone;
    private String sign;
    private String dataSign;

    public Order(String orderId, Integer status) {
        this.orderId = orderId;
        this.status = status;
    }
}
