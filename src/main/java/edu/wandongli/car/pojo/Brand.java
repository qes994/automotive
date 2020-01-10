package edu.wandongli.car.pojo;

import edu.wandongli.car.enums.StatusEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

//品牌表
@Data
@EqualsAndHashCode
public class Brand {

    private Long id;
    private String name;
    private int priority;//优先级
    private StatusEnum status;
    private Date createTime;
    private Date updateTime;
}
