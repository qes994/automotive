package edu.wandongli.car.controller.admin;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.AdminRole;
import edu.wandongli.car.pojo.User;
import edu.wandongli.car.service.AdminService;
import edu.wandongli.car.service.UserService;
import edu.wandongli.car.util.EncryptUtil;
import edu.wandongli.car.util.ResultObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;


@RestController("index/admin")
@RequestMapping("/admin/admin")
@Validated
public class AdminController {

    @Autowired
    AdminService adminService;
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public ModelAndView login(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        session.removeAttribute("admin");
        modelAndView.setViewName("/admin/login");
        return modelAndView;
    }
    @PostMapping("/login")
    public ResultObject login(@RequestParam("phone")@NotBlank(message = "手机号不能为空")String phone
    ,                         @RequestParam("password")@NotBlank(message = "密码不能为空") String password,
                              @RequestParam("code")@NotBlank(message = "验证码不能为空")String code,
                              HttpSession session){
        Admin admin = new Admin();
        try {
            admin.setPassword(EncryptUtil.md5(password));
            admin.setPhone(phone);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return  new ResultObject(0,"系统繁忙");
        }
        if (!StringUtils.equals(code,(String)session.getAttribute("code"))){
            System.out.println(code);
            System.out.println("//////////////////////////////////");
            System.out.println((String)session.getAttribute("code"));
            return  new ResultObject(0,"验证码错误");
        }
        Admin MysqlAdmin = adminService.findAdmin(admin);
        if (MysqlAdmin==null){
            return  new ResultObject(0,"密码或手机号错误");
        }


        session.setAttribute("admin",admin);
        return  new ResultObject(1,"登录成功");
    }

    //添加管理员
    @GetMapping("/addAdmin")
    public ModelAndView addAdmin(HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");

        ModelAndView modelAndView = new ModelAndView();
        Admin adminByPhone = adminService.findAdminByPhone(admin.getPhone());
        modelAndView.addObject("admin",adminByPhone);
        modelAndView.setViewName("/admin/admin/add");
        return modelAndView;
    }
    //添加管理员
    @GetMapping("/add")
    public  ModelAndView add(@SessionAttribute("admin")Admin admin){
        ModelAndView mv = new ModelAndView();
        Admin mysqlAdmin = adminService.findAdminByPhone(admin.getPhone());
        mv.addObject("admin",mysqlAdmin);
        mv.setViewName("/admin/admin/addAdmin");
        return mv;
    }

    @PostMapping("/addAdmin")
    public ResultObject addAdmin(@RequestBody @Validated Admin admin){
        Long roleId = admin.getRoleId();
        System.out.println("角色idcon"+roleId);
        String phone = admin.getPhone();
        Admin admin1 = adminService.findAdminByPhone(phone);
        if (admin1!=null){
            return new ResultObject(0,"此手机号已经被注册");
        }
        try {
            admin.setPassword(EncryptUtil.md5(admin.getPhone()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return new ResultObject(0,"系统繁忙");
        }
        //admin.setPermission(1);
        admin.setCreateTime(new Date());
        int i = adminService.addAdmin(admin);
        if (i>0){
            return new ResultObject(1,"添加成功");
        }
        return new ResultObject(0,"添加失败");
    }
    //管理员列表
    @GetMapping("/index")
    public ModelAndView index(@SessionAttribute("admin")Admin admin){
        ModelAndView modelAndView = new ModelAndView();
        Admin adminByPhone = adminService.findAdminByPhone(admin.getPhone());
        modelAndView.addObject("admin",adminByPhone);
        modelAndView.setViewName("/admin/admin/index");
        return modelAndView;
    }
    @PostMapping("/index")
    public ModelMap index(@RequestParam(defaultValue = "1") Integer page,Integer limit,@RequestParam(value = "name",required = false) String name){
        ModelMap map = new ModelMap();
        IPage<Admin> list = adminService.getList(page, limit, name);
        List<Admin> records = list.getRecords();
        long total = list.getTotal();
        if (list!=null){
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
    @GetMapping("/update")
    public ModelAndView update(@RequestParam("id")Long id){
        Admin admin = new Admin();
        admin.setId(id);
        Admin mysqlAdmin = adminService.findAdminByAdmin(admin);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("admin",mysqlAdmin);
        modelAndView.setViewName("/admin/admin/update");
        return modelAndView;
    }
    @PostMapping("/update")
    public ModelMap update(@RequestBody  Admin admin){
        ModelMap map = new ModelMap();
        int update = adminService.update(admin);
        if (update==0){
            map.put("code",0);
            map.put("msg","修改失败");
            return map;
        }
        map.put("code",1);
        map.put("msg","修改成功");
        return map;
    }
    @PostMapping("/del")
    public ModelMap del(@RequestParam("id")Long id){
        ModelMap map = new ModelMap();
        int del = adminService.del(id);
        if (del==0){
            map.put("code",0);
            map.put("msg","删除失败");
            return map;
        }
        map.put("code",1);
        map.put("msg","删除成功");
        return map;
    }







}
