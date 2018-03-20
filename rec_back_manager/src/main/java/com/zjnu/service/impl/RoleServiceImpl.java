package com.zjnu.service.impl;

import com.zjnu.dao.*;
import com.zjnu.model.*;
import com.zjnu.pojo.RolePermissionPojo;
import com.zjnu.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private PermissionMapper permissionMapper;
    @Resource
    private AdminMapper adminMapper;
    @Resource
    private RolePermissionMapper rolePermissionMapper;
    @Resource
    private AdminRoleMapper adminRoleMapper;
    @Override
    public RolePermissionPojo getAdminsRolesAndPermission(String account) {
        RolePermissionPojo rolePermissionPojo = new RolePermissionPojo();
        rolePermissionPojo.setAccount(String.valueOf(account));

        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andAdminNameEqualTo(account);
        Integer adminId = adminMapper.selectByExample(adminExample).get(0).getAdminId();

        AdminRoleExample example = new AdminRoleExample();
        AdminRoleExample.Criteria criteria1 = example.createCriteria();
        criteria1.andAdminIdEqualTo(adminId);
        List<AdminRole> userRoles = adminRoleMapper.selectByExample(example);


        HashMap<String, String> rolesAndName = new HashMap<>();
        HashMap<String, String> permissionsAndUrl = new HashMap<>();
        Set<String> rolesKey = new HashSet<>();
        Set<String> permissionsKey = new HashSet<>();
        List<Integer> userRoleIds = new ArrayList<>();
        for(int i=0;i<userRoles.size();i++) {
            userRoleIds.add(userRoles.get(i).getRoleId());
        }

        RolePermissionExample rolePermissionExample = new RolePermissionExample();
        RolePermissionExample.Criteria criteria2 = rolePermissionExample.createCriteria();
        criteria2.andRoleIdIn(userRoleIds);
        List<RolePermission> rolePermissions = rolePermissionMapper.selectByExample(rolePermissionExample);
        for (AdminRole adminRole : userRoles) {
            rolesKey.add(adminRole.getRoleName());
            rolesAndName.put(String.valueOf(adminRole.getRoleId()), adminRole.getRoleName());
        }
        for (RolePermission rolePermission : rolePermissions) {
            permissionsKey.add(rolePermission.getPermissionUrl());
            permissionsAndUrl.put(String.valueOf(rolePermission.getPermissionId()), rolePermission.getPermissionUrl());
        }
//        rolePermissionPojo.setRolesAndName(rolesAndName);
//        rolePermissionPojo.setPermissionsAndUrl(permissionsAndUrl);
        rolePermissionPojo.setPermissionsKey(permissionsKey);
        rolePermissionPojo.setRolesKey(rolesKey);
        return rolePermissionPojo;
    }


    @Override
    public List<RolePermission> getAllAuthInfo() {
        RolePermissionExample rolePermissionExample = new RolePermissionExample();
        RolePermissionExample.Criteria criteria1 = rolePermissionExample.createCriteria();
        List<RolePermission> rolePermissions = rolePermissionMapper.selectByExample(rolePermissionExample);
        return rolePermissions;
    }

    @Override
    public List<Role> getAllRole() {
        RoleExample roleExample = new RoleExample();
        RoleExample.Criteria criteria = roleExample.createCriteria();
        List<Role> roles = roleMapper.selectByExample(roleExample);
        return roles;
    }

    @Override
    public List<Permission> getAllPermission() {
        PermissionExample roleExample = new PermissionExample();
        PermissionExample.Criteria criteria = roleExample.createCriteria();
        List<Permission> roles = permissionMapper.selectByExample(roleExample);
        return roles;
    }

}
