package edu.wandongli.car.service.impl;

import com.baomidou.mybatisplus.core.conditions.ISqlSegment;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.car.dao.IssueDao;
import edu.wandongli.car.dao.IssuePrintDao;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.exception.ServiceException;
import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.pojo.IssuePrint;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.service.IssuePrintService;
import edu.wandongli.car.service.IssueService;
import edu.wandongli.car.util.ResultObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class IssueServiceImpl implements IssueService {

    private  IssueDao issueDao;
    @Autowired
    public void setIssueDao(IssueDao issueDao) {
        this.issueDao = issueDao;
    }
    @Autowired
    IssuePrintDao issuePrintDao;

    @Override
    public IPage<Issue> findLiisByUserIdAndStatus(Page<Issue> page, Long userId) {
        IPage<Issue> issues = issueDao.findIssuesByUserIdAndStatus(page, userId);
        if (issues==null){
            throw new SecurityException("数据空");
        }
        return issues;
    }

    @Override
    //@Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED)
    public Issue findIssueAndUserByIssueId(Long id) {
        //先查看
        QueryWrapper<Issue> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Issue::getId,id);
        Issue issue = issueDao.selectOne(queryWrapper);
        return issue;
    }

    @Override
    public int count(Long userId) {
        QueryWrapper<Issue> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Issue::getUserId,userId);
        System.out.println("用户id"+userId);
        Integer count = issueDao.selectCount(queryWrapper);
        System.out.println(count+userId);
       if (count==0){
            throw  new SecurityException("此人没有发布文章");
        }
        return count;
    }

    @Override
    public int editIssue(Issue issue) {
        int i = issueDao.updateById(issue);
        if (i==0){
            throw new SecurityException("修改失败");
        }
        return i;
    }

    @Override
    public int add(Issue issue) {
        int insert = issueDao.insert(issue);
        if (insert==0){
            throw new SecurityException("发布失败");
        }
        return insert;
    }

    @Override
    public List<Issue> getList(Issue issue) {
        List<Issue> list = issueDao.getList(issue);
        return list;
    }

    @Override
    public IPage<Issue> getListByLikes(Integer page, Integer limit, String title,ShopEnum shop, String brand, String arctic,Integer  ceilingPrice,
                                       Integer floorPrice
    ) {
      IPage<Issue> iPage = new Page<>(1,10);
        IPage<Issue> issueIPage = issueDao.getListByLikes(iPage, title,shop, brand, arctic,ceilingPrice,floorPrice);
        return issueIPage;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED)
    public int del(Long id) {
        QueryWrapper<Issue> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Issue::getId,id);
        QueryWrapper<IssuePrint> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.lambda().eq(IssuePrint::getIssueId,id);
        int delete = issueDao.delete(queryWrapper);
        int delete1 = issuePrintDao.delete(queryWrapper1);
        if (delete==0){
            throw new SecurityException("删除失败");
        }
        if (delete1==0){
            throw new SecurityException("删除失败");
        }
        return delete;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED)
    public int add(Issue issue, List<String> images) {
        int insert = issueDao.insert(issue);
        for (String image : images) {
            IssuePrint issuePrint = new IssuePrint();
            issuePrint.setIssueId(issue.getId());
            issuePrint.setCover(image);
            issuePrint.setCreateTime(new Date());
            issuePrintDao.insert(issuePrint);
        }
        if (insert==0){
            throw new SecurityException("添加失败");
        }
        return insert;
    }

}
