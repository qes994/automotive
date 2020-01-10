package edu.wandongli.car.enums;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum RealEnum {
    AUTH(1,"已实名"),NOAUTH(2,"未认证"),NOTFILED(3,"未提交");
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




    RealEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
    public static RealEnum getReal(Integer id){
        for (RealEnum realEnum : RealEnum.values()) {
                if(realEnum.id.equals(id)){
                    return realEnum;
                }
        }
        return null;
    }
}
