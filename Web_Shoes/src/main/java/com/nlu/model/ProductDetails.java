package com.nlu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDetails implements Comparable<ProductDetails> {

    private Integer productDetailsId;
    private Integer size;
    private String color;
    private Integer quality;
    private Integer productId;
    private Integer status;


    @Override
    public int compareTo(ProductDetails o) {
        return this.size - o.size;
    }

}
