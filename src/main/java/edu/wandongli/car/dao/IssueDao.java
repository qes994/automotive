package edu.wandongli.car.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.enums.StatusEnum;
import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.nio.cs.ext.ISCII91;

import java.util.List;

@Repository
public interface IssueDao extends BaseMapper<Issue> {

    //根据UserId查询我的发布并分页
    IPage<Issue> findIssuesByUserIdAndStatus(Page<Issue> page, @Param("userId")Long userId);

    //查询所有记录
    List<Issue> getList(Issue issue);

    //查看所有记录根据品牌,价格,车型,标题,模糊查询
    IPage<Issue> getListByLikes(@Param("iPage") IPage<Issue> iPage,@Param("title")String title,@Param("shop")ShopEnum shop,
     @Param("brand") String brand, @Param("arctic")String arctic, @Param("ceilingPrice")Integer ceilingPrice,
                                @Param("floorPrice")Integer floorPrice

    );
}
