package edu.wandongli.car.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.enums.UserAuthEnum;
import edu.wandongli.car.enums.UserEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
@JsonIgnoreProperties(value = { "handler" })
@Data
@EqualsAndHashCode
public class UserAuth {
    private Long id;
    private Long userId;
    private String name;
    private String frontImage;//正面照片
    private String backImage;//反面照片
    private RealEnum status;//是否认证
    private Date createTime;
    private  Date updateTime;
    private String idCard;
    @TableField(exist = false)
    private User user;
}
