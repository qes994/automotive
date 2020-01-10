package edu.wandongli.car.pojo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode
public class Money {

    private Long id;
    private int ceilingPrice;
    private int floorPrice;
    private Date createTime;
    private Date updateTime;


}
