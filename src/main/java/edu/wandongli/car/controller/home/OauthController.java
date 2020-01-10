package edu.wandongli.car.controller.home;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.wandongli.car.util.GitHubConstantUtil;
import edu.wandongli.car.util.HttpClientUtils1;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;


@RestController
@RequestMapping("/oauth")
@Slf4j
public class OauthController {

    @GetMapping("/github")
    public ModelAndView github(ModelAndView modelAndView, HttpServletResponse response
    , @RequestParam(value = "code",required = false)String code,HttpSession session) throws IOException {
        String redirectUrl = "http://hh4h4r.natappfree.cc/oauth/github";
        if (StringUtils.isBlank(code)){
            String codeUrl="https://github.com/login/oauth/authorize?client_id=6a9e16a8ed59f8e33d0e&redirect_uri="+redirectUrl;
            response.sendRedirect(codeUrl);
        }
        System.out.println("验证码"+code);
        ObjectMapper mapper = new ObjectMapper();
        CloseableHttpClient client = HttpClients.createDefault();
        ArrayList<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("client_id","6a9e16a8ed59f8e33d0e"));
        params.add(new BasicNameValuePair("client_secret","47692c12a5e34c72e6df0f49ecddb2b18d8589f0"));
        params.add(new BasicNameValuePair("code",code));
        params.add(new BasicNameValuePair("redirect_uri",redirectUrl));
        try {
            UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(params,"utf-8");
            HttpPost httpPost = new HttpPost("https://github.com/login/oauth/access_token");
            httpPost.setEntity(urlEncodedFormEntity);
            httpPost.setHeader("Accept","application/json");
            CloseableHttpResponse response1 = client.execute(httpPost);
            if (response1.getStatusLine().getStatusCode()==200){
                HttpEntity entity = response1.getEntity();
                log.error(entity.toString());
                String assessTokenEntity = EntityUtils.toString(entity, "utf-8");
                Map map = mapper.readValue(assessTokenEntity, Map.class);
                String access_token = (String) map.get("access_token");
                System.out.println("token"+access_token);
                HttpGet httpGet = new HttpGet("https://api.github.com/user");
                httpGet.setHeader("Authorization","token "+access_token);
                CloseableHttpResponse response2 = client.execute(httpGet);
                if (response2.getStatusLine().getStatusCode()==200){
                    HttpEntity userEntity = response2.getEntity();
                    String userString = EntityUtils.toString(userEntity, "utf-8");
                    log.error(userString);
                    Map userMap = mapper.readValue(userString, Map.class);
                    System.out.println(userMap.toString());
                    String openId = (String) userMap.get("node_id");
                    System.out.println("openId"+openId);
                    session.setAttribute("openId",openId);
                    modelAndView.addObject("openId", openId);

                }


            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        modelAndView.setViewName("/home/car/index");
        return modelAndView;
    }






}
