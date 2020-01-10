package edu.wandongli.car.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.car.pojo.IssuePrint;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Repository
public interface IssuePrintDao extends BaseMapper<IssuePrint> {

    List<IssuePrint> selectByIssueId(Long issueId);




}
