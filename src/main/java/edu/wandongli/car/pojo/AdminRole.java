package edu.wandongli.car.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.util.List;

@Data
public class AdminRole {

    private Long id;
    private Long adminId;
    private Long roleId;
    @TableField(exist = false)
    private List<Admin> admins;
    @TableField(exist = false)
    private List<Role> roles;


}
