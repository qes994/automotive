package edu.wandongli.car.Interceptor;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class OauthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String openId = (String)session.getAttribute("openId");
        if (!StringUtils.isBlank(openId)){
            session.setAttribute("openId",openId);
            return  true;
        }
        System.out.println("////////////////////////////");
        response.sendRedirect("/user/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        String openId = (String)session.getAttribute("openId");
        if (modelAndView!=null){
            //arg3.addObject("user",user);
            String controller =((HandlerMethod)handler).getBeanType().getSimpleName();
            System.out.println("那个控制器"+controller);
            String method=((HandlerMethod)handler).getMethod().getName();
            modelAndView.addObject("controller",controller);
            modelAndView.addObject("method",method);
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
