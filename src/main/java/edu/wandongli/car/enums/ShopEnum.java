package edu.wandongli.car.enums;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ShopEnum {
    SELL(1,"售卖"),BUY(2,"求购");
    private Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    ShopEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
    public static ShopEnum geStatus(Integer id){
        for (ShopEnum Shop : ShopEnum.values()) {
                if(Shop.id.equals(id)){
                    return Shop;
                }
        }
        return null;
    }
}
