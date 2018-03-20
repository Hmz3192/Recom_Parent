package com.zjnu.model;

import java.io.Serializable;

public class AdminRole implements Serializable{
    private Integer adminId;

    private Integer roleId;

    private String roleName;

    public AdminRole(Integer adminId, Integer roleId, String roleName) {
        this.adminId = adminId;
        this.roleId = roleId;
        this.roleName = roleName;
    }

    public AdminRole() {
        super();
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
}