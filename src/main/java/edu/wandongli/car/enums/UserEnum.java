package edu.wandongli.car.enums;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum UserEnum {
    SHOW(1,"正常"),HIDE(2,"冻结");
    private Integer id;
    private String name;

    @JsonValue
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

    UserEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
    public static UserEnum geStatus(Integer id){
        for (UserEnum userEnum : UserEnum.values()) {
                if(userEnum.id.equals(id)){
                    return userEnum;
                }
        }
        return null;
    }
}
