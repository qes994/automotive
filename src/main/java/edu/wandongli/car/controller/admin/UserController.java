package edu.wandongli.car.controller.admin;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.enums.UserEnum;
import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.pojo.UserAuth;
import edu.wandongli.car.service.AdminService;
import edu.wandongli.car.service.UserAuthService;
import edu.wandongli.car.service.UserService;
import edu.wandongli.car.util.EncryptUtil;
import edu.wandongli.car.util.ResultObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@RestController("/admin/user")
@RequestMapping("/admin/user")
public class UserController {
    @Autowired
    AdminService adminService;
    @Autowired
    UserService userService;
    @Autowired
    UserAuthService userAuthService;

    @GetMapping("/index")
    public  ModelAndView Index(@SessionAttribute("admin")Admin admin){
        ModelAndView mv = new ModelAndView();
        Admin adminByPhone = adminService.findAdminByPhone(admin.getPhone());
        mv.addObject("admin",adminByPhone);
        mv.setViewName("/admin/user/index");
        return mv;
    }
    //展示审核详情
    @GetMapping("/auth")
    public ModelAndView auth(@SessionAttribute("admin")Admin admin,@RequestParam("id")Long id){
        ModelAndView mv = new ModelAndView();

        Admin adminByPhone = adminService.findAdminByPhone(admin.getPhone());
        mv.addObject("admin",adminByPhone);
        User user = userService.findUserById(id);
        UserAuth userAuth = new UserAuth();
        userAuth.setUserId(id);
        UserAuth certification = userAuthService.findAuthByUserId(id);
        mv.addObject("user",user);
        mv.addObject("auth",certification);
        mv.setViewName("/admin/user/edit");
        return mv;
    }
    @PostMapping("/auth")
    public  ResultObject auth(@RequestParam("id")Long id,@RequestParam("realName")String realName
            ,HttpSession session){
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin==null){
            return new ResultObject(0,"操作失败");
        }
        if (StringUtils.equals("1",realName)){
            System.out.println("已经实名过");
            RealEnum realEnum = RealEnum.NOAUTH;
            int auth = userAuthService.auth(id, realEnum);
            if (auth>0){
                return new ResultObject(1,"修改成功");
            }
        }
        if (StringUtils.equals("2",realName)){
            System.out.println("未实名过");
            RealEnum realEnum = RealEnum.AUTH;
            int auth = userAuthService.auth(id, realEnum);
            if (auth>0){
                return new ResultObject(1,"修改成功");
            }
        }
        return new ResultObject(1,"失败");
    }


    @PostMapping("/index")
    public ModelMap index(@RequestParam(defaultValue = "1") Integer page, Integer limti
            , @RequestParam(value = "name",required = false)String name,
                          @RequestParam(value = "phone",required = false)String phone,
                          @RequestParam(value = "status",required = false)String status){
        ModelMap map = new ModelMap();
        User user = new User();
        if (StringUtils.equals(status,"1")){
            RealEnum auth = RealEnum.AUTH;
            IPage<User> list = userService.getList(page,limti,name,phone,auth);
            List<User> users = list.getRecords();
            long total = list.getTotal();
            if (users!=null){
                map.put("code",0);
                map.put("msg","有数据");
                map.put("count",total);
                map.put("data",users);
                return map;
            }
            map.put("code",1);
            map.put("msg","无数据");
            return map;
        }
        if (StringUtils.equals(status,"2")){
            RealEnum auth = RealEnum.NOAUTH;
            IPage<User> list = userService.getList(page,limti,name,phone,auth);
            List<User> users = list.getRecords();
            long total = list.getTotal();
            if (users!=null){
                map.put("code",0);
                map.put("msg","有数据");
                map.put("count",total);
                map.put("data",users);
                return map;
            }

            map.put("code",1);
            map.put("msg","无数据");
            return map;
        }
        RealEnum auth =null;
        IPage<User> list = userService.getList(page,limti,name,phone,auth);
        if (list!=null){
            long total = list.getTotal();
            List<User> users = list.getRecords();
            map.put("code",0);
            map.put("msg","有数据");
            map.put("count",total);
            map.put("data",users);
            return map;
        }
        map.put("code",1);
        map.put("msg","有数据");
        return map;
    }

    //删除用户信息
    @PostMapping("/del")
    public ResultObject del(@RequestParam("id")Long id,@SessionAttribute("admin")Admin admin){
        if (admin==null){
            return new ResultObject(0,"操作失败");
        }
        int del = userService.del(id);
        if (del>0){
            return new ResultObject(0,"删除成功");
        }
        return new ResultObject(0,"删除失败");
    }

    //修改是否正常冻结
    @PostMapping("/status")
    public  ResultObject status(@RequestParam("id")Long id,@RequestParam("status")String status
    ,HttpSession session){
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin==null){
            return new ResultObject(0,"操作失败");
        }
        User user = new User();
        if (StringUtils.equals(status,"1")){
            user.setStatus(UserEnum.HIDE);
            user.setId(id);
            int edit = userService.edit(user);
            if (edit==0){
                return new ResultObject(0,"修改失败");
            }
        }
        if (StringUtils.equals(status,"2")){
            user.setStatus(UserEnum.SHOW);
            user.setId(id);
            int edit = userService.edit(user);
            if (edit==0){
                return new ResultObject(0,"修改失败");
            }
        }
        return new ResultObject(1,"修改成功");
    }



}
