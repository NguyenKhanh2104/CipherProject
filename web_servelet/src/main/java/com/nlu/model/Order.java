package com.nlu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    private Integer orderId;
    private String orderCode;
    private Date date;
    private Integer status;
    private String note;
    private String shippingPrice;
    private double total;
    private Integer userId;




}
