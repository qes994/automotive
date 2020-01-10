package edu.wandongli.car.service;

import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.pojo.UserAuth;

public interface UserAuthService {

    //添加实名认证记录等待后台审核
    UserAuth certification(UserAuth userAuth);

    //修改是否认证
    int auth(Long id, RealEnum realEnum);
    //根据id查看认证信息
    UserAuth findAuthByUserId(Long id);

}
