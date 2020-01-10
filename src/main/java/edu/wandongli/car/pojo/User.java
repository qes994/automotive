package edu.wandongli.car.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.enums.StatusEnum;
import edu.wandongli.car.enums.UserEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@JsonIgnoreProperties(value = { "handler" })
@Data
@EqualsAndHashCode
public class User {
    private Long id;
    private String name;
    private String password;
    private RealEnum realName;//实名,未实名
    private UserEnum status;//正常,冻结
    private String sex;
    private int age;
    private String phone;
    private Date createTime;
    private Date updateTime;
    private String head;
    @TableField(exist = false)
    private UserAuth userAuth;
    @TableField(exist = false)
    private List<Issue> issues;

}
