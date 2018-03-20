package com.zjnu.service;

import com.zjnu.model.Permission;
import com.zjnu.model.Role;
import com.zjnu.model.RolePermission;
import com.zjnu.pojo.RolePermissionPojo;

import java.util.List;

public interface RoleService {

    RolePermissionPojo getAdminsRolesAndPermission(String account);

    List<RolePermission> getAllAuthInfo();

    List<Role> getAllRole();

    List<Permission> getAllPermission();

}
