package com.nlu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetails {

    private Integer orderDetailsId;
    private Integer productDetailsId;
    private Integer orderId;
    private Integer quality;

}
