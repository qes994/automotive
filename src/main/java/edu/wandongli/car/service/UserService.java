package edu.wandongli.car.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.pojo.User;

import java.util.List;

public interface UserService {

    //根据手机号注册
    User register(String phone);
    //根据手机号登录
    User login(String phone);
    //修改用户
    int UpdateUser(User user);
    //根据用户id获取用户信息
    User findUserById(Long id);

    List<User> users();

    //查出所有用户的信息
    IPage<User> getList(Integer page , Integer limit, String name
    , String phone, RealEnum realEnum);
    //删除用户
    int del(Long id);

    //修改状态
    int edit(User user);

}
