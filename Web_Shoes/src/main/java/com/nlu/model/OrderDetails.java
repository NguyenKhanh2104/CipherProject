package com.nlu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetails {

    private Integer orderDetailsId;
    private Order order;
    private CartItem cartItem;
    private Integer quality;
    private Double total_price;

}
