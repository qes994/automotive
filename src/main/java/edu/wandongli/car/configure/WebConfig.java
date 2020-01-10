package edu.wandongli.car.configure;

import edu.wandongli.car.Interceptor.AdminLoginInterceptor;
import edu.wandongli.car.Interceptor.LoginInterceptor;
import edu.wandongli.car.Interceptor.OauthInterceptor;
import edu.wandongli.car.controller.home.OauthController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private LoginInterceptor loginInterceptor;

    @Autowired
    public void setLoginInterceptor(LoginInterceptor loginInterceptor) {
        this.loginInterceptor = loginInterceptor;
    }

    private AdminLoginInterceptor adminLoginInterceptor;
    @Autowired
    public void setAdminLoginInterceptor(AdminLoginInterceptor adminLoginInterceptor) {
        this.adminLoginInterceptor = adminLoginInterceptor;
    }
    private OauthInterceptor oauthInterceptor;
    @Autowired
    public void setOauthInterceptor(OauthInterceptor oauthInterceptor) {
        this.oauthInterceptor = oauthInterceptor;
    }




    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 自定义拦截器，添加拦截路径和排除拦截路径
        /*List<String> disable = new ArrayList<>();
        disable.add("/user/code");*/
        registry.addInterceptor(loginInterceptor)
                .excludePathPatterns("/user/code")
                .excludePathPatterns("/user/code1")
                .excludePathPatterns("/user/register")
                .excludePathPatterns("/user/login")
               /* .excludePathPatterns("/car/index")
                */
                .addPathPatterns("/oauth/**")
                //.excludePathPatterns("/home/**")
                .excludePathPatterns("/car/table")
                .addPathPatterns("/user/**")
                .addPathPatterns("/car/**")
                .addPathPatterns("/")
                .addPathPatterns("/issue/**");


        registry.addInterceptor(adminLoginInterceptor)
                .addPathPatterns("/admin/admin/**")
                .addPathPatterns("/index")
                .addPathPatterns("/admin/user/**")
                .addPathPatterns("/admin/issue/**")
                .excludePathPatterns("/admin/admin/login")
                .excludePathPatterns("/verification");
        registry.addInterceptor(oauthInterceptor)
                .excludePathPatterns("/oauth/github")
                .addPathPatterns("/oauth/**");


    }


}
