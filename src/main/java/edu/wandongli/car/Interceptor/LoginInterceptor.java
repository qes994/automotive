package edu.wandongli.car.Interceptor;

import edu.wandongli.car.pojo.User;
import edu.wandongli.car.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Component
public class LoginInterceptor implements HandlerInterceptor {


    UserService userService;
    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    /*
     * 视图渲染之后的操作
     */
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {

    }

    /*
     * 处理请求完成后视图渲染之前的处理操作
     */
    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
       HttpSession session = arg0.getSession();
        User SessionUser  = (User) session.getAttribute("user");
        User user = userService.findUserById(SessionUser.getId());
        if (arg3 != null) {
           arg3.addObject("user",user);
            String controller =((HandlerMethod)arg2).getBeanType().getSimpleName();
            System.out.println("那个控制器"+controller);
            String method=((HandlerMethod)arg2).getMethod().getName();
            arg3.addObject("controller",controller);
            arg3.addObject("method",method);
        }

    }

    /*
     * 进入controller层之前拦截请求
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //PrintWriter writer = response.getWriter();
        if(user!=null){
            session.setAttribute("user",user);
            return  true;
        }else {
            response.sendRedirect("/user/login");
            return false;
        }
    }


}
