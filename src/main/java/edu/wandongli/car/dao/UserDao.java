package edu.wandongli.car.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.enums.UserEnum;
import edu.wandongli.car.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends BaseMapper<User> {

    //查出所有用户的信息
    IPage<User> getList(@Param("iPage") IPage<User> iPage, @Param("name") String name,
                        @Param("phone")String phone
    , @Param("realName") RealEnum realName);

    //根据用户id查看用户信息
    User findUserById(Long id);

}
