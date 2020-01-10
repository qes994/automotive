package edu.wandongli.car.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.Role;
import edu.wandongli.car.pojo.User;

import java.util.List;

public interface AdminService {

    //根据实体类查询
    Admin findAdminByAdmin(Admin admin);


    //根据手机号和密码
    Admin findAdmin(Admin admin);

    int addAdmin(Admin admin);

    Admin findAdminByPhone(String phone);

    //查看所有管理员并分页
    IPage<Admin> getList(Integer page,Integer limit,String name);

    //修改
    int update(Admin admin);

    //删除管理员信息
    int del(Long id);

    //权限
    Admin getListByphone(String phone);

}
