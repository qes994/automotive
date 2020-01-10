package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import edu.wandongli.car.dao.BrandDao;
import edu.wandongli.car.pojo.Brand;
import edu.wandongli.car.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BrandServiceImpl implements BrandService {

    private BrandDao brandDao;
    @Autowired
    public void setBrandDao(BrandDao brandDao) {
        this.brandDao = brandDao;
    }

    @Override
    public List<Brand> getBrands() {
        QueryWrapper<Brand> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Brand::getStatus,1);
        List<Brand> list = brandDao.selectList(queryWrapper);
        return list;
    }
}
