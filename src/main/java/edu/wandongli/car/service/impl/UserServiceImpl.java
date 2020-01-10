package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.car.dao.UserDao;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.enums.UserEnum;
import edu.wandongli.car.exception.ServiceException;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Service
@Slf4j
public class UserServiceImpl implements UserService {


    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User register(String phone) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getPhone,phone);
        User has = userDao.selectOne(queryWrapper);
        if (has!=null){
            throw new ServiceException("该手机号已被注册");
        }
        User user = new User();
        user.setPhone(phone);
        int result = userDao.insert(user);
        if (result==0){
            throw new ServiceException("注册失败,请重试");
        }
        return user;
    }

    @Override
    public User login(String phone) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getPhone,phone);
        User has = userDao.selectOne(queryWrapper);
        if (has==null){
            throw  new ServiceException("手机号错误");
        }
        return has;
    }

    @Override
    public int UpdateUser(User user) {
        int result = userDao.updateById(user);
        if (result==0){
            throw new ServiceException("更新失败! ");
        }
        return result;
    }

    @Override
    public User findUserById(Long id) {
        QueryWrapper<User> queryWrapper= new QueryWrapper<User>();
        queryWrapper.lambda().eq(User::getId,id);
        User user = userDao.selectOne(queryWrapper);
        return user;
    }

    @Override
    public List<User> users() {
        return null;
    }

    @Override
    public IPage<User> getList(Integer page , Integer limit, String name
            , String phone, RealEnum realEnum) {
        IPage<User> iPage = new Page<>(1,10);
        IPage<User> list = userDao.getList(iPage,name,phone,realEnum);
        return list;
    }

    @Override
    public int del(Long id) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getId,id);
        int delete = userDao.delete(queryWrapper);
        if (delete==0){
            throw  new SecurityException("删除失败");
        }
        return delete;
    }

    @Override
    public int edit(User user) {
        RealEnum realName = user.getRealName();
        UserEnum status = user.getStatus();
        Long id = user.getId();
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getId,id);
        int update = userDao.update(user, queryWrapper);
        if (update==0){
            throw new SecurityException("修改失败")
        ;}
        return update;
    }


}
