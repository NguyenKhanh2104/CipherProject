package com.nlu.model;

import com.nlu.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

    private int productId;
    private String name;
    private int status;
    private String description;
    private String img;
    private int categoryId;
    private int price;
    private int discount;
    private Date modifyDate;

    public Product(int productId, String name, int status, String description, String img, int categoryId, int price, int discount,Date modifyDate) {
        this.productId = productId;
        this.name = name;
        this.status = status;
        this.description = description;
        this.img = img;
        this.categoryId = categoryId;
        this.price = price;
        this.discount = discount;
        this.modifyDate = modifyDate;
    }

    List<ProductDetails> productDetails = new ArrayList<>();
    List<Integer> tagIds = new ArrayList<>();



    public int getTagId(int index){
        if (index >= tagIds.size()){
            return -1;
        }
        return  tagIds.get(index);
    }

    public boolean containsId(int tagId){
        boolean contains = tagIds.contains(tagId);
        return contains;
    }

    public static void main(String[] args) {
        ProductService productService = new ProductService();
        Product byId = productService.findById(2);
//        System.out.println(byId.getTagIds().toString());
        Integer integer = byId.getTagIds().size();

        System.out.println(integer);
    }

    
}
