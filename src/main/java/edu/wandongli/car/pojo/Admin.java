package edu.wandongli.car.pojo;


import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode
public class Admin {

    private Long id;
    @NotBlank(message = "手机号不能为空")
    @NotNull(message = "手机号不能为空")
    private String phone;
    private String head;
    @NotBlank(message = "姓名不能为空")
    @NotNull(message = "姓名不能为空")
    private String name;
    @NotBlank(message = "密码不能为空")
    @NotNull(message = "密码不能为空")
    private String password;
   // private int permission;//1普通管理员 2超级管理员
    private Date createTime;
    private Date updateTime;
    @TableField(exist = false)
    private List<Permission> permission;
    @TableField(exist = false)
    private  List<Role> role;
    @TableField(exist = false)
    private Long roleId;
}
