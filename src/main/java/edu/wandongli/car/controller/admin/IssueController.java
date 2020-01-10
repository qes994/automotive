package edu.wandongli.car.controller.admin;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.sun.org.apache.regexp.internal.RE;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.enums.StatusEnum;
import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.pojo.Money;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.service.AdminService;
import edu.wandongli.car.service.IssueService;
import edu.wandongli.car.service.MoneyService;
import edu.wandongli.car.util.ResultObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@RestController("/admin/issue")
@RequestMapping("/admin/issue")
public class IssueController {

    @Autowired
    IssueService issueService;
    @Autowired
    MoneyService moneyService;
    @Autowired
    AdminService adminService;
    //跳进发布管理后台页面
    @GetMapping("/index")
    public ModelAndView index(@SessionAttribute("admin")Admin admin){
        ModelAndView mv = new ModelAndView();
        Admin adminByPhone = adminService.findAdminByPhone(admin.getPhone());
        mv.addObject("admin",adminByPhone);
        mv.setViewName("/admin/issue/index");
        return mv;
    }
    @PostMapping("/index")
    public ModelMap index(@RequestParam(defaultValue = "1") Integer page, Integer limit
                          ,@RequestParam(value = "shop",required = false)String shop
                          ,@RequestParam(value = "title",required = false)String title
                          ,@RequestParam(value = "brand",required = false)String brand
    ,@RequestParam(value = "arctic",required = false)String arctic,
                          @RequestParam(value = "id",required = false)Long id){
        ModelMap map = new ModelMap();
        //品牌的
        System.out.println("价格区间="+id);
        System.out.println("什么类型="+shop);
        if (StringUtils.equals("1",shop)){//模糊查询售购的
            ShopEnum shopEnum = ShopEnum.SELL;
            IPage<Issue> iPage = issueService.getListByLikes(page, limit, title,shopEnum, brand, arctic, null, null);
            List<Issue> issue = iPage.getRecords();
            long total = iPage.getTotal();
            if (issue!=null){
                map.put("code",0);
                map.put("msg","有数据");
                map.put("count",total);
                map.put("data",issue);

                return map;
            }

            map.put("code",1);
            map.put("msg","无数据");
            return map;
        }
        if (StringUtils.equals("2",shop)){//模糊查询售购的
            ShopEnum shopEnum = ShopEnum.BUY;
            IPage<Issue> iPage = issueService.getListByLikes(page, limit, title,shopEnum, brand, arctic, null, null);
            List<Issue> issue = iPage.getRecords();
            long total = iPage.getTotal();
            if (issue!=null){
                map.put("code",0);
                map.put("msg","有数据");
                map.put("count",total);
                map.put("data",issue);

                return map;
            }
            map.put("code",1);
            map.put("msg","无数据");

            return map;
        }
        //价格的
        if (id!=null&&id!=0){
            Money money = moneyService.findMoneyById(id);
            int ceilingPrice = money.getCeilingPrice();//上线
            int floorPrice = money.getFloorPrice();//下线
            IPage<Issue> ipage = issueService.getListByLikes(page, limit, title,null, brand, arctic, ceilingPrice, floorPrice);
            List<Issue> records = ipage.getRecords();
            long total = ipage.getTotal();
            if (records!=null){
                map.put("code",0);
                map.put("msg","有数据");
                map.put("count",total);
                map.put("data",records);
                return map;
            }
            map.put("code",1);
            map.put("msg","无数据");
            return map;
        }
        IPage<Issue> ipage = issueService.getListByLikes(page, limit, title,null, brand, arctic, null, null);
        List<Issue> records = ipage.getRecords();
        long total = ipage.getTotal();
        if (records!=null){
            map.put("code",0);
            map.put("msg","有数据");
            map.put("count",total);
            map.put("data",records);
            return map;
        }
        map.put("code",1);
        map.put("msg","无数据");
        return map;
    }

    @PostMapping("/del")
    public ResultObject del(@RequestParam("id")Long id,@SessionAttribute(value = "admin",required = false) Admin admin){
        if (admin==null){
            return new ResultObject(0,"操作失败");
        }
        int del = issueService.del(id);
        if (del>0){
            return new ResultObject(1,"删除成功");
        }
        return new ResultObject(0,"删除失败");
    }

    //是否置顶
    @PostMapping("/priority")
    public ResultObject priority(@RequestParam("id")Long id,@RequestParam("priority")String priority,
                                 @SessionAttribute(value = "admin",required = false)Admin admin){
        if (admin==null){
            return new ResultObject(0,"操作失败");
        }
        if (StringUtils.equals("9",priority)){
            Issue issue = new Issue();
            issue.setId(id);
            issue.setUpdateTime(new Date());
            issue.setPriority(9);
            int i = issueService.editIssue(issue);
            if (i>0){
                return new ResultObject(1,"操作成功");
            }
        }
        if (!StringUtils.equals("9",priority)){
            Issue issue = new Issue();
            issue.setId(id);
            issue.setUpdateTime(new Date());
            issue.setPriority(1);
            int i = issueService.editIssue(issue);
            if (i>0){
                return new ResultObject(1,"操作成功");
            }
        }
        return new ResultObject(0,"操作失败");
    }
    //是否置顶
    @PostMapping("/status")
    public ResultObject status(@RequestParam("id")Long id,@RequestParam("status")String status,
                                 @SessionAttribute(value = "admin",required = false)Admin admin){
        if (admin==null){
            return new ResultObject(0,"操作失败");
        }
        if (StringUtils.equals("2",status)){
            Issue issue = new Issue();
            issue.setId(id);
            issue.setUpdateTime(new Date());
            issue.setStatus(StatusEnum.HIDE);
            int i = issueService.editIssue(issue);
            if (i>0){
                return new ResultObject(1,"操作成功");
            }
        }
        if (StringUtils.equals("1",status)){
            Issue issue = new Issue();
            issue.setId(id);
            issue.setUpdateTime(new Date());
            issue.setStatus(StatusEnum.SHOW);
            int i = issueService.editIssue(issue);
            if (i>0){
                return new ResultObject(1,"操作成功");
            }
        }
        return new ResultObject(0,"操作失败");
    }



}
