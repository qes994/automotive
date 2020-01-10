package edu.wandongli.car.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.util.List;

@Data
public class RolePermission {

    private Long id;
    private Long roleId;
    private Long permissionId;
    @TableField
    private List<Role> roles;
    @TableField
    private List<Permission> permissions;

}
