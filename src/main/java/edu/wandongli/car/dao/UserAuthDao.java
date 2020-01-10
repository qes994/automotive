package edu.wandongli.car.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.car.pojo.UserAuth;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserAuthDao extends BaseMapper<UserAuth> {

    //根据用户id查询信息
    UserAuth findAuthByUserId(Long id);

}
