package com.nlu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {

    private Integer id;
    private String name;
    private Integer status;
    private Date dateModify;
    private int countProductUsed;
}
