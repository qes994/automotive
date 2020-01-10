package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sun.org.apache.bcel.internal.generic.NEW;
import edu.wandongli.car.dao.AdminDao;
import edu.wandongli.car.dao.AdminRoleDao;
import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.AdminRole;
import edu.wandongli.car.pojo.Role;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.service.AdminService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminDao adminDao;
    @Autowired
    AdminRoleDao adminRoleDao;


    @Override
    public Admin findAdminByAdmin(Admin admin) {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(admin.getId()!=null,Admin::getId,admin.getId());
        Admin admin1 = adminDao.selectOne(queryWrapper);
        return admin1;
    }

    @Override
    public Admin findAdmin(Admin admin) {
        String password = admin.getPassword();
        String phone = admin.getPhone();
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Admin::getPassword,password)
                .eq(Admin::getPhone,phone);
        Admin admin1 = adminDao.selectOne(queryWrapper);
        return admin1;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED,propagation= Propagation.REQUIRED )
    public int addAdmin(Admin admin) {
         String phone = admin.getPhone();
        Long id = admin.getId();
        Long roleId = admin.getRoleId();
        /* QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
         queryWrapper.lambda().eq(Admin::getPhone,phone);*/
        adminDao.insert(admin);
        Long id1 = admin.getId();
        System.out.println("添加后的id");
        AdminRole adminRole = new AdminRole();
        adminRole.setAdminId(id1);
        adminRole.setRoleId(roleId);
        System.out.println("角色id"+roleId);
        int insert = adminRoleDao.insert(adminRole);
        if (insert==0){
            throw new SecurityException("添加失败");
        }
        return insert;
    }

    @Override
    public Admin findAdminByPhone(String phone) {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Admin::getPhone,phone);
        Admin admin = adminDao.selectOne(queryWrapper);
        return admin;
    }

    @Override
    public IPage<Admin> getList(Integer page, Integer limit, String name) {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(name!=null,Admin::getName,name);
        IPage<Admin> iPage = new Page<>(page,limit);
        IPage<Admin> info = adminDao.selectPage(iPage, queryWrapper);
        return info;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED)
    public int update(Admin admin) {
        QueryWrapper<AdminRole> queryWrapper1 = new QueryWrapper<>();
        Long id = admin.getId();
        queryWrapper1.lambda().eq(AdminRole::getId,id);
        AdminRole adminRole1 = adminRoleDao.selectOne(queryWrapper1);
        AdminRole adminRole = new AdminRole();
        adminRole1.setRoleId(admin.getRoleId());
        int result = adminRoleDao.updateById(adminRole1);
        if (result==0){
            throw new SecurityException("修改失败");
        }
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        int i = adminDao.updateById(admin);
        if (i==0){
            throw new SecurityException("修改失败");
        }
        return i;
    }

    @Override
    public int del(Long id) {
        QueryWrapper<Admin> queryWrapper=new QueryWrapper<>();
        queryWrapper.lambda().eq(Admin::getId,id);
        int delete = adminDao.delete(queryWrapper);
        if (delete==0){
            throw new SecurityException("删除失败");
        }
        return delete;
    }

    @Override
    public Admin getListByphone(String phone) {
        Admin list = adminDao.getList(phone);
        return list;
    }
}
