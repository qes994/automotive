package edu.wandongli.car.controller.home;

import com.baomidou.mybatisplus.extension.api.R;
import edu.wandongli.car.dto.BasicDto;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.params.CarParams;
import edu.wandongli.car.pojo.*;
import edu.wandongli.car.service.*;
import edu.wandongli.car.util.ResultObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import javax.validation.constraints.NotNull;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController("/home/issue")
@RequestMapping("/issue")
public class IssueController {

    @Autowired
    ArcticService arcticService;
    @Autowired
    BrandService brandService;
    @Autowired
    IssueService issueService;
    @Autowired
    IssuePrintService issuePrintService;
    @Autowired
    MoneyService moneyService;
    //前往发布
    @GetMapping("/issue")
    public  ModelAndView issue(@RequestParam(value = "name",required = false)String name){
       ModelAndView modelAndView = new ModelAndView();
       if (!StringUtils.isBlank(name)){
           modelAndView.addObject("brand",name);
       }
       modelAndView.setViewName("/home/issue/addIssue");
       return modelAndView;
    }
    //前往品牌
    @GetMapping("/brand")
    public ModelAndView brand(@RequestParam(value = "id",required = false) Long id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("id",id);
        modelAndView.setViewName("/home/issue/brand");
        return modelAndView;
    }
    //展示品牌
    @PostMapping("/brand")
    public BasicDto brand(){
        List<Brand> brands = brandService.getBrands();
        if (brands!=null){
            return new BasicDto(1,"有数据",brands);
        }
        return new BasicDto(0,"无数据",brands);
    }
    //发布
    //添加
   /* @PostMapping("/add")
    public ResultObject add(@RequestBody @Validated CarParams carParams, @SessionAttribute("user")User user){
        Issue issue = new Issue();
        System.out.println("------------------------------");
        @NotNull(message = "请选择发布类型") String shop = carParams.getShop();
        System.out.println("-------------------"+shop);
        if (StringUtils.equals(shop,"售卖")){
            issue.setUserId(user.getId());
            issue.setShop(ShopEnum.SELL);
            issue.setUserId(user.getId());//用户id
            issue.setTitle(carParams.getTitle());//标题
            issue.setArctic(carParams.getArctic());//车型
            issue.setBrand(carParams.getBrand());//品牌
            issue.setDetails(carParams.getDetails());//详情
            issue.setPrice(carParams.getPrice());//价格
            issue.setCreateTime(new Date());
            List<String> image = new ArrayList<>();
            if(carParams.getImage()!=null){
                image=Arrays.asList(carParams.getImage().split(","));
            }
            int result = issueService.add(issue, image);
            if (result>0){
                return new ResultObject(1,"发布成功");
            }
            return new ResultObject(0,"添加失败");
        }else {
            issue.setUserId(user.getId());
            issue.setShop(ShopEnum.SELL);
            issue.setUserId(user.getId());//用户id
            issue.setBrand(carParams.getBrand());//品牌
            issue.setDetails(carParams.getDetails());//详情
            issue.setPrice(carParams.getPrice());//价格
            issue.setCreateTime(new Date());
            List<String> image = new ArrayList<>();
            if(carParams.getImage()!=null){
                image=Arrays.asList(carParams.getImage().split(","));
            }
            int result = issueService.add(issue, image);
            if (result>0){
                return new ResultObject(1,"发布成功");
            }
            return new ResultObject(0,"添加失败");
        }
    }*/
    @PostMapping("/add")
    public ResultObject addIssue(@RequestBody HashMap<String,Object> map
            ,@SessionAttribute(value = "user",required = false)User user){
        List<String> image= (List<String>) map.get("image");
        String details = (String) map.get("details");
        String title = (String) map.get("title");
        String arctic = (String) map.get("arctic");
        String brand= (String) map.get("brand");
        String shop= (String) map.get("shop");//enum
        String price= (String) map.get("price");//int类型
        System.out.println("标题="+title+" 品牌="+brand+" 车型="+arctic+" 类型="+shop
                +" 价格="+price+image.size()+" 详情="+details);
        if ("售卖".equals(shop)){
            if (StringUtils.isBlank(details)){
                //详情不能为空
                return new ResultObject(0,"详情不能为空");
            }
            if (StringUtils.isBlank(title)){
                //标题不能为空
                return new ResultObject(0,"标题不能为空");
            }
            if (StringUtils.isBlank(brand)){
                //品牌不能为空
                return new ResultObject(0,"品牌不能为空");
            }
            System.out.println("图片的数量"+image.size());
            if (image.size()<0){
                //图片不能为空
                return new ResultObject(0,"图片不能为空");
            }
            if (image.size()>6){
                //图片最大上传六张
                return new ResultObject(0,"图片最大上传六张");
            }
            if (StringUtils.isBlank(arctic)){
                //车型不能为空
                return new ResultObject(0,"车型不能为空");
            }
            if (StringUtils.isBlank(shop)){
                //类型不能为空
                return new ResultObject(0,"类型不能为空");
            }
            if (StringUtils.isBlank(price)){
                //价格不能为空
                return new ResultObject(0,"价格不能为空");
            }
            Issue issue = new Issue();
            IssuePrint issuePrint = new IssuePrint();
            issue.setUserId(user.getId());//用户id
            issue.setTitle(title);//标题
            issue.setArctic(arctic);//车型
            issue.setBrand(brand);//品牌
            issue.setDetails(details);//详情
            int money = Integer.parseInt(price);
            issue.setPrice(money);//价格
            issue.setShop(ShopEnum.SELL);//售卖
            issue.setCreateTime(new Date());
            int result = issueService.add(issue);
            Long id = issue.getId();
            //图片
            for (String images : image) {
                System.out.println("得到的图片:"+images);
                issuePrint.setCover(images);
                issuePrint.setIssueId(id);
                issuePrint.setCreateTime(new Date());
                int result1 = issuePrintService.add(issuePrint);
            }
            if (result>0){
                return new ResultObject(1,"发布成功");
            }
            return new ResultObject(0,"添加失败");
        }else {
            //当不为售卖的时候
            if (StringUtils.isBlank(details)){
                //详情不能为空
                return new ResultObject(0,"详情不能为空");
            }
            if (StringUtils.isBlank(title)){
                //标题不能为空
                return new ResultObject(0,"标题不能为空");
            }
            if (image.size()<0){
                //图片不能为空
                return new ResultObject(0,"图片不能为空");
            }
            if (image.size()>6){
                //图片最大上传六张
                return new ResultObject(0,"图片最大上传六张");
            }
            if (StringUtils.isBlank(shop)){
                //类型不能为空
                return new ResultObject(0,"类型不能为空");
            }
            if (StringUtils.isBlank(price)){
                //价格不能为空
                return new ResultObject(0,"价格不能为空");
            }
            Issue issue = new Issue();
            IssuePrint issuePrint = new IssuePrint();
            issue.setUserId(user.getId());//用户id
            issue.setDetails(details);//详情
            issue.setTitle(title);
            int money = Integer.parseInt(price);
            issue.setPrice(money);//价格
            issue.setShop(ShopEnum.BUY);//售卖
            issue.setCreateTime(new Date());
            int result = issueService.add(issue);
            Long id = issue.getId();
            //图片
            for (String images : image) {
                System.out.println("得到的图片:"+images);
                issuePrint.setCover(images);
                issuePrint.setIssueId(id);
                issuePrint.setCreateTime(new Date());
                int result1 = issuePrintService.add(issuePrint);
            }
            if (result>0){
                return new ResultObject(1,"发布成功");
            }
            return new ResultObject(0,"发布失败");
        }
    }
    //展示价格
    @PostMapping("/price")
    public ResultObject getList(){
        List<Money> list = moneyService.getList();
        if (list.size()>0){
            return new ResultObject(1,"有数据",list);
        }
        return new ResultObject(0,"无数据",null);
    }



}
