package edu.wandongli.car.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface IssueService {

    //根据UserId查询自已所有的发布,并进行分页,根据优先级进行排序
    IPage<Issue> findLiisByUserIdAndStatus(Page<Issue> page, Long userId);

    //查看所有车型加图片


    //根据发布id查看详情,并查出该用户的所有信息
    Issue findIssueAndUserByIssueId(Long id);

    //根据用户id查看发布总条数
    int count(Long userId);

    //修改
    int editIssue(Issue issue);

    //发布
    int add(Issue issue);
    //查询所有记录
    List<Issue> getList(Issue issue);

    //查看所有记录根据品牌,价格,车型,标题,模糊查询
    IPage<Issue> getListByLikes(Integer page,Integer limit, String title,ShopEnum shop,
                                String brand, String arctic,Integer ceilingPrice,
                               Integer floorPrice
    );

    //根据id删除发布
    int del(Long id);


    //添加发布
    int add(Issue issue,List<String> images);


}
