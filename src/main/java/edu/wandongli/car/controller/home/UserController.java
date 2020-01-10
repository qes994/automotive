package edu.wandongli.car.controller.home;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sun.org.apache.xalan.internal.xsltc.dom.SortingIterator;
import edu.wandongli.car.dao.OpinionDao;
import edu.wandongli.car.dto.BasicDto;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.enums.StatusEnum;
import edu.wandongli.car.enums.UserEnum;
import edu.wandongli.car.params.CarParams;
import edu.wandongli.car.params.UserAuthParams;
import edu.wandongli.car.pojo.*;
import edu.wandongli.car.service.*;
import edu.wandongli.car.util.EncryptUtil;
import edu.wandongli.car.util.ResultObject;
import edu.wandongli.car.util.ValidatorUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

@Validated
@RestController("user/home")
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    UserAuthService userAuthService;
    @Autowired
    OpinionService opinionService;
    @Autowired
    IssueService issueService;
    @Autowired
    IssuePrintService issuePrintService;
    @Autowired
    BrandService brandService;
    @Autowired
    ArcticService arcticService;

    //登录
    @GetMapping("/login")
    public  ModelAndView login(ModelAndView mv){
        mv.setViewName("/home/user/login");
        return mv;
    }
    //获取验证码
    @PostMapping("/code1")
    public BasicDto getCode1(@RequestParam("phone") @NotBlank(message = "请输入手机号")
                                    String phone,HttpSession session){
        System.out.println("手机号="+phone);
        if (!ValidatorUtil.checkPhone(phone)){
            return new BasicDto(0,"手机号不符合规则");
        }
        User user = userService.login(phone);
        if (user==null){
            return new BasicDto(0,"手机号不存在");
        }
        String code = EncryptUtil.randomCode();
        session.setAttribute("code",code);
        return new BasicDto(1,"验证码",code);
    }

    @PostMapping("/login")
    public BasicDto login(@RequestParam("phone")@NotBlank(message = "手机号不能为空") String phone
    ,@RequestParam("code")@NotBlank(message = "验证码不能为空")String code,HttpSession session){
        if (!StringUtils.equals(code,(String)session.getAttribute("code"))){
            return new  BasicDto(1,"验证码错误");
        }
        User user = userService.login(phone);
        UserEnum status = user.getStatus();
        if (StringUtils.equals(UserEnum.HIDE.getName(),status.getName())){
            return new BasicDto(0,"登录失败,该账户已被冻结");
        }
        if (user!=null){
            session.setAttribute("user",user);
            return new BasicDto(1,"登录成功,前往个人中心");
        }
        return new BasicDto(0,"该账户不存在");
    }



    //注册
    @GetMapping("/register")
    public ModelAndView regis(ModelAndView mv){
        mv.setViewName("/home/user/register");
        return mv;
    }
    @PostMapping("/register")
    public BasicDto regis(@RequestParam("phone")@NotBlank(message = "手机号不能为空") String phone,
                         @RequestParam("code") @NotBlank(message = "验证码不能为空") String code,
                          @SessionAttribute("code")String SessionCode,HttpSession session){
        if (!StringUtils.equals(code,SessionCode)){
            return new  BasicDto(1,"验证码错误");
        }
        User user = userService.register(phone);
        session.setAttribute("user",user);
        return new BasicDto(1,"注册成功",user);
    }

    //获取验证码
    @PostMapping("/code")
    public BasicDto getCode(@RequestParam("phone") @NotBlank(message = "请输入手机号")
                     String phone,HttpSession session){
        System.out.println("手机号="+phone);
        if (!ValidatorUtil.checkPhone(phone)){
            return new BasicDto(0,"手机号不符合规则");
        }
        String code = EncryptUtil.randomCode();
        session.setAttribute("code",code);
        return new BasicDto(1,"验证码",code);
    }
    //前往个人中心
    @GetMapping("/home")
    public ModelAndView toHome(ModelAndView modelAndView){
        modelAndView.setViewName("home/user/personal_center");
        return modelAndView;
    }
    //退出个人中心
    @GetMapping("/quit")
    public ModelAndView quit(ModelAndView modelAndView,HttpSession session){
        session.removeAttribute("user");
        modelAndView.setViewName("/home/user/login");
        return modelAndView;
    }
    //修改头像
    @GetMapping("/head")
    public ModelAndView head(ModelAndView modelAndView,@SessionAttribute("user")User user){
        modelAndView.addObject("user",user);
        modelAndView.setViewName("/home/user/set_person");
        return modelAndView;
    }
    @PostMapping("/head")
    public BasicDto head(@RequestParam("head")@NotBlank(message = "图片不能为空")String head
    ,@SessionAttribute("user")User user,HttpSession session){
        user.setHead(head);
        int result = userService.UpdateUser(user);
        if (result>0){
            session.setAttribute("user",user);
            return new BasicDto(1,"修改成功");
        }
        return new BasicDto(0,"修改失败");
    }
    @GetMapping("/setName")
    public ModelAndView setName(@SessionAttribute("user")User user
    ,ModelAndView modelAndView){
        modelAndView.addObject("user",user);
        modelAndView.setViewName("/home/user/set_name");
        return modelAndView;
    }
    @PostMapping("/setName")
    public BasicDto setName(@RequestParam("name")@NotBlank(message = "用户名不能为空")String name
    ,HttpSession session){
        User user = (User)session.getAttribute("user");
        //User user = new User();
        user.setName(name);
        int result = userService.UpdateUser(user);
        if (result>0){
            session.setAttribute("user",user);
            return new BasicDto(1,"修改成功");
        }else{
            return new BasicDto(0,"修改失败");
        }
    }
    //实名制
    @GetMapping("/auth")
    public ModelAndView auth(ModelAndView mv){
        mv.setViewName("/home/user/auth");
        return mv;
    }
    @PostMapping("/auth")
    public  BasicDto auth(@RequestBody @Validated UserAuthParams userAuthParams
    ,@SessionAttribute("user")User user){
        Long id = user.getId();
        UserAuth userAuth1 = new UserAuth();
        userAuth1.setUserId(id);
        UserAuth certification = userAuthService.findAuthByUserId(id);
        if (certification!=null){
            return new BasicDto(0,"已在审核中,请耐心等待...");
        }
        UserAuth userAuth = new UserAuth();
        userAuth.setUserId(user.getId());
        userAuth.setName(userAuthParams.getName());
        userAuth.setIdCard(userAuthParams.getIdCard());
        userAuth.setBackImage(userAuthParams.getBackImage());
        userAuth.setFrontImage(userAuthParams.getFrontImage());
        userAuth.setCreateTime(new Date());
        userAuth.setStatus(RealEnum.NOAUTH);
        User MysqlUser = userService.findUserById(id);
        MysqlUser.setRealName(RealEnum.NOAUTH);
        int i = userService.UpdateUser(MysqlUser);
        if (i<0){
            return new BasicDto(1,"添加失败",i)
                    ; }
        UserAuth result = userAuthService.certification(userAuth);
        if (result!=null){
            return new BasicDto(1,"添加成功",result)
       ; }
        return new BasicDto(0,"添加失败");
    }
    //前往我的发布
    @GetMapping("/MyIssue")
    public ModelAndView MyIssue(ModelAndView mv,
                                @SessionAttribute("user")User user){
        Page<Issue> page = new Page<>();
        IPage<Issue> list = issueService.findLiisByUserIdAndStatus(page, user.getId());
        List<Issue> issue = list.getRecords();
        //System.out.println("数据="+issue.get(0).getIssuePrints().get(0).getCover());
        //System.out.println("数据1111="+list.getCurrent()+"pages="+list.getPages()+list.getSize());
        mv.addObject("issue",issue);
        mv.addObject("list",list);
        mv.setViewName("/home/user/my_issue");
        return mv;
    }
    //查看文章详情
    @GetMapping("/details")
    public ModelAndView details(@RequestParam("id") Long id
    ,ModelAndView mv,HttpSession session){
        User SessionUser = (User) session.getAttribute("user");
        Long userId = SessionUser.getId();
        Issue issue = issueService.findIssueAndUserByIssueId(id);//该文章详情
        List<IssuePrint> issuePrints = issuePrintService.getListByIssueId(id);//图片
        //System.out.println("该文章id"+id+"该文章"+issue+"图片"+issuePrints);
        User user = userService.findUserById(userId);//用户信息
        int count = issueService.count(userId);//该用户发布了几条信息
        mv.addObject("issue",issue);
        mv.addObject("issuePrints",issuePrints);
        mv.addObject("user",user);
        mv.addObject("count",count);
        mv.setViewName("/home/user/good_detail");
        return mv;
    }
    //前往个人主页
    @GetMapping("/homePage")
    public ModelAndView homePage(@SessionAttribute("user")User SessionUser,@RequestParam("IssueId")Long issueId){
        ModelAndView mv = new ModelAndView();
        User user = userService.findUserById(SessionUser.getId());//用户信息
        int count = issueService.count(SessionUser.getId());//列表总数
        Page<Issue> page = new Page<>();
        IPage<Issue> info = issueService.findLiisByUserIdAndStatus(page, SessionUser.getId());
        List<Issue> list = info.getRecords();
        mv.addObject("user",user);
        mv.addObject("count",count);
        mv.addObject("list",list);
        System.out.println();
        mv.addObject("issueId",issueId);
        mv.setViewName("/home/user/myHome");
        return mv;
    }
    //前往编辑
    @GetMapping("/editIssue")
    public ModelAndView editIssue(ModelAndView modelAndView,HttpSession session
    ,@RequestParam("id")Long id,@RequestParam(value = "name",required = false)String name){
        Issue issue = issueService.findIssueAndUserByIssueId(id);
        if (!StringUtils.isBlank(name)){
            issue.setBrand(name);
        }
        List<IssuePrint> print = issuePrintService.getListByIssueId(id);
        modelAndView.addObject("issue",issue);
        modelAndView.addObject("print",print);
        modelAndView.setViewName("/home/user/upMyIssue");
        return modelAndView;
    }
    //前往品牌
    @GetMapping("/brand")
    public ModelAndView brand(@RequestParam(value = "id",required = false) Long id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("id",id);
        modelAndView.setViewName("/home/user/brand");
        return modelAndView;
    }
    //展示品牌
    @PostMapping("/brand")
    public  BasicDto brand(){
        List<Brand> brands = brandService.getBrands();
        if (brands!=null){
            return new BasicDto(1,"有数据",brands);
        }
        return new BasicDto(0,"无数据",brands);
    }
    //选择车型
    @PostMapping("/arctic")
    public  ResultObject arctic(){
        System.out.println("///////////////////////////////////");
        List<Arctic> list = arcticService.getList();
        return new  ResultObject(1,"有数据",list);
    }

    //删除一条图片记录
    @PostMapping("/delRecord")
    public BasicDto del(Long id){
        int del = issuePrintService.del(id);
        if (del>0){
            return new BasicDto(1,"删除成功");
        }
        return new BasicDto(0,"删除失败");
    }



    @PostMapping("/updateIssue")
    public ResultObject addIssue(@RequestBody HashMap<String,Object> map
            ,@SessionAttribute(value = "user",required = false)User user){
        List<String> image= (List<String>) map.get("image");
        String details = (String) map.get("details");
        String title = (String) map.get("title");
        String arctic = (String) map.get("arctic");
        String brand= (String) map.get("brand");
        String shop= (String) map.get("shop");//enum
        String price= (String) map.get("price");//int类型
        String id = (String) map.get("id");//int型
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
            if (image.size()>7){
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
            issue.setTitle(title);//标题
            issue.setArctic(arctic);//车型
            System.out.println("////////////////////////"+arctic);
            issue.setBrand(brand);//品牌
            System.out.println("////////////////////////"+brand);
            issue.setDetails(details);//详情
            System.out.println("////////////////////////"+details);
            int money = Integer.parseInt(price);
            issue.setPrice(money);//价格
            issue.setShop(ShopEnum.SELL);//售卖
            issue.setUpdateTime(new Date());
            long noteId = Long.parseLong(id);
            issue.setId(noteId);
            System.out.println(noteId+"////////////////////要修改的id");
            int result = issueService.editIssue(issue);
            //图片
            for (String images : image) {
                System.out.println("得到的图片:"+images);
                IssuePrint issuePrint1 = issuePrintService.findPrintByIdAndCover(noteId, images);
                if (issuePrint1==null){
                    if (!StringUtils.isBlank(images)) {
                        issuePrint.setIssueId(noteId);
                        issuePrint.setCover(images);
                        issuePrint.setCreateTime(new Date());
                        issuePrintService.add(issuePrint);
                    }
                }
            }
            if (result>0){
                return new ResultObject(1,"编辑成功");
            }
            return new ResultObject(0,"编辑失败");
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
            if (image.size()>7){
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
            issue.setTitle(title);//标题
            issue.setDetails(details);//详情
            int money = Integer.parseInt(price);
            issue.setPrice(money);//价格
            issue.setShop(ShopEnum.BUY);//求购
            issue.setUpdateTime(new Date());
            long noteId = Long.parseLong(id);
            issue.setId(noteId);
            int result = issueService.editIssue(issue);
            //图片
            for (String images : image) {
                System.out.println("得到的图片:"+images);
                IssuePrint issuePrint1 = issuePrintService.findPrintByIdAndCover(noteId, images);
                if (issuePrint1==null){
                    if (!StringUtils.isBlank(images)){
                        issuePrint.setIssueId(noteId);
                        issuePrint.setCover(images);
                        issuePrint.setCreateTime(new Date());
                        issuePrintService.add(issuePrint);
                    }
                }
            }
            if (result>0){
                return new ResultObject(1,"编辑成功");
            }
            return new ResultObject(0,"编辑失败");

        }
    }



    //意见反馈
    @GetMapping("/opinion")
    public ModelAndView opinion(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/home/user/opinion");
        return mv;
    }
    @PostMapping("opinion")
    public ResultObject opinion(@RequestParam("content")@NotBlank(message = "内容不为空")
            String content,@SessionAttribute("user")User user){
        Opinion opinion=new Opinion();
        opinion.setUserId(user.getId());
        opinion.setContent(content);
        opinion.setCreateTime(new Date());
        int result = opinionService.addOpinion(opinion);
        if (result>0){
            return new ResultObject(1,"添加成功");
        }
        return new ResultObject(0,"添加失败");
    }












}
