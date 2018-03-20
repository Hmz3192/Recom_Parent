package com.zjnu.controller.back;

import com.zjnu.model.Permission;
import com.zjnu.model.Role;
import com.zjnu.model.RolePermission;
import com.zjnu.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class RolePermissionController {

    @Resource
    private RoleService roleAndPermissionService;

    @RequestMapping("/permission")
    public String per(Model model) {
        List<Permission> allPermission = roleAndPermissionService.getAllPermission();
        model.addAttribute("pe", allPermission);
        return "back/permission";
    }


    @RequestMapping("/role")
    public String role(Model model) {
        List<Role> allPermission = roleAndPermissionService.getAllRole();
        model.addAttribute("ro", allPermission);
        return "back/role";
    }
}
