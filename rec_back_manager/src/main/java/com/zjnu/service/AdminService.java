package com.zjnu.service;

import com.zjnu.model.Admin;
import com.zjnu.pojo.AdminRolesPermissions;

import java.util.List;

public interface AdminService {

    Admin findByAccount(String account);

    List<Admin> getAllAdmin();

    List<AdminRolesPermissions> getAllAdminRolesPermissions();
}
