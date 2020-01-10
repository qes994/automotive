package edu.wandongli.car.enums;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum StatusEnum {
    SHOW(1,"显示"),HIDE(2,"隐藏");
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

    StatusEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static StatusEnum geStatus(Integer id){
        for (StatusEnum status : StatusEnum.values()) {
                if(status.id.equals(id)){
                    return status;
                }
        }
        return null;
    }
}
