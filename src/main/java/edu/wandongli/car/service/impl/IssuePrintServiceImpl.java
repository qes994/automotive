package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import edu.wandongli.car.dao.IssuePrintDao;
import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.pojo.IssuePrint;
import edu.wandongli.car.service.IssuePrintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IssuePrintServiceImpl implements IssuePrintService {

    @Autowired
    IssuePrintDao issuePrintDao;

    @Override
    public List<IssuePrint> getListByIssueId(Long issueId) {
        List<IssuePrint> prints = issuePrintDao.selectByIssueId(issueId);
        return prints;
    }

    @Override
    public int del(Long id) {
        QueryWrapper<IssuePrint> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(IssuePrint::getId,id);
        int result = issuePrintDao.delete(queryWrapper);
        if (result==0){
            throw new SecurityException("删除失败");
        }
        return result;
    }

    @Override
    public int add(IssuePrint issuePrint) {
        int insert = issuePrintDao.insert(issuePrint);
        if (insert==0){
            throw new SecurityException("添加失败");
        }
        return insert;
    }

    @Override
    public IssuePrint findPrintByIdAndCover(Long id, String cover) {
        QueryWrapper<IssuePrint> queryWrapper= new QueryWrapper<>();
        queryWrapper.lambda().eq(IssuePrint::getIssueId,id)
                .eq(IssuePrint::getCover,cover);
        IssuePrint issuePrint = issuePrintDao.selectOne(queryWrapper);
        return issuePrint;
    }
}
