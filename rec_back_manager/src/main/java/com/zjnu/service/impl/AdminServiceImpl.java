package com.zjnu.service.impl;

import com.zjnu.dao.AdminMapper;
import com.zjnu.dao.AdminRoleMapper;
import com.zjnu.dao.PermissionMapper;
import com.zjnu.dao.RolePermissionMapper;
import com.zjnu.model.*;
import com.zjnu.pojo.AdminRolesPermissions;
import com.zjnu.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;
    @Resource
    private PermissionMapper permissionMapper;
    @Resource
    private RolePermissionMapper rolePermissionMapper;
    @Resource
    private AdminRoleMapper adminRoleMapper;

    @Override
    public Admin findByAccount(String account) {
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andAdminNameEqualTo(account);
        List<Admin> admins = adminMapper.selectByExample(example);
        if (admins.size() > 0) {
            return admins.get(0);
        }
        return new Admin();
    }

    @Override
    public List<Admin> getAllAdmin() {
        AdminExample example = new AdminExample();
        List<Admin> admins = adminMapper.selectByExample(example);
        return admins;
    }

    @Override
    public List<AdminRolesPermissions> getAllAdminRolesPermissions() {
        AdminExample example = new AdminExample();
        List<Admin> admins = adminMapper.selectByExample(example);
        List<AdminRolesPermissions> adminRolesPermissions = new ArrayList<>();
        for (Admin admin : admins) {
            if (admin.getAdminId() == 1) {
                continue;
            }
            AdminRolesPermissions adminRolesPermissions1 = new AdminRolesPermissions();
            AdminRoleExample adminRoleExample = new AdminRoleExample();
            AdminRoleExample.Criteria criteria = adminRoleExample.createCriteria();
            criteria.andAdminIdEqualTo(admin.getAdminId());
            List<AdminRole> adminRoles = adminRoleMapper.selectByExample(adminRoleExample);
            String roles = "";
            String permissions = "";
            int i = 0;
            for (AdminRole adminRole : adminRoles) {
                if (i == 0) {
                    roles += adminRole.getRoleName();
                }else
                    roles += " , " + adminRole.getRoleName();

                RolePermissionExample rolePermissionExample = new RolePermissionExample();
                RolePermissionExample.Criteria criteria1 = rolePermissionExample.createCriteria();
                criteria1.andRoleIdEqualTo(adminRole.getRoleId());
                List<RolePermission> rolePermissions = rolePermissionMapper.selectByExample(rolePermissionExample);
                int j = 0;
                for (RolePermission rolePermission : rolePermissions) {
                    PermissionExample permissionExample = new PermissionExample();
                    PermissionExample.Criteria criteria2 = permissionExample.createCriteria();
                    criteria2.andPermissionIdEqualTo(rolePermission.getPermissionId());
                    List<Permission> permissions1 = permissionMapper.selectByExample(permissionExample);
                    for (Permission permission : permissions1) {
                        if (j == 0) {
                            permissions += permission.getPermissionName();
                        }else
                            permissions += " , " + permission.getPermissionName();
                        j++;
                    }
                }
                i++;
            }
            adminRolesPermissions1.setAdmin(admin);
            adminRolesPermissions1.setRoles(roles);
            adminRolesPermissions1.setPermission(permissions);
            adminRolesPermissions.add(adminRolesPermissions1);
        }
        return adminRolesPermissions;
    }
}
