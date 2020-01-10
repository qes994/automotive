package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import edu.wandongli.car.dao.ArcticDao;
import edu.wandongli.car.dao.BrandDao;
import edu.wandongli.car.pojo.Arctic;
import edu.wandongli.car.pojo.Brand;
import edu.wandongli.car.service.ArcticService;
import edu.wandongli.car.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArcticServiceImpl implements ArcticService {

    @Autowired
    ArcticDao arcticDao;

    @Override
    public List<Arctic> getList() {
        QueryWrapper<Arctic> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Arctic::getStatus,1);
        List<Arctic> arctics = arcticDao.selectList(queryWrapper);
        return arctics;
    }
}
