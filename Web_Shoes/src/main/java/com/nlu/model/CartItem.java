package com.nlu.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {

    private int id;
    private Integer productId;
    private String name;
    private String img;
    private Double price;
    private Double salesPercent;
    private Integer productDetailsId;
    private int size;
    private int quality;
    private Product product;

    public CartItem(int size, int quality, Product product) {
        this.size = size;
        this.quality = quality;
        this.product = product;
    }

    public CartItem(Integer productId, String name, String img, Double price, Double salesPercent, Integer productDetailsId, int size, int quality) {
        this.productId = productId;
        this.name = name;
        this.img = img;
        this.price = price;
        this.salesPercent = salesPercent;
        this.productDetailsId = productDetailsId;
        this.size = size;
        this.quality = quality;
    }
}
