package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sun.xml.internal.bind.v2.model.core.ID;
import edu.wandongli.car.dao.MoneyDao;
import edu.wandongli.car.pojo.Money;
import edu.wandongli.car.service.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Service
public class MoneyServiceImpl implements MoneyService {

    @Autowired
    MoneyDao moneyDao;

    @Override
    public List<Money> getList() {
        QueryWrapper<Money> queryWrapper = new QueryWrapper<>();
        List<Money> monies = moneyDao.selectList(queryWrapper);
        return monies;
    }

    @Override
    public Money findMoneyById(Long id) {
        QueryWrapper<Money> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Money::getId,id);
        Money money = moneyDao.selectOne(queryWrapper);
        if (money==null){
            throw  new SecurityException("么有此id");
        }
        return money;
    }
}
