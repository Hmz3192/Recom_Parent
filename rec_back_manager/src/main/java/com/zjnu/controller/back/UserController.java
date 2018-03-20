package com.zjnu.controller.back;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjnu.model.Admin;
import com.zjnu.model.Article;
import com.zjnu.model.User;
import com.zjnu.pojo.AdminRolesPermissions;
import com.zjnu.pojo.PageResult;
import com.zjnu.pojo.RolePermissionPojo;
import com.zjnu.service.AdminService;
import com.zjnu.service.RoleService;
import com.zjnu.service.UserService;
import com.zjnu.utils.CipherUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/14.
 */
@Controller
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private AdminService adminService;
    @Resource
    private RoleService roleService;
    @RequestMapping("/tl")
    public String login(String adminName, String password, HttpSession session) throws Exception {
        UsernamePasswordToken token = new UsernamePasswordToken(adminName, CipherUtil.md5Pwd(password, adminName));
        Subject currentUser = SecurityUtils.getSubject();
        try {
            if (!currentUser.isAuthenticated()){//使用shiro来验证
//                token.setRememberMe(true);
                currentUser.login(token);//验证角色和权限
            }
            session.setAttribute("user", adminName);
            System.out.println("验证成功: ");
            return "back/main";
        } catch (Exception e) {
            System.out.println("验证失败"+e.getMessage());
            return "back/login";
        }
    }


    @RequestMapping("/manager/{currentPage}/{rows}")
    public String manager(Model model, @PathVariable("currentPage") Integer currentPage,@PathVariable("rows") Integer rows) {
        PageHelper.startPage(currentPage, rows);
        List<AdminRolesPermissions> allAdmin = adminService.getAllAdminRolesPermissions();
        PageInfo<AdminRolesPermissions> info = new PageInfo<AdminRolesPermissions>(allAdmin);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, allAdmin, currentPage);
        model.addAttribute("pga", pageResult);
        return "back/manager";
    }


    @RequestMapping("/vip/{currentPage}/{rows}")
    public String vip(Model model, @PathVariable("currentPage") Integer currentPage,@PathVariable("rows") Integer rows) {
        PageHelper.startPage(currentPage, rows);
        List<User> vip = userService.getVip();
        PageInfo<User> info = new PageInfo<User>(vip);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, vip, currentPage);
        model.addAttribute("pga", pageResult);
        return "back/vip";
    }

    @RequestMapping("/user/{currentPage}/{rows}")
    public String common(Model model, @PathVariable("currentPage") Integer currentPage,@PathVariable("rows") Integer rows) {
        PageHelper.startPage(currentPage, rows);
        List<User> common = userService.getCommon();
        PageInfo<User> info = new PageInfo<User>(common);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, common, currentPage);
        model.addAttribute("pga", pageResult);
        return "back/user";
    }

}
