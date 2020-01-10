package edu.wandongli.car.service;

import edu.wandongli.car.pojo.Money;

import java.util.List;

public interface MoneyService {

    List<Money> getList();

    //根据主键查询上线,下线
    Money findMoneyById(Long id);
}
