package com.zjnu.pojo;

import com.zjnu.model.Admin;

public class AdminRolesPermissions {

    private Admin admin;
    private String roles;
    private String permission;

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
