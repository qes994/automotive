package edu.wandongli.car.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminDao extends BaseMapper<Admin> {

    //权限管理
    Admin getList(String phone);



}
