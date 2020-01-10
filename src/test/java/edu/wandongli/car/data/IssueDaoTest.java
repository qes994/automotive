package edu.wandongli.car.data;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import edu.wandongli.car.AutomotiveApplicationTests;
import edu.wandongli.car.dao.AdminDao;
import edu.wandongli.car.dao.IssueDao;
import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.Issue;
import edu.wandongli.car.service.AdminService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class IssueDaoTest extends AutomotiveApplicationTests {

    @Autowired
    IssueDao issueDao;
    @Autowired
    AdminDao adminDao;
    @Autowired
    AdminService adminService;
    @Test
    public void getList(){
       String phone = "15939049221";
        Admin list = adminDao.getList(phone);
        System.out.println("111"+list);
    }
    @Test
    public void getList1(){
        String phone = "15939049221";
        Admin list = adminService.getListByphone(phone);
        System.out.println("111"+list);
    }

}
