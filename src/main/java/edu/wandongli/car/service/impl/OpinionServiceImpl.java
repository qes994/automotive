package edu.wandongli.car.service.impl;

import edu.wandongli.car.dao.OpinionDao;
import edu.wandongli.car.pojo.Opinion;
import edu.wandongli.car.service.OpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OpinionServiceImpl implements OpinionService {

    @Autowired
    OpinionDao opinionDao;

    @Override
    public int addOpinion(Opinion opinion) {
        int insert = opinionDao.insert(opinion);
        if (insert==0){
            throw  new SecurityException("添加失敗");
        }
        return insert;
    }
}
