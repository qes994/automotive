
package edu.wandongli.car.Interceptor;


import edu.wandongli.car.pojo.Admin;
import edu.wandongli.car.pojo.Permission;
import edu.wandongli.car.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Component
public class AdminLoginInterceptor implements HandlerInterceptor {

    AdminService adminService;
    @Autowired
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {

    }


    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        HttpSession session = arg0.getSession();
        if (arg3 != null) {
            String phone = (String)session.getAttribute("phone");
            Admin list = adminService.getListByphone(phone);
              // arg3.addObject("admin",admin);
            String controller =((HandlerMethod)arg2).getBeanType().getSimpleName();
            String method=((HandlerMethod)arg2).getMethod().getName();
            arg3.addObject("controller",controller);
            arg3.addObject("method",method);
            System.out.println("------"+list);
            arg3.addObject("list",list);

        }

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin!=null){
        session.setAttribute("phone",admin.getPhone());
            return  true;
        }else {
            response.sendRedirect("/admin/admin/login");
            return false;
        }
    }


}

