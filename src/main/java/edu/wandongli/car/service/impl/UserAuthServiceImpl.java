package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import edu.wandongli.car.dao.UserAuthDao;
import edu.wandongli.car.dao.UserDao;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.exception.ServiceException;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.pojo.UserAuth;
import edu.wandongli.car.service.UserAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.UpdatableSqlQuery;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserAuthServiceImpl implements UserAuthService {

    private UserAuthDao userAuthDao;
    @Autowired
    public void setUserAuthDao(UserAuthDao userAuthDao) {
        this.userAuthDao = userAuthDao;
    }
    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public UserAuth certification(UserAuth userAuth) {
        int result = userAuthDao.insert(userAuth);
        if (result==0){
            throw new ServiceException("添加失败");
        }
        return userAuth;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED)
    public int auth(Long id, RealEnum realEnum) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getId,id);//user表
        QueryWrapper<UserAuth> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.lambda().eq(UserAuth::getUserId,id);//auth表
        User user = new User();
        UserAuth userAuth = new UserAuth();
        if (realEnum==RealEnum.AUTH){//实名
            user.setRealName(RealEnum.NOAUTH);
            user.setId(id);
            int update1 = userDao.update(user, queryWrapper);
            if (update1==0){
                throw new SecurityException("修改失败");
            }
            userAuth.setStatus(RealEnum.NOAUTH);
            userAuth.setUserId(id);
            int update = userAuthDao.update(userAuth, queryWrapper1);
            if (update==0){
                throw new SecurityException("修改失败");
            }
            return update;
        }
        if (realEnum==RealEnum.NOAUTH){
            user.setRealName(RealEnum.AUTH);
            user.setId(id);
            int update1 = userDao.update(user, queryWrapper);
            if (update1==0){
                throw new SecurityException("修改失败");
            }
            userAuth.setStatus(RealEnum.AUTH);
            userAuth.setUserId(id);
            int update = userAuthDao.update(userAuth, queryWrapper1);
            if (update==0){
                throw new SecurityException("修改失败");
            }
            return update;
        }
        return 0;
    }

    @Override
    public UserAuth findAuthByUserId(Long id) {
        QueryWrapper<UserAuth> queryWrapperQueryWrapper = new QueryWrapper<>();
        queryWrapperQueryWrapper.lambda().eq(UserAuth::getUserId,id);
        UserAuth userAuth = userAuthDao.selectOne(queryWrapperQueryWrapper);
        return userAuth;
    }
}
