package com.zjnu.controller.back;

import com.zjnu.redis.JedisUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/1.
 */
@Controller
public class PageController {

    @RequestMapping("/404")
    public String un(){
        return "404";
    }

    @RequestMapping("/logout")
    public String logout() {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        return "back/login";
    }

    @RequestMapping("/l")
    public String toLogin(){
        return "back/login";
    }

    @RequestMapping("/b")
    public String toBack() throws IOException {
        return "back/main";
    }
    @RequestMapping("/adver")
    public String adver() {
        return "back/adver";
    }
    @RequestMapping("/addAdver")
    public String addAdver() {
        return "back/addAdver";
    }


    @RequestMapping("/articleComments")
    public String articleComments() {
        return "back/articleComments";
    }

    @RequestMapping("/articleKind")
    public String articleKind() {
        return "back/articleKind";
    }

    @RequestMapping("/chart")
    public String chart() {
        return "back/chart";
    }


    @RequestMapping("/mesboard")
    public String mesboard() {
        return "back/mesboard";
    }






    @RequestMapping("/clearRedis")
    @ResponseBody
    public void clearRedis() {
        JedisUtil.getJedis().flushDB();
    }

}
