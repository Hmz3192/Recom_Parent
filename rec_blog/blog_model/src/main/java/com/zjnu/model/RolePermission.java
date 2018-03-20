package com.zjnu.model;

import java.io.Serializable;

public class RolePermission implements Serializable {
    private Integer roleId;

    private Integer permissionId;

    private String permissionUrl;

    private String roleName;

    public RolePermission(Integer roleId, Integer permissionId, String permissionUrl, String roleName) {
        this.roleId = roleId;
        this.permissionId = permissionId;
        this.permissionUrl = permissionUrl;
        this.roleName = roleName;
    }

    public RolePermission() {
        super();
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionUrl() {
        return permissionUrl;
    }

    public void setPermissionUrl(String permissionUrl) {
        this.permissionUrl = permissionUrl == null ? null : permissionUrl.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
}