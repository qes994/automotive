package edu.wandongli.car.service;

import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.pojo.IssuePrint;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IssuePrintService {


    List<IssuePrint> getListByIssueId(Long issueId);

    //根据id删除发布的图片记录
    int del(Long id);

    //添加图片
    int add(IssuePrint issuePrint);

    //根据发布id和图片查询该记录
    IssuePrint findPrintByIdAndCover(Long id,String cover);

}
