package edu.wandongli.car.controller.home;

import edu.wandongli.car.dto.BasicDto;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.pojo.Brand;
import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.pojo.Money;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.service.BrandService;
import edu.wandongli.car.service.IssueService;
import edu.wandongli.car.service.MoneyService;
import edu.wandongli.car.util.ResultObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.util.List;

@RestController("/home/car")
@RequestMapping("/car")
public class CarController {

    @Autowired
    IssueService issueService;
    @Autowired
    BrandService brandService;
    @Autowired
    MoneyService moneyService;

    //前往汽车圈
    @GetMapping("/cricle")
    public ModelAndView cricle(@RequestParam(value = "name",required = false)String name){
        ModelAndView mv = new ModelAndView();
        mv.addObject("brand",name);
        mv.setViewName("/home/car/cricle");
        return mv;
    }
    @PostMapping("/cricle")
    public BasicDto getList(@RequestParam(value = "type",required = false)String type
    , @RequestParam(value = "brand",required = false)String brand
    ,@RequestParam(value = "arctic",required = false)String arctic
    ,@RequestParam(value = "price",required = false)Long id){

        System.out.println("-----------------------------品牌"+brand);
        System.out.println("-----------------------------上线下线表id"+id);
        System.out.println("-----------------------------类型"+type);
        Issue issue = new Issue();
        //品牌的
        if (!StringUtils.isBlank(brand)){
            System.out.println("-----------------------------品牌"+brand);
            issue.setBrand(brand);
            List<Issue> list = issueService.getList(issue);
            if (list.size()==0){
                return new BasicDto(0,"没数据",list);
            }
            return new BasicDto(1,"有数据",list);
        }
        if (type!=null){
            int shop = Integer.parseInt(type);
            //类型
            if (shop==1){
                System.out.println("售卖"+shop);
                issue.setShop(ShopEnum.SELL);
                List<Issue> list = issueService.getList(issue);
                if (list.size()==0){
                    return new BasicDto(0,"没数据",list);
                }
                return new BasicDto(1,"有数据",list);
            }
            if (shop==2){
                System.out.println("求购"+shop);
                issue.setShop(ShopEnum.BUY);
                List<Issue> list = issueService.getList(issue);
                if (list.size()==0){
                    return new BasicDto(0,"没数据",list);
                }
                return new BasicDto(1,"有数据",list);
            }
        }

            //车型的
        if (!StringUtils.isBlank(arctic)){
            System.out.println("-----------------------------品牌"+arctic);
            issue.setArctic(arctic);
            List<Issue> list = issueService.getList(issue);
            if (list.size()==0){
                return new BasicDto(0,"没数据",list);
            }
            return new BasicDto(1,"有数据",list);
        }
        if (id!=0&&id!=null){
            System.out.println("----------------------55555555555"+id);
            Money money = moneyService.findMoneyById(id);
            int ceilingPrice = money.getCeilingPrice();//上线
            int floorPrice = money.getFloorPrice();//下线
            issue.setFloorPrice(floorPrice);
            issue.setCeilingPrice(ceilingPrice);
            System.out.println("7777777777777777777"+issue.toString());
            List<Issue> list = issueService.getList(issue);
            System.out.println(list+"/////////////////////////////////");
            if (list.size()==0){
                return new BasicDto(0,"没数据",list);
            }
            return new BasicDto(1,"有数据",list);
        }
            return new BasicDto(0,"没有更多数据");
    }

    //前往品牌
    @GetMapping("/brand")
    public ModelAndView brand(@RequestParam(value = "id",required = false) Long id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("id",id);
        modelAndView.setViewName("/home/car/brand");
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

    @PostMapping("/index")
    public BasicDto Index(@RequestParam(value = "type",required = false)String type
            , @RequestParam(value = "brand",required = false)String brand
            ,@RequestParam(value = "arctic",required = false)String arctic
            ,@RequestParam(value = "price",required = false)Long id){
        System.out.println("-----------------------------品牌"+brand);
        System.out.println("-----------------------------上线下线表id"+id);
        System.out.println("-----------------------------类型"+type);
        Issue issue = new Issue();
        if (type!=null){
            int shop = Integer.parseInt(type);
            //类型
            if (shop==1){
                System.out.println("售卖"+shop);
                issue.setShop(ShopEnum.SELL);
                issue.setBrand(brand);
                issue.setArctic(arctic);
                int ceilingPrice = 0;
                int floorPrice = 0;
                if (id==null){
                    List<Issue> list = issueService.getList(issue);
                    if (list.size()==0){
                        return new BasicDto(0,"没数据",list);
                    }
                    return new BasicDto(1,"有数据",list);
                }
                Money money = moneyService.findMoneyById(id);
                ceilingPrice = money.getCeilingPrice();//上线
                floorPrice = money.getFloorPrice();//下线
                System.out.println("上线:--------------------"+floorPrice);
                issue.setFloorPrice(floorPrice);
                issue.setCeilingPrice(ceilingPrice);
                List<Issue> list = issueService.getList(issue);
                if (list.size()==0){
                    return new BasicDto(0,"没数据",list);
                }
                return new BasicDto(1,"有数据",list);
            }
            if (shop==2){
                System.out.println("求购"+shop);
                issue.setShop(ShopEnum.BUY);
                issue.setBrand(brand);
                issue.setArctic(arctic);
                int ceilingPrice = 0;
                int floorPrice = 0;
                if (id==null){
                    List<Issue> list = issueService.getList(issue);
                    if (list.size()==0){
                        return new BasicDto(0,"没数据",list);
                    }
                    return new BasicDto(1,"有数据",list);
                }
                Money money = moneyService.findMoneyById(id);
                ceilingPrice = money.getCeilingPrice();//上线
                floorPrice = money.getFloorPrice();//下线
                System.out.println("上线:--------------------"+floorPrice);
                issue.setFloorPrice(floorPrice);
                issue.setCeilingPrice(ceilingPrice);
                List<Issue> list = issueService.getList(issue);
                if (list.size()==0){
                    return new BasicDto(0,"没数据",list);
                }
                return new BasicDto(1,"有数据",list);
            }
        }
        return new BasicDto(0,"没数据",null);
    }

}
